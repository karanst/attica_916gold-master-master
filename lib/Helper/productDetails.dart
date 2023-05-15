
import 'dart:async';

import 'package:atticadesign/Api/api.dart';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Helper/myCart.dart';
import 'package:atticadesign/Model/new_product_model.dart';
import 'package:atticadesign/Model/price_breakup.dart';
import 'package:atticadesign/Model/product_rating_model.dart';
import 'package:atticadesign/Model/products_model.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/Session.dart';
import 'package:atticadesign/Utils/colors.dart';
import 'package:atticadesign/Utils/widget.dart';
import 'package:atticadesign/authentication/login.dart';
import 'package:atticadesign/orderconfirm2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../Model/cart_model.dart';
import '../Utils/ApiBaseHelper.dart';
import '../Utils/constant.dart';

class ProductDetailsScreen extends StatefulWidget {
  // ProductModel model;
  String? productid;
  bool isGold;
  ProductDetailsScreen(this.productid, this.isGold);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ApiBaseHelper apiBase = new ApiBaseHelper();
  ProductsModel? productModel = ProductsModel();
  PriceBreakup? priceBreakUp = PriceBreakup();
  bool newPriceBrk = false;
  var productsModel;
  // NewProductModel? productModel = NewProductModel();
  bool isLoading = true;

  List<dynamic> listCat = [];
  List productList = [];
  List goldList = [];
  List gemStone = [];
  String valueSizes = "";
  int counter = 0;
  double amount = 0;
  var finalData;
  String? productPrice;


  getProductById() async {
    productModel = await getProductyid(widget.productid);
    productsModel = await getProductyid(widget.productid);
    // productList = productModel!.product!;
    // print("this is new datat dor @@@@@@@ ${productList[0]['price_break']['Diamond']['component_type'].toString()}");
    if (productModel != null && productModel!.product != null) {
      if (productModel!.product![0].sizes != null) {
        productModel!.product![0].sizes!.forEach((element) {
          print("--------$element");
          listCat.add(element);
          valueSizes = element;
          // valueSizes = productModel!.product![0].sizes![0];
        });

      }
      if( productModel?.product![0].isFavorite
          .toString() ==
          "1"){
        setState((){
          fav = true;
        });
      }else
        {
          setState((){
            fav = false;
          });
        }
      // if(productModel!.product![0].priceBreak != null){
      //   productModel?.product![0].priceBreak!.gold!.forEach((element) {
      //     print("--------$element");
      //     goldList.add(element);
      //     // valueSizes = element;
      //   });
      //   });
      //   productModel?.product![0].priceBreak!.gemstone!.forEach((element) {
      //     print("--------$element");
      //     gemStone.add(element);
      //     // valueSizes = element;
      //   });
      //
      // }

      isLoading = false;
      setState(() {});
    }
  }

  getPriceBreakSize(value) async {
    priceBreakUp = await getPriceBreak(widget.productid, value);
    if(priceBreakUp!.data!.isNotEmpty || priceBreakUp!.data != null ) {

      setState(() {
        newPriceBrk = true;
        productPrice = priceBreakUp!.subTotal.toString();

      });
    }
  }

  int count = 1;
  @override
  void initState() {
    super.initState();

    // getProductyid(widget.productid);
    getProductById();
    getUserDetails();
    // getPriceBreakSize(listCat);
    // getProductRating();
    // getProductRating();
    getCart();
  }

  getUserDetails() async{
    await App.init();
    userId =   App.localStorage.getString("userId");
  }

  bool isNetwork = false;
  bool? fav;

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
        bool status = true;
        String msg = response['message'];
        setState(() {
          fav = true;
        });
        // getProductById();
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
        // getProductById();
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

  double productOverAllReating = 1.0;

