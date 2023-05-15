import 'dart:async';

import 'package:atticadesign/Api/api.dart';
import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Helper/productDetails.dart';
import 'package:atticadesign/Model/products_model.dart';
import 'package:atticadesign/Model/sub_categori_goldorsilver.dart';
import 'package:atticadesign/Model/sub_category_model.dart';
import 'package:atticadesign/Utils/ApiBaseHelper.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/Session.dart';
import 'package:atticadesign/Utils/colors.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:atticadesign/Utils/widget.dart';
import 'package:atticadesign/screen/delivery_goldOrSilver.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DeliveryProducts extends StatefulWidget {
  final bool? type;
  final String? goldGrams, silverGrams;
  DeliveryProducts({Key? key, this.type, this.goldGrams, this.silverGrams})
      : super(key: key);

  @override
  State<DeliveryProducts> createState() => _DeliveryProductsState();
}

class _DeliveryProductsState extends State<DeliveryProducts> {
  String type = "48";

  double? makingCharges;
  double goldRate = 0;
  double silverRate = 0;
  double? getCalculateMakingPrice(
      double grams, price, makingPercent) {
    makingCharges = grams * price * makingPercent / 100;
    return makingCharges;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goldRate = double.parse(App.localStorage.getString("goldPrice").toString());
    silverRate =
        double.parse(App.localStorage.getString("silverPrice").toString());

    // productSubCategoriesCategoriesWiseList(catGold).then((value) => {
    //       if (value != null)
    //         {
    //           setState(() {
    //             isDone = true;
    //           })
    //         }
    //     });
  }

  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;
  bool loading = true;
  List<String> catList = [];
  bool fav = false;

