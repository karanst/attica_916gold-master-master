import 'dart:async';

import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Helper/myCart.dart';
import 'package:atticadesign/Helper/productDetails.dart';
import 'package:atticadesign/Model/cart_model.dart';
import 'package:atticadesign/Model/products_model.dart';
import 'package:atticadesign/Utils/ApiBaseHelper.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/Session.dart';
import 'package:atticadesign/Utils/colors.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Api/api.dart';
import '../Model/category_model.dart';
import '../Model/sub_categori_goldorsilver.dart';
import '../Model/sub_category_model.dart';
import '../Utils/widget.dart';

class jewerry extends StatefulWidget {
  const jewerry({Key? key}) : super(key: key);

  @override
  State<jewerry> createState() => _jewerryState();
}

class _jewerryState extends State<jewerry> {
  String type = "48";
  bool isDone = true;
  String a = "All";
  // String a = "All";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
    // productSubCategoriesCategoriesWiseListJewellery(catGold).then((value) => {
    //       if (value != null)
    //         setState(() {
    //           isDone = true;
    //         })
    //     });
  }

  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;
  bool loading = true;
  List<CategoryModel> catList = [];
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
  int count = 0 ;
  int totalCount = 0;
  List<CartData> cartList = [];

  getCart() async {
    try {
      setState(() {
        cartList.clear();
      });
      Map params = {
        "get_user_cart": "1",
        "user_id": App.localStorage.getString("userId").toString(),
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_user_cart"), params);
      if (!response['error']) {
        cartList.clear();
        for (var v in response['cart_data']) {
          setState(() {
            cartList.add(CartData.fromJson(v));
          });
        }
      }
      totalCount = cartList.length;
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF15654F),
          title: Text(
            "Jewellery",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCart()));
                if (result == true) {
                  setState(() {
                    count = 0;
                    totalCount = 0;
                  });
                  // loading = false;
                  getCart();
                  // getProductById();
                  //getProductRating();
                  Future.delayed(Duration(seconds: 2), () {
                    loading = true;
                  });
                }
              },
              child: Image.asset(
                "assets/images/shop.png",
                height: 20,
                width: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Color(0xffF1D459), shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "${totalCount.toString()}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
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
                            _getData(catGold, sub, topRated, orderType);
                            // productSubCategoriesCategoriesWiseList(catGold);
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
                            _getData(catSilver, sub, topRated, orderType);
                            // productSubCategoriesCategoriesWiseList(
                            //     catSilver);
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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ///OLD FILTER DROPDOWN////////////////////
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Container(
                            height: 40,
                           width: 121,
                           // margin: EdgeInsets.only(left: 20, right: 10),
                            child: isDone
                                ? FutureBuilder(
                                    future: productSubCategoriesCategoriesWiseListJewellery(
                                            isGold ? catGold : catSilver, ''),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      SubCategoriGoldorsilver model =
                                          snapshot.data;
                                      List<String> listCat = [];
                                      isDone = true;
                                      if (model != null &&
                                          model.data != null &&
                                          model.data!.length > 0) {
                                        model.data!.forEach((element) {
                                          listCat.add(element.name.toString());
                                        });
                                        print("this is category data ${listCat.length} ");
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasData) {
                                          return model.error == false
                                              ? listCat.length > 0
                                                  ? DropdownButton<String>(
                                            icon: Icon(Icons.keyboard_arrow_down, color: colors.grad1Color,),
                                                      isExpanded: false,
                                                      value: a,
                                                      dropdownColor: colors.primary,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(
                                                            5.0)),
                                                      elevation: 16,
                                                      style: const TextStyle(
                                                    color: Colors.white),
                                                      underline:
                                                    SizedBox.shrink(),
                                                      items: listCat
                                                    .map((fc) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          child: Container(
                                                            // margin: EdgeInsets.only(left: 10),
                                                            child: Center(
                                                                child: Text(
                                                              fc,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: colors.grad1Color
                                                                      ),
                                                            )),
                                                          ),
                                                          value: fc,
                                                        ))
                                                    .toList(),
                                                      onChanged: (newValue) {
                                                  setState(() {
                                                    a = newValue!;
                                                    int index =
                                                        listCat.indexOf(
                                                            a.toString());
                                                    if (index != 0) {
                                                      print("this is category id ${model
                                                          .data![index].id.toString()
                                                          // .products![index]
                                                          // .categoryId
                                                          // .toString()
                                                      }");
                                                      _getData(
                                                          // model
                                                          //     .data![index]
                                                          //     .products![index]
                                                          //     .categoryId
                                                          //     .toString(),
                                                          model.data![index].id.toString(),
                                                          model
                                                              .data![index].id.toString(),
                                                              // .products![index]
                                                              // .subCategoryId
                                                              // .toString(),
                                                          topRated,
                                                          orderType
                                                      );
                                                    }

                                                    setState(() {
                                                      topRated = "0";
                                                      productSubCategoriesCategoriesWiseListJewellery(
                                                          catGold,
                                                          model
                                                              .data![index].id.toString()
                                                        // .products![index]
                                                        // .subCategoryId
                                                        // .toString()
                                                      );
                                                      isSelected = index;
                                                      // if (isGold) {
                                                      //   if (index == 0) {
                                                      //     productSubCategoriesCategoriesWiseListJewellery(
                                                      //         catGold,
                                                      //         model
                                                      //             .data![index].id.toString()
                                                      //             // .products![index]
                                                      //             // .subCategoryId
                                                      //             // .toString()
                                                      //     );
                                                      //   } else {
                                                      //     catGold = model
                                                      //         .data![
                                                      //             index].id.toString();
                                                      //         // .products![
                                                      //         //     index]
                                                      //         // .categoryId
                                                      //         // .toString();
                                                      //   }
                                                      // } else {
                                                      //   if (index == 0) {
                                                      //     productSubCategoriesCategoriesWiseListJewellery(
                                                      //         catSilver,
                                                      //         model
                                                      //             .data![index]
                                                      //             .products![index]
                                                      //             .subCategoryId
                                                      //             .toString());
                                                      //   } else {
                                                      //     catSilver = model
                                                      //         .data![
                                                      //             index]
                                                      //         .products![
                                                      //             index]
                                                      //         .categoryId
                                                      //         .toString();
                                                      //   }
                                                      // }
                                                      sub = index != 0
                                                          ? model
                                                              .data![
                                                                  index].id.toString()
                                                              // .products![
                                                              //     index]
                                                              // .subCategoryId
                                                              // .toString()
                                                          : "";
                                                      setState(() {});
                                                    });
                                                  });
                                                      },
                                                    )
                                                  : SizedBox()
                                              : SizedBox();
                                        } else if (snapshot.hasError) {
                                          return Text('Product not found!!',
                                          style: TextStyle(
                                            color: MyColorName.primaryDark
                                          ),);
                                        }
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return SizedBox();
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
                                    })
                                : SizedBox(),
                          ),
                        ),
                        ///OLD FILTER DROPDOWN////////////////////
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            bottomSheet();
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/buydigitalgold/filter.png',
                                height: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /*   Container(
                        height: 50,
                        child: FutureBuilder(
                            future: productSubCategoriesCategoriesWiseListJewellery(
                                isGold ? catGold : catSilver),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              SubCategoriGoldorsilver model = snapshot.data;
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return model.error == false
                                      ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: model.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, index) {
                                        return Container(
                                            padding: const EdgeInsets.all(3.0),
                                            decoration: BoxDecoration(
                                              color: isSelected == index
                                                  ? Colors.green
                                                  : Color(0xffF1D459),
                                              border: Border.all(
                                                  color: isSelected == index
                                                      ? Colors.green
                                                      : Color(0xffF1D459)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7.0) //
                                              ),
                                            ),
                                            margin: EdgeInsets.all(8),
                                            child: GestureDetector(
                                              onTap: () async {
                                                if(index != 0){
                                                  _getData(
                                                      model
                                                          .data![index]
                                                          .products![index]
                                                          .categoryId
                                                          .toString(),
                                                      model
                                                          .data![index]
                                                          .products![index]
                                                          .subCategoryId
                                                          .toString(), topRated, orderType);
                                                }

                                                setState(() {
                                                  topRated = "0";

                                                  isSelected = index;
                                                  if (isGold) {
                                                    if (index == 0) {
                                                      productSubCategoriesCategoriesWiseListJewellery(catGold);
                                                    } else {
                                                      catGold = model
                                                          .data![index]
                                                          .products![index]
                                                          .categoryId
                                                          .toString();
                                                    }
                                                  } else {
                                                    if (index == 0) {
                                                      productSubCategoriesCategoriesWiseListJewellery(catSilver);
                                                    } else {
                                                      catSilver = model
                                                          .data![index]
                                                          .products![index]
                                                          .categoryId
                                                          .toString();
                                                    }
                                                  }
                                                  sub = index != 0
                                                      ? model
                                                      .data![index]
                                                      .products![index]
                                                      .subCategoryId
                                                      .toString()
                                                      : "";
                                                  setState(() {});
                                                });
                                              },
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                                  child: Text(
                                                    "${model.data![index].name.toString()}",
                                                    style:
                                                    TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ));
                                      })
                                      : Container(
                                    child: Text("No Data"),
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                }
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ),
                                  ),
                                );
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
                      ),*/

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
                                          ? Padding(
                                            padding: const EdgeInsets.only(bottom: 25.0),
                                            child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                                        maxCrossAxisExtent: 250,
                                                        childAspectRatio: 0.66,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 8),
                                                itemCount: lista.length,
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProductDetailsScreen(
                                                                      model
                                                                          .product![
                                                                              index]
                                                                          .id, isGold)));
                                                    },
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(27))
                                                      ),
                                                      elevation: 3,
                                                      child: Container(

                                                        decoration: boxDecoration(
                                                          radius: 22.sp,
                                                          bgColor: Color(0xff004B3F),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: commonHWImage(
                                                                  model
                                                                      .product![index]
                                                                      .image,
                                                                  160.0,
                                                                  // MediaQuery.of(
                                                                  //             context)
                                                                  //         .size
                                                                  //         .height /
                                                                  //     5,
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
                                                                      .circular(15.0),
                                                                  topRight: const Radius
                                                                      .circular(15.0),
                                                                ),
                                                              ),
                                                              padding: EdgeInsets.only(top: 15),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical: 4,
                                                                        horizontal:
                                                                            4),
                                                                width:
                                                                    double.infinity,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const SizedBox(height: 8,),
                                                                    Text(model
                                                                        .product![
                                                                    index]
                                                                        .name
                                                                        .toString(),
                                                                      maxLines: 2,
                                                                      style: TextStyle(
                                                                      color: Colors.white,
                                                                      overflow: TextOverflow.ellipsis,
                                                                        fontWeight: FontWeight.w600
                                                                    ),),
                                                                    // text(
                                                                    //     getString1(model
                                                                    //         .product![
                                                                    //             index]
                                                                    //         .name
                                                                    //         .toString()),
                                                                    //     fontFamily:
                                                                    //         fontMedium,
                                                                    //     fontSize:
                                                                    //         9.sp),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          text(
                                                                            "₹ " +
                                                                                getString1(model
                                                                                    .product![
                                                                                index]
                                                                                    .variants![
                                                                                0]
                                                                                    .specialPrice
                                                                                    .toString()),
                                                                            fontFamily:
                                                                            fontMedium,
                                                                            fontSize: 10.sp,
                                                                            textColor: Color(
                                                                                0xffF1D459),
                                                                          ),
                                                                          text(
                                                                            getString1(model
                                                                                .product![
                                                                            index].weight
                                                                            //     .variants![
                                                                            // 0]
                                                                            //     .weight
                                                                                .toString()) + "grm",
                                                                            fontFamily:
                                                                            fontMedium,
                                                                            fontSize: 10.sp,
                                                                            textColor: Color(
                                                                                0xffF1D459
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          )
                                          : Center(
                                            child: Container(
                                                width: 40,
                                                height: 40,
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
                                child: Text('Products not found!!',
                                  style: TextStyle(
                                      color: MyColorName.primaryDark
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
                  SizedBox(
                    height: 150,
                  )
                ]),
              ),
            ],
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
        await productSubCategoriesCategoriesWise(cat, sub, orderType, topRated, "1");
    if (a != null && a.product != null) {
      return a;
    }
    return null;
  }
}