  getProductRating() async {
    await App.init();
    peoductRatingList.clear();
    isNetwork = await isNetworkAvailable();
    if (isNetwork) {
      try {
        Map data;
        data = {
          "product_id": widget.productid,
        };
        Map response = await apiBase.postAPICall(
            Uri.parse(baseUrl + "get_product_rating"), data);
        print(response);
        bool status = true;
        if (!response['error']) {
          for (var v in response['rating_data']) {
            setState(() {
              RatingData ratingData = RatingData.fromJson(v);
              peoductRatingList.add(ratingData);
              String countRating = ratingData.rating.toString();
              productOverAllReating = double.parse(countRating);
            });
          }
        }
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

  void addCart(bool isAdded, bool isRemoved) {
    Map data = {};
    print("count here ${count} and ${counter}");
    data = {
      "add_to_cart": "1",
      "user_id": App.localStorage.getString("userId").toString(),
      "product_id": productModel?.product![0].variants![0].id,
      "product_variant_id": productModel?.product![0].variants![0].id,
      "qty": count.toString(),
      "size": "$valueSizes",
      "is_qty_added": "${isAdded.toString()}",
      "is_qty_removed": "${isRemoved.toString()}",
    };
    print("checking cart data here ${data}");
    callApi("manage_cart", data, 0);
    setState(() {
      getCart();
    });
  }

  bool loading = true;
  List<CartData> cartList = [];
  List<RatingData> peoductRatingList = [];
  int totalCount = 0;

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

  void callApi(String url, Map data, int i) async {
    isNetwork = await isNetworkAvailable();
    if (isNetwork) {
      try {
        setState(() {
          loading = false;
        });
        Map response =
        await apiBase.postAPICall(Uri.parse(baseUrl + url), data);
        setState(() {
          loading = true;
        });
        if (!response['error']) {
          setState(() {
            getCart();
            Fluttertoast.showToast(
                backgroundColor: Colors.green,
                fontSize: 18,
                textColor: Colors.yellow,
                msg:
                //"Cart can't be empty"
                //"Item updated successfully"
                "${response["message"]}");
          });
        } else {
          Fluttertoast.showToast(
              backgroundColor: Colors.green,
              fontSize: 18,
              textColor: Colors.yellow,
              msg: "Item updated successfully"
            //"Cart can't be empty"
            // "${response["message"]}"
          );
        }
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          loading = true;
        });
      }
    } else {
      setSnackbar("No Internet Available", context);
    }
  }
  String? userId;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value();
      },
      child: Scaffold(
          backgroundColor: Color(0xFF004B3F),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF15654F),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Image.asset(
                "assets/images/newbackss.png",
                height: 10,
                width: 10,
              ),
            ),
            title: Text(
              "Product Details",
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
              // Padding(
              //   padding: EdgeInsets.only(top: 14),
              //   child: Text("${totalCount.toString()}", style: TextStyle(
              //       color: Colors.white,  fontSize: 20
              //   ),),
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/images/well.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF1D459), Color(0xffB27E29)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: getHeight(70),
            width: getWidth(390),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getHeight(85),
                  width: getWidth(140),
                  child: OutlinedButton(
                    onPressed: ()  async{
                    if(userId != null){
                      if (count == 0) {
                        setSnackbar("Please add some quantity", context);
                      } else {
                        if (productModel?.product![0].variants![0].cartCount ==
                            "0") {
                          var ad =
                              productModel?.product![0].variants![0].cartCount;
                          ad = "1";
                        }
                        addCart(true, true);
                      }
                    }else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                    child: loading
                        ? const Text(
                      "ADD TO CART",
                      style: TextStyle(color: Color(0xff0F261E)),
                    )
                        : CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
                boxWidth(20),
                Container(
                  height: getHeight(85),
                  width: getWidth(140),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                    ),
                    onPressed: () {
                      if(userId != null){
                        String? weifht = "";
                        weifht = productModel?.product![0].weight;
                        if (count != 0) {
                          addCart(true, false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderConfirm2(
                                    isGold: widget.isGold,
                                    gramValue: weifht!,
                                    itemCount: count,
                                    type: 0,
                                    buyNow: true,
                                  )));
                        } else {
                          setSnackbar("Please add some quantity", context);
                        }
                      }else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      }

                      /*       if (productModel?.product![0].variants![0].cartCount! != "0") {
                        String? weifht = "";
                        weifht = productModel?.product![0].weight;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrderConfirm2(
                                    isGold: widget.isGold,
                                    gramValue: weifht!, itemCount:
                                  productModel?.product![0].variants![0].cartCount,)),
                        );
                      } else {
                        Fluttertoast.showToast(
                            backgroundColor: Colors.green,
                            fontSize: 18, textColor: Colors.yellow,
                            msg: "Minimum qty 1 is required");
                      }*/
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffF1D459), Color(0xffB27E29)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "BUY NOW",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Color(0xff004B3F), fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: !isLoading
              ? ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: commonHWImage(
                        productModel?.product![0].image,
                        258.00,
                        350.0,
                        "",
                        context,
                        "assets/homepage/gold.png"),
                  ),
                  Positioned(
                    top: getHeight(10),
                    right: getWidth(20),
                    child: InkWell(
                      onTap: () {

                        if (productModel?.product![0].isFavorite == 0) {
                          addFav(productModel?.product![0].id);
                          var ad = productModel?.product![0].isFavorite;

                          setState((){
                            fav = true;
                            ad = 1;
                            productModel?.product![0].isFavorite=1;
                          });
                          // getProductById();
                        } else {
                          addFavRemove(productModel?.product![0].id);
                          var ad = productModel?.product![0].isFavorite;
                          ad = 0;
                          setState((){
                            fav = false;
                            productModel?.product![0].isFavorite=0;
                          });
                        }
                        // getProductById();
                      },
                      child: Container(
                        decoration: boxDecoration(
                          radius: 100,
                          bgColor: Color(0xff004B3F),
                        ),
                        width: getWidth(50),
                        height: getWidth(50),
                        padding: EdgeInsets.all(getWidth(5)),
                        child: Center(
                            child:
                            Icon(
                                productModel?.product![0].isFavorite
                                    .toString() ==
                                    "1"
                                    // ||
                                    // fav == true
                                    ?
                                Icons.favorite
                                    : Icons.favorite_border,
                                color: Color(0xffF1D459))),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(getWidth(10)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff15654F), Color(0xff0F261E)],
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListTile(
                    //   leading: Text(
                    //     "gold ${productModel?.product![0].weight} gm ",
                    //     style: TextStyle(color: Color(0xffF1D459)),
                    //   ),
                    //   trailing: RichText(
                    //     text: TextSpan(
                    //       style: TextStyle(
                    //           color: Colors.black, fontSize: 15),
                    //       children: [
                    //         TextSpan(
                    //             text:
                    //                 '${productModel?.product![0].rating}   ',
                    //             style: TextStyle(color: Colors.white)),
                    //         WidgetSpan(
                    //             child: Image.asset(
                    //           "assets/images/star.png",
                    //           height: 20,
                    //         )),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              newPriceBrk ?
                              Text(
                                "₹${productPrice.toString()}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ) :
                              Text(
                                "₹${productModel?.product![0].variants![0].specialPrice}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  "Weight ${productModel?.product![0].weight} gram",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "(Based on latest gold price)",
                          //   style: TextStyle(color: Colors.white70),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Id",
                                      style: TextStyle(
                                          color: Color(0xffF1D459)),
                                    ),
                                    boxHeight(8),
                                    Text(
                                      "${productModel?.product![0].id}",
                                      style: TextStyle(
                                          color: Colors.white70),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: getWidth(152),
                                  decoration: boxDecoration(
                                    radius: 10,
                                    bgColor: Color(0xff0BA84A),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          /*   setState(() {

                                            });*/
                                          // int i = parseInt(productModel
                                          //     ?.product![0]
                                          //     .variants![0]
                                          //     .cartCount
                                          //     .toString());
                                          // if (i != 0) {
                                          //   setState(() {
                                          //     i--;
                                          //     var ad =productModel
                                          //         ?.product![0]
                                          //         .variants![0]
                                          //         .cartCount;
                                          //      ad =
                                          //         i.toString();
                                          //   });
                                          // }
                                          setState(() {
                                            if (count > 1) {
                                              count--;
                                              //  addCart(false, true);
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: getHeight(49),
                                          width: getWidth(49),
                                          decoration: boxDecoration(
                                            radius: 10,
                                            bgColor: Color(0xff0BA84A),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 24.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: getHeight(49),
                                          width: getWidth(49),
                                          decoration: boxDecoration(
                                            bgColor: MyColorName.colorBg1,
                                            radius: 0,
                                          ),
                                          child: Center(
                                            child: productModel!
                                                .product![0]
                                                .variants![0]
                                                .cartCount ==
                                                null ||
                                                productModel!
                                                    .product![0]
                                                    .variants![0]
                                                    .cartCount ==
                                                    ""
                                                ? text(count.toString(),
                                                textColor: MyColorName
                                                    .colorTextPrimary)
                                                : text(
                                              // count.toString(),
                                              //   textColor: MyColorName.colorTextPrimary,
                                                count.toString(),
                                                fontFamily: fontBold,
                                                fontSize: 12.sp,
                                                textColor: MyColorName
                                                    .colorTextPrimary),
                                          )),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });

                                          // setState(() {
                                          //   addCart(true, false);
                                          // });
                                        },
                                        child: Container(
                                          height: getHeight(49),
                                          width: getWidth(49),
                                          decoration: boxDecoration(
                                            radius: 10,
                                            bgColor: Color(0xff0BA84A),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 24.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (listCat.isNotEmpty)
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Select Size : ",
                                    style: TextStyle(
                                        color: Color(0xffF1D459)),
                                  ),
                                ),
                                listCat.isNotEmpty  || listCat != null?
                                Expanded(
                                  child: DropdownButton<String>(
                                    iconSize: getHeight(40),
                                    isDense: true,
                                    isExpanded: true,
                                    icon: Icon(
                                        Icons
                                            .keyboard_arrow_down_outlined,
                                        size: 20),
                                    iconEnabledColor:
                                    MyColorName.primaryDark,
                                    value: listCat[0],
                                    dropdownColor: Colors.black45,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.white),
                                    underline: SizedBox.shrink(),
                                    items: listCat
                                        .map((fc) =>
                                        DropdownMenuItem<String>(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 60),
                                            child: Center(
                                                child: Text(
                                                  fc,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                )),
                                          ),
                                          value: fc,
                                        ))
                                        .toList(),
                                    onChanged: (newValue) async{
                                      setState(() {
                                        valueSizes = newValue!;
                                      });
                                      getPriceBreakSize(valueSizes);
                                      // priceBreak = await getPriceBreak(widget.productid, valueSizes);
                                    },
                                  ),
                                )
                                : SizedBox.shrink(),
                              ],
                            ),
                          Text(
                            "Description",
                            style: TextStyle(color: Color(0xffF1D459)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${productModel?.product![0].shortDescription}",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    // productsModel?.product![0].sizeInfoData != [] ?
                    // TextButton(onPressed: (){
                    //   showDialog(
                    //     context: context,
                    //     builder: (ctx) => AlertDialog(
                    //       title: const Text("Not Sure about your size?"),
                    //       content: SingleChildScrollView(
                    //         child: Column(
                    //           children: [
                    //             Image.network("${productsModel?.product![0].sizeInfoData!.image!.toString()}")
                    //           ],
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () {
                    //             Navigator.of(ctx).pop();
                    //           },
                    //           child: Container(
                    //             color: Color(0xffF1D459),
                    //             padding: const EdgeInsets.all(14),
                    //             child: const Text("Okay",
                    //             style: TextStyle(
                    //                 color: Color(0xff004B3F)
                    //             ),),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    //
                    // }, child: Text("Not sure about your size?"))
                    // : SizedBox.shrink(),

                    // ListView.builder(
                    //   itemCount: productModel?.product![0].priceBreak!.length,
                    //     itemBuilder: (context, index){
                    //     var j = productModel?.product![0].priceBreak;
                    //       return Row(
                    //         children: [
                    //           Column(
                    //             children: [
                    //               Text("${j![index]['component_type'].toString()}"),
                    //               // Text("${productModel?.product![0].priceBrea}")
                    //             ],
                    //           )
                    //         ],
                    //       );
                    //
                    //     }),
                    productModel!.product![0].priceBreak!.isEmpty || productModel!.product![0].priceBreak!.length == 0 || newPriceBrk ? SizedBox.shrink():
                        priceBreak(),
                    newPriceBrk ?
                    newPriceBreak()
                    : SizedBox.shrink(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delivery Details",
                          style: TextStyle(color: Color(0xffF1D459))),
                    ),
                    productModel!.product![0].priceBreak!.isEmpty || productModel!.product![0].priceBreak!.length == 0 ?
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                children: [
                                  WidgetSpan(
                                      child: Image.asset(
                                        "assets/images/car.png",
                                        height: 20,
                                      )),
                                  TextSpan(
                                      text: ' Delivery in 7-8 days ',
                                      style: TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                children: [
                                  WidgetSpan(
                                      child: Image.asset(
                                        "assets/images/eare.png",
                                        height: 20,
                                      )),
                                  TextSpan(
                                      text: '   Order Help and support ',
                                      style: TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),

                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                children: [
                                  WidgetSpan(
                                      child: Image.asset(
                                        "assets/images/right.png",
                                        height: 20,
                                      )),
                                  TextSpan(
                                      text: '   Secure packaging ',
                                      style: TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                children: [
                                  WidgetSpan(
                                      child: Image.asset(
                                        "assets/images/box.png",
                                        height: 20,
                                      )),
                                  TextSpan(
                                      text: '   No return is allowed ',
                                      style: TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    productModel!.product![0].standouts!.isEmpty || productModel!.product![0].standouts!.length == 0 ? SizedBox.shrink():
                        standOuts(),
                    SizedBox(
                      height: 5,
                    ),
                    // goldList.isNotEmpty  ?
                    //SizedBox.shrink() :



                    // : SizedBox.shrink(),
                    //  productModel?.product![0].priceBreak != null
                    //      || productModel?.product![0].priceBreak != [] ?
                    //  productList[0]['price_break'] ! = null ||
                    //      productList[0]['price_break'] != [] ?
                    //  Padding(
                    //    padding: const EdgeInsets.only(left: 12.0),
                    //    child: Row(
                    //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //      children: [
                    //
                    //        Text(
                    //          "${productList[0]['price_break']['Diamond']['component_type'].toString()}",
                    //          // "${productModel?.product![0].priceBreak!['Gold']![0].componentType.toString()}",
                    //          style: TextStyle(color: Color(0xffF1D459)),
                    //        ),
                    //        // Text(
                    //        //   "${productModel?.product![0].priceBreak!.gold![0].rate.toString()}",
                    //        //   style: TextStyle(color: Color(0xffF1D459)),
                    //        // ),
                    //        // Text(
                    //        //   "${productModel?.product![0].priceBreak!.gold![0].weight.toString()}",
                    //        //   style: TextStyle(color: Color(0xffF1D459)),
                    //        // ),
                    //        // Text("Total",
                    //        //   // "${productModel?.product![0].priceBreak!.gold![0].componentType.toString()}",
                    //        //   style: TextStyle(color: Color(0xffF1D459)),
                    //        // ),
                    //
                    //
                    //      ],
                    //    ),
                    //  )
                    //  : SizedBox.shrink(),
                    // productModel?.product![0].priceBreak != null
                    //     || productModel?.product![0].priceBreak != [] ?
                    // Container(
                    //   height: 100,
                    //   child: ListView.builder(
                    //     itemCount: productModel?.product![0].priceBreak!.length,
                    //       itemBuilder: (context, index){
                    //       var j = productModel?.product![0].priceBreak;
                    //         return Row(
                    //           children: [
                    //             Column(
                    //               children: [
                    //                 Text("${j![index]['Gold']['component_type'].toString()}",
                    //                 style: TextStyle(
                    //                   color: Colors.white
                    //                 ),),
                    //                 // Text("${productModel?.product![0].priceBrea}")
                    //               ],
                    //             )
                    //           ],
                    //         );
                    //
                    //       }),
                    // )
                    // : SizedBox.shrink(),
                    // SizedBox(
                    //   height: 20,
                    // ),

                    // if(peoductRatingList.isNotEmpty)
                    // Container(
                    //   color: Color(0xff14644E),
                    //   child: ExpansionTile(
                    //     backgroundColor: Color(0xFF666666),
                    //     childrenPadding: const EdgeInsets.all(8.0),
                    //     title: Text(
                    //       'Customer reviews  ',
                    //       style: TextStyle(color: Color(0xffF1D459)),
                    //     ),
                    //     subtitle: Row(
                    //       children: [
                    //         Text(
                    //           "${productOverAllReating.toString()} Out Of 5  ",
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         RatingBar.builder(
                    //           initialRating: productOverAllReating,
                    //           itemSize: 20.0,
                    //           tapOnlyMode: true,
                    //           minRating: 1,
                    //           direction: Axis.horizontal,
                    //           allowHalfRating: true,
                    //           itemCount: 5,
                    //           itemPadding:
                    //               EdgeInsets.symmetric(horizontal: 4.0),
                    //           itemBuilder: (context, _) => Icon(
                    //             Icons.star,
                    //             color: Colors.amber,
                    //           ),
                    //           onRatingUpdate: (rating) {
                    //             print(rating);
                    //           },
                    //         )
                    //       ],
                    //     ),
                    //     children: [
                    //       listReview(),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          )
              : Center(child: CircularProgressIndicator())),
    );
  }
  Widget priceBreak(){
    return  productModel!.product![0].priceBreak!.isEmpty || productModel!.product![0].priceBreak!.length == 0 ? SizedBox.shrink():
    ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount:
        productModel!.product![0].priceBreak!.length,
        itemBuilder: (c, i) {
          print("ook now ${ productModel!.product![0].priceBreak!.length}");
          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${productModel!.product![0].priceBreak![i].title}",
                  style: TextStyle( fontWeight: FontWeight.w600,
                    fontSize: 16,),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          "Component",
                          style: TextStyle(
                              color: Color(0xffF1D459)),
                        ),
                      ),
                      Text(
                        "Rate",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: productModel!.product![0]
                          .priceBreak![i].data!.length,
                      itemBuilder: (c, j) {
                        return Container(
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: 8.0, bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(productModel!.product![0].priceBreak![i].data![j].componentName != null?
                                    "${productModel!.product![0].priceBreak![i].data![j].componentName}"
                                    : "",
                                    style: TextStyle(
                                        color: Colors.white70),
                                  ),
                                ),
                                Text(
                                  productModel!.product![0].priceBreak![i].data![j].rate != null ?
                                  "${productModel!.product![0].priceBreak![i].data![j].rate}"
                                  : "",
                                  style: TextStyle(
                                      color:  Colors.white70),
                                ),
                                Text(productModel!.product![0].priceBreak![i].data![j].weight != null ?
                                  "${productModel!.product![0].priceBreak![i].data![j].weight} gms"
                                  :"",
                                  style: TextStyle(
                                      color: Colors.white70),
                                ),
                                Text(
                                    productModel!.product![0].priceBreak![i].data![j].rate.toString() != null ||
                                        productModel!.product![0].priceBreak![i].data![j].weight.toString() != null
                                        || productModel!.product![0].priceBreak![i].data![j].rate.toString() != "" ||
                                        productModel!.product![0].priceBreak![i].data![j].weight.toString() != ""?
                                  "₹ "+(double.parse(productModel!.product![0].priceBreak![i].data![j].rate.toString()) * double.parse(productModel!.product![0].priceBreak![i].data![j].weight.toString())).toString()
                                  : "",
                                  style: TextStyle(
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
  Widget newPriceBreak(){
    return  priceBreakUp!.data!.isEmpty || priceBreakUp!.data!.length ==0 ?
      // productModel!.product![0].priceBreak!.isEmpty || productModel!.product![0].priceBreak!.length == 0 ?
      SizedBox.shrink():
    ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount:
        priceBreakUp!.data!.length,
        // productModel!.product![0].priceBreak!.length,
        itemBuilder: (c, i) {
          // print("ook now ${ priceBreakUp!.data![0].
          //     productModel!.product![0].priceBreak!.length}");
          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${
                      priceBreakUp!.data![i].title}",
                  style: TextStyle( fontWeight: FontWeight.w600,
                    fontSize: 16,),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          "Component",
                          style: TextStyle(
                              color: Color(0xffF1D459)),
                        ),
                      ),
                      Text(
                        "Rate",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Color(0xffF1D459)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: priceBreakUp!.data![i].price!.length,
                      itemBuilder: (c, j) {
                        return Container(
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: 8.0, bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(priceBreakUp!.data![i].price![j].componentName != null?
                                  "${priceBreakUp!.data![i].price![j].componentName}"
                                      : "",
                                    style: TextStyle(
                                        color: Colors.white70),
                                  ),
                                ),
                                Text(
                                  priceBreakUp!.data![i].price![j].rate != null ?
                                  "${priceBreakUp!.data![i].price![j].rate}"
                                      : "",
                                  style: TextStyle(
                                      color:  Colors.white70),
                                ),
                                Text(priceBreakUp!.data![i].price![j].weight != null ?
                                "${priceBreakUp!.data![i].price![j].weight} gms"
                                    :"",
                                  style: TextStyle(
                                      color: Colors.white70),
                                ),
                                Text(
                                  priceBreakUp!.data![i].price![j].rate.toString() != null ||
                                      priceBreakUp!.data![i].price![j].weight.toString() != null
                                      || priceBreakUp!.data![i].price![j].rate.toString() != "" ||
                                      priceBreakUp!.data![i].price![j].weight.toString() != ""?
                                  "₹ "+(double.parse(priceBreakUp!.data![i].price![j].rate.toString()) * double.parse(priceBreakUp!.data![i].price![j].weight.toString())).toString()
                                      : "",
                                  style: TextStyle(
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
  Widget standOuts(){
    return  GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4
      ),
      itemCount: productModel!.product![0].standouts!.length,
      itemBuilder: (context, index){
        var j = productModel!.product![0].standouts![index];
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5, right: 5),
          child: Row(
            children: [
              Image.network(
                '${j.icon}',
                height: 30,
              ),
              SizedBox(width: 5,),
              Container(
                width: 75,
                child: Text(
                    '${j.text}',
                    maxLines: 2,
                    //'   Secure packaging ',
                    style: TextStyle(
                        color: Colors.white)),
              ),
            ],
          ),
        );
      }, );
  }

  Widget listReview() {
    return peoductRatingList.isNotEmpty && peoductRatingList.length > 0
        ? Container(
      height: 120,
      child: ListView.builder(
          itemCount: peoductRatingList.length,
          itemBuilder: (crtx, inde) {
            return Column(
              children: [
                ListTile(
                  leading: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            '${peoductRatingList.length.toString()} reviews',
                            style: TextStyle(
                                decorationColor: Colors.yellow,
                                decoration: TextDecoration.underline,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        "${peoductRatingList[inde].userProfile ?? " "}",
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            "${peoductRatingList[inde].userName ?? " "} ",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RatingBar.builder(
                              initialRating: 4,
                              itemSize: 15.0,
                              minRating: 1,
                              tapOnlyMode: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${peoductRatingList[inde].comment ?? " "}",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
    )
        : SizedBox();
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      var currentIndex;
      if (currentIndex == i) {
        // print("count:: "+currentIndex.toString());
        var currentIndex;
        if (currentIndex == 3) {
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0XffF1D459),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        } else {}
      } else {}
    }

    return indicators;
  }
}