  addFav(vId) async {
    await App.init();
    isNetwork = await isNetworkAvailable();
    if (isNetwork) {
      try {
        Map data;
        data = {
          "product_id": vId,
          "user_id": App.localStorage.getString("userId").toString(),
        };
        print("vId----$vId");
        Map response = await apiBase.postAPICall(
            Uri.parse(baseUrl + "add_to_favorites"), data);
        print(response);
        setState(() {
          fav = false;
        });
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          fav = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        fav = false;
      });
    }
  }

  addFavRemove(vId) async {
    await App.init();
    isNetwork = await isNetworkAvailable();
    if (isNetwork) {
      try {
        Map data;
        data = {
          "product_id": vId,
          "user_id": App.localStorage.getString("userId").toString(),
        };
        Map response = await apiBase.postAPICall(
            Uri.parse(baseUrl + "remove_from_favorites"), data);
        print(response);
        bool status = true;
        String msg = response['message'];
        setState(() {
          fav = false;
        });
        setSnackbar(msg, context);
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          fav = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        fav = false;
      });
    }
  }

  String catGold = "54", sub = "", catSilver = "55", subSilver = "";
  String tapIndex = "0";
  int isSelected = 0;
  bool isGold = true;
  String a = "All";
  bool isDone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/homepage/vertical.png',
                ),
                fit: BoxFit.cover,
              )),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 15.0),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: isGold ? Colors.green : Colors.grey,
                              border: Border.all(
                                  color:
                                      isGold ? Colors.green : Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0) //
                                      ),
                            ),
                            child: InkWell(
                              onTap: () {
                                productSubCategoriesCategoriesWiseList(catGold);
                                setState(() {
                                  isGold = !isGold;
                                  topRated = "0";
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/homepage/gold.png',
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Gold',
                                      style: TextStyle(
                                        color: isGold
                                            ? Colors.white
                                            : Color(0xff0C3B2E),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 15),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: !isGold ? Colors.green : Colors.grey,
                              border: Border.all(
                                  color:
                                      !isGold ? Colors.green : Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0) //
                                      ),
                            ),
                            child: InkWell(
                              onTap: () {
                                productSubCategoriesCategoriesWiseList(
                                    catSilver);
                                setState(() {
                                  isGold = !isGold;
                                  topRated = "0";
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/homepage/silverbrick.png',
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Silver',
                                      style: TextStyle(
                                        color: !isGold
                                            ? Colors.white
                                            : Color(0xff0C3B2E),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 5.0, top: 15, right: 5, bottom: 5),
                //   child: Row(
                //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 14.0, right: 0),
                //         child: Text(
                //           'Categories',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 15,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           height: 40,
                //           margin: EdgeInsets.only(right: 70, top: 5),
                //           child: isDone
                //               ? Center(
                //             child: FutureBuilder(
                //                 future:
                //                 productSubCategoriesCategoriesWiseList(
                //                     isGold ? catGold : catSilver),
                //                 builder: (BuildContext context,
                //                     AsyncSnapshot snapshot) {
                //                   SubCategoriGoldorsilver model =
                //                       snapshot.data;
                //                   List<String> listCat = [];
                //                   isDone = true;
                //                   if (model != null &&
                //                       model.data != null &&
                //                       model.data!.length > 0) {
                //                     model.data!.forEach((element) {
                //                       listCat
                //                           .add(element.name.toString());
                //                     });
                //                   }
                //                   if (snapshot.connectionState ==
                //                       ConnectionState.done) {
                //                     if (snapshot.hasData) {
                //                       return model.error == false
                //                           ? listCat.length > 0
                //                           ? Padding(
                //                         padding:
                //                         const EdgeInsets
                //                             .only(
                //                             left: 40.0),
                //                         child: DropdownButton<
                //                             String>(
                //                           iconSize:
                //                           getHeight(40),
                //                           isDense: true,
                //                           isExpanded: true,
                //                           icon: Icon(
                //                               Icons
                //                                   .keyboard_arrow_down_outlined,
                //                               size: 20),
                //                           iconEnabledColor:
                //                           MyColorName
                //                               .primaryDark,
                //                           value: a,
                //                           dropdownColor:
                //                           Colors.white,
                //                           borderRadius:
                //                           BorderRadius.all(
                //                               Radius
                //                                   .circular(
                //                                   5.0)),
                //                           elevation: 16,
                //                           style:
                //                           const TextStyle(
                //                               color: Colors
                //                                   .white),
                //                           underline:
                //                           SizedBox.shrink(),
                //                           items: listCat
                //                               .map((fc) =>
                //                               DropdownMenuItem<
                //                                   String>(
                //                                 child:
                //                                 Container(
                //                                   margin: EdgeInsets.only(
                //                                       left:
                //                                       0),
                //                                   child: Center(
                //                                       child: Text(
                //                                         fc,
                //                                         style: TextStyle(
                //                                             fontSize:
                //                                             14,
                //                                             fontWeight:
                //                                             FontWeight.bold,
                //                                             color: Colors.grey),
                //                                       )),
                //                                 ),
                //                                 value: fc,
                //                               ))
                //                               .toList(),
                //                           onChanged: (newValue) {
                //                             setState(() {
                //                               a = newValue!;
                //                               int index = listCat
                //                                   .indexOf(a
                //                                   .toString());
                //                               if (index != 0) {
                //                                 _getData(
                //                                     model
                //                                         .data![
                //                                     index]
                //                                         .products![
                //                                     index]
                //                                         .categoryId
                //                                         .toString(),
                //                                     model
                //                                         .data![
                //                                     index]
                //                                         .products![
                //                                     index]
                //                                         .subCategoryId
                //                                         .toString(),
                //                                     topRated,
                //                                     orderType);
                //                               }
                //                               setState(() {
                //                                 topRated = "0";
                //                                 isSelected =
                //                                     index;
                //                                 if (isGold) {
                //                                   if (index ==
                //                                       0) {
                //                                     productSubCategoriesCategoriesWiseList(
                //                                         catGold);
                //                                   } else {
                //                                     catGold = model
                //                                         .data![
                //                                     index]
                //                                         .products![
                //                                     index]
                //                                         .categoryId
                //                                         .toString();
                //                                   }
                //                                 } else {
                //                                   if (index ==
                //                                       0) {
                //                                     productSubCategoriesCategoriesWiseList(
                //                                         catSilver);
                //                                   } else {
                //                                     catSilver = model
                //                                         .data![
                //                                     index]
                //                                         .products![
                //                                     index]
                //                                         .categoryId
                //                                         .toString();
                //                                   }
                //                                 }
                //                                 sub = index != 0
                //                                     ? model
                //                                     .data![
                //                                 index]
                //                                     .products![
                //                                 index]
                //                                     .subCategoryId
                //                                     .toString()
                //                                     : "";
                //                                 setState(() {});
                //                               });
                //                             });
                //                           },
                //                         ),
                //                       )
                //                           : SizedBox()
                //                           : SizedBox();
                //                     } else if (snapshot.hasError) {
                //                       return Icon(Icons.error_outline);
                //                     }
                //                   } else if (snapshot.connectionState ==
                //                       ConnectionState.waiting) {
                //                     return SizedBox();
                //                   }
                //                   return Container(
                //                     width: 40,
                //                     height: 40,
                //                     child: Center(
                //                       child: CircularProgressIndicator(
                //                         strokeWidth: 1,
                //                       ),
                //                     ),
                //                   );
                //                 }),
                //           )
                //               : SizedBox(),
                //         ),
                //       ),
                //       GestureDetector(
                //         behavior: HitTestBehavior.translucent,
                //         onTap: () {
                //           bottomSheet();
                //         },
                //         child: Row(
                //           children: [
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Image.asset(
                //               'assets/buydigitalgold/filter.png',
                //               height: 20,
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Text(
                //               'Filters',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 15,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Expanded(
                  child: FutureBuilder(
                      future: _getData(isGold ? catGold : catSilver, sub,
                          topRated, orderType),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData && snapshot.data != null) {
                            SubCategoryModel model = snapshot.data;
                            List<SubCategoryModel>? lista = [];
                            model.product!.forEach((element) {
                              lista.add(model);
                            });
                            return model.error == false
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 50),
                                    width: getWidth(350),
                                    child: lista.length > 0
                                        ? GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 250,
                                                    childAspectRatio: 0.57,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 8),
                                            itemCount: lista.length,
                                            itemBuilder:
                                                (BuildContext ctx, index) {
                                              return InkWell(
                                                onTap: () async {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             ProductDetailsScreen(
                                                  //                 model
                                                  //                     .product![
                                                  //                 index]
                                                  //                     .id,
                                                  //                 isGold)));
                                                },
                                                child: Container(
                                                  // height: 200,
                                                  decoration: boxDecoration(
                                                    radius: 24.sp,
                                                    bgColor: Color(0xff004B3F),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        //  height: 150,
                                                        child: commonHWImage(
                                                            model
                                                                .product![index]
                                                                .image,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                5,
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                            "",
                                                            context,
                                                            "assets/homepage/gold.png"),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .only(
                                                            topLeft: const Radius
                                                                .circular(10.0),
                                                            topRight: const Radius
                                                                .circular(10.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2,
                                                                horizontal: 4),
                                                        width: double.infinity,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            text(
                                                                getString1(model
                                                                    .product![
                                                                        index]
                                                                    .name
                                                                    .toString()),
                                                                maxLine: 1,
                                                                // overFlow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    fontMedium,
                                                                fontSize:
                                                                    12.sp),
                                                            text(
                                                                getString1(model
                                                                        .product![
                                                                            index]
                                                                        .weight
                                                                        .toString()) +
                                                                    " gms",
                                                                fontFamily:
                                                                    fontMedium,
                                                                textColor: Color(
                                                                    0xffF1D459),
                                                                fontSize:
                                                                    11.sp),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                // text(
                                                                //     "Making Charges:",
                                                                //     fontFamily:
                                                                //         fontMedium,
                                                                //     textColor:
                                                                //         Color(
                                                                //             0xffF1D459),
                                                                //     fontSize:
                                                                //         11.sp),
                                                                text(
                                                                  isGold ?
                                                                  "Making Charges: ₹ ${getCalculateMakingPrice(double.parse(model.product![index].weight.toString()), double.parse(goldRate.toString()), 3)!.toStringAsFixed(2)}"
                                                                  :  "Making Charges: ₹ ${getCalculateMakingPrice(double.parse(model.product![index].weight.toString()), double.parse(silverRate.toString()), 3)!.toStringAsFixed(2)}",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  maxLine: 2,
                                                                  fontSize: 11,
                                                                  textColor: Color(
                                                                      0xffF1D459),)
                                                              ],
                                                            ),

                                                            // text(
                                                            //       getString1(model
                                                            //           .product![
                                                            //       index]
                                                            //           .variants![
                                                            //       0]
                                                            //           .weight
                                                            //           .toString())
                                                            //   +"gms",
                                                            //   fontFamily:
                                                            //   fontMedium,
                                                            //   fontSize: 10.sp,
                                                            //   textColor: Color(
                                                            //       0xffF1D459),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                     const SizedBox(height: 10,),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize: Size(100, 25),
                                                                  primary: colors
                                                                      .grad1Color),
                                                          onPressed: () {
                                                            print(
                                                                "this is product ID ***** ${model.product![index].id.toString()}");
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AddNewAddressDelivery(
                                                                              typeGOldOrSilver: true,
                                                                              productIds: model.product![index].id.toString(),
                                                                              goldGrams: widget.goldGrams.toString(),
                                                                              // availeGoldgram.toStringAsFixed(2),
                                                                              silverGrams: widget.silverGrams.toString(),
                                                                              requiredGrams: model.product![index].weight.toString(),
                                                                              //availebaleSilveGram.toStringAsFixed(2),
                                                                            )));
                                                          },
                                                          child: Text(
                                                            "Buy Now",
                                                            style: TextStyle(
                                                                color: colors
                                                                    .primary),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                        : Container(
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1,
                                              ),
                                            ),
                                          ),
                                  )
                                : Container(
                                    child: Text("No Data"),
                                  );
                          } else if (snapshot.hasError ||
                              snapshot.data == null) {
                            return Center(
                              child: Text("Products not found!", style: TextStyle(
                                color: colors.grad1Color
                              ),),
                            );
                          }
                        }
                        return Container(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          ),
                        );
                      }),
                ),
                // SizedBox(
                //   height: 70,
                // )
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  var typeSelect = "0";
  bool isCash = false;

  void bottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Color(0xff0C3B2E),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Text(
                  "Filter By",
                  style: TextStyle(color: Colors.orange),
                ),
                trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    orderType = "ASC";
                    topRated = "0";
                    _getData(catGold, sub, topRated, orderType);
                    Navigator.pop(context);
                  });
                  /*setState(() {
                    typeSelect = "1";
                    isCash = false;
                    Navigator.pop(context);
                  });*/
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "Price low to high",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    orderType = "DESC";
                    topRated = "0";
                    _getData(catGold, sub, topRated, orderType);
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Price high to low",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    topRated = "1";
                    _getData(catGold, sub, topRated, orderType);
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular Items",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }

  String orderType = "ASC";
  String topRated = "0";

  Future<SubCategoryModel?> _getData(cat, sub, topRated, orderType) async {
    SubCategoryModel? a =
        await productSubCategoriesCategoriesWise(cat, sub, orderType, topRated, "2");
    if (a != null && a.product != null) {
      return a;
    }
    return null;
  }
}
