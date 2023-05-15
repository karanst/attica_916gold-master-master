import 'dart:async';

import 'package:atticadesign/screen/cart_product_view.dart';
import 'package:flutter/material.dart';

import 'Api/api.dart';
import 'Helper/Session.dart';
import 'Helper/myCart.dart';
import 'Helper/transation_mode.dart';
import 'Model/order_model.dart';
import 'Model/transaction_model.dart';
import 'Utils/ApiBaseHelper.dart';
import 'Utils/Common.dart';
import 'Utils/colors.dart';
import 'Utils/constant.dart';
import 'Utils/widget.dart';
import 'notifications.dart';
import 'screen/order_details.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {

  bool isGold = true;
  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;
  int totalCount = 0;
  int currentIndex = 0;
  String productImage = "", productName = "";
  bool loading = true;
  bool loadingWish = false;
  List<OrderModel> orderList = [];
  getOrderList() async {
    try {
      setState(() {
        loadingWish = false;
        orderList.clear();
      });
      Map params = {
        "get_favorites": "1",
        "user_id": App.localStorage.getString("userId").toString(),
        "limit": "10",
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_orders"), params);
      setState(() {
        loadingWish = true;
      });
      if (!response['error']) {
        for(var v in response['data']){
          setState(() {
            orderList.add(new OrderModel.fromJson(v));
          });
        }
      } else {
        setState(() {
          likeCount =0;
        });
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {
        loadingWish = true;
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff15654F),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff15654F),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/newbackss.png',
              height: 80,
            ),
          ),
          title: Text(
            "Orders",
            style: TextStyle(
              color: Color(0xffF3F3F3),
              fontSize: 20,
            ),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCart()),
                      );
                    },
                    child: Icon(Icons.shopping_cart_rounded,
                        color: Color(0xffF1D459))),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotiPage()),
                        );
                      },
                      child: Icon(Icons.notifications_active,
                          color: Color(0xffF1D459))),
                ),
              ],
            )
          ],
        ),
        body:  SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child:  Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 0.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: currentIndex == 0  ? Colors.green : Colors.grey,
                                border: Border.all(
                                    color:
                                    currentIndex == 0  ? Colors.green : Colors.black12),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7.0) //
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    typeSelect = "1";
                                    isGold = true;
                                    currentIndex = 0;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    'Gold Wallet',
                                    style: TextStyle(
                                      color: currentIndex == 0
                                          ? Colors.white
                                          : Color(0xff0C3B2E),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 15.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: currentIndex == 1  ? Colors.green : Colors.grey,
                                border: Border.all(
                                    color:
                                    currentIndex == 1 ? Colors.green : Colors.black12),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7.0) //
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    typeSelect = "2";
                                    currentIndex = 1;
                                    isGold = true;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    'Silver Wallet',
                                    style: TextStyle(
                                      color: currentIndex == 1
                                          ? Colors.white
                                          : Color(0xff0C3B2E),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 0),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: currentIndex == 2 ? Colors.green : Colors.grey,
                                border: Border.all(
                                    color:
                                    currentIndex == 2 ? Colors.green : Colors.black12),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7.0) //
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    typeSelect = "3";
                                    currentIndex = 2 ;
                                    isGold = true;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                      color: currentIndex == 2
                                          ? Colors.white
                                          : Color(0xff0C3B2E),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: currentIndex == 3  ? Colors.green : Colors.grey,
                                border: Border.all(
                                    color:
                                    currentIndex == 3 ? Colors.green : Colors.black12),
                                borderRadius:
                                BorderRadius.all(Radius.circular(7.0) //
                                ),
                              ),
                              child: InkWell(
                                onTap: () {

                                  setState(() {
                                    currentIndex = 3;
                                    isGold = false;
                                  });
                                  getOrderList();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(
                                      'Orders',
                                      style: TextStyle(
                                        color: currentIndex == 3
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
                        ],
                      ),
                    ),
                    // if(isGold)
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Container(
                    //           height: 50,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               color: Color(0xff707070),
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(30))),
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 12.0, left: 10, right: 15),
                    //             child: TextFormField(
                    //               decoration: const InputDecoration(
                    //                   border: InputBorder.none,
                    //                   labelText: '',
                    //                   labelStyle: TextStyle(
                    //                     color: Colors.grey,
                    //                   ),
                    //                   prefixIcon: Padding(
                    //                     padding: EdgeInsets.only(top: 10),
                    //                     child: Icon(
                    //                       Icons.search,
                    //                       color: Color(0xffF1D459),
                    //                     ),
                    //                   )),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         bottomSheet();
                    //       },
                    //       child: Row(
                    //         children: [
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Image.asset(
                    //             'assets/buydigitalgold/filter.png',
                    //             height: 20,
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Text(
                    //             'Filters',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 16,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // if(isGold)
                    // SizedBox(
                    //   height: 20,
                    // ),
                    if(isGold)

                    typeSelect == "3"
                        ? FutureBuilder (
                            future: getTransationCash(
                              App.localStorage.getString("userId").toString(),
                            ),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                TransationModeOnlyAmount? transationModel =
                                    snapshot.data;
                                double amount = 0.00, tranctionData = 0.00;

                                return transationModel!.data!.length > 0
                                    ? Padding(
                                      padding: const EdgeInsets.only(bottom: 60.0),
                                      child: Container(
                                          height: MediaQuery.of(context).size.height- 40,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: AlwaysScrollableScrollPhysics(),
                                              itemCount: transationModel.data!.length,
                                              itemBuilder: (context, index) {
                                                if(transationModel.data![index].amount != null){
                                                  amount =  double.parse(transationModel.data![index].amount.toString());
                                                }
                                                if(transationModel.data![index].credit != null){
                                                  tranctionData =  double.parse(transationModel.data![index].credit.toString());
                                                }
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    color: Color(0xff24745E),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(10.0),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child:
                                                      // Column(
                                                      //   children: [
                                                          Row(
                                                            children: [
                                                             Image.asset(
                                                                "assets/images/lockercupan.png",
                                                             height: 40,
                                                             width: 40,),
                                                              SizedBox(width: 8,),
                                                              Container(
                                                                width: 110,
                                                                child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(height: 6,),
                                                                  Text(
                                                                    "${transationModel.data![index].message}",
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                      overflow: TextOverflow.ellipsis,
                                                                        color: Colors.white,
                                                                        fontSize: 16),
                                                                  ),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    "Cash",
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14),
                                                                  ),
                                                                ],
                                                              ),
                                                           ),
                                                             Padding(
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                      vertical: 12),
                                                              child: Container(
                                                                width: 90,
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 12),
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                          text:
                                                                              "${transationModel.data![index].dateCreated}",
                                                                          style: TextStyle(

                                                                            fontSize: 14,
                                                                              color: Colors
                                                                                  .white54)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "₹ ${amount.toStringAsFixed(2).toString()}",
                                                              style: TextStyle(
                                                                overflow: TextOverflow.ellipsis,
                                                                  color:
                                                                  Color(0xffF1D459),
                                                                  fontSize: 16),
                                                            ),
                                                          ]
                                                          ),
                                                          // Row(
                                                          //   children: [
                                                          //     Text(
                                                          //       "${transationModel.data![index].message}",
                                                          //       maxLines: 2,
                                                          //       style: TextStyle(
                                                          //           overflow: TextOverflow.ellipsis,
                                                          //           color: Colors.white,
                                                          //           fontSize: 16),
                                                          //     ),
                                                          //   ],
                                                          // )
                                                      //   ],
                                                      // ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                    )
                                    : SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        width: double.infinity,
                                        child: Center(
                                            child: Text(
                                          "No History Yet",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 22),
                                        )));
                              }
                              else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ));
                              }
                            })
                        : FutureBuilder(
                            future: typeSelect == "1"
                                ? getTransationType(
                                    App.localStorage.getString("userId").toString(),
                                typeSelect)
                                : typeSelect == "2"
                                    ? getTransationType(
                                        App.localStorage
                                            .getString("userId")
                                            .toString(),
                                typeSelect)
                                    : typeSelect == "3"
                                        ? getTransationCash(
                                            App.localStorage
                                                .getString("userId")
                                                .toString(),
                                          )
                                        : getTransation(
                                            App.localStorage
                                                .getString("userId")
                                                .toString(),
                                          ),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                TransactionModel? transationModel = snapshot.data;
                                double amount = 0.00;
                                var tranctionData ;
                                return transationModel!.data!.length > 0
                                    ? Padding(
                                  padding: const EdgeInsets.only(bottom: 60.0),
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                          height: MediaQuery.of(context).size.height - 120,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: AlwaysScrollableScrollPhysics(),
                                              itemCount: transationModel.data!.length,
                                              itemBuilder: (context, index) {
                                                // if(transationModel.data![index].amount != null){
                                                //   amount =  double.parse(transationModel.data![index].amount.toString());
                                                // }
                                                if(transationModel.data![index].credit != null){
                                                  tranctionData =  transationModel.data![index].credit ;
                                                }
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    color: Color(0xff24745E),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(10.0),
                                                    ),
                                                   child: Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children: [
                                                  Image.asset(
                                                  "assets/images/lockercupan.png",
                                                  height: 40,
                                                        width: 40,),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                 child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "${transationModel.data![index].purchaseType}",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "${transationModel.data![index].ptype}",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                    ),
                                               ),
                                                  Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 12),
                                                      child: Container(
                                                        width: 100,
                                                        child: RichText(
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 17),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                  "${transationModel.data![index].createdAt}",
                                                                  style: TextStyle(
                                                                    fontSize: 16,
                                                                      color: Colors
                                                                          .white)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ),
                                                  Container(
                                                      width: 120,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            " ${double.parse(tranctionData.toString()).toStringAsFixed(6)} grm",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              // overflow: TextOverflow.ellipsis,
                                                                color:
                                                                Color(0xffF1D459),
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Text(
                                                            "₹ ${transationModel.data![index].amount}",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              // overflow: TextOverflow.ellipsis,
                                                                color:
                                                                Color(0xffF1D459),
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                      ]
                                                ),
                                                   ),
                                                  ),
                                                );
                                              }),
                                        ),
                                    )
                                    : SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        width: double.infinity,
                                        child: Center(
                                            child: Text(
                                          "No History Yet",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 22),
                                        )));
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ));
                              }
                            })
                    ,
                    if(!isGold)
                      loadingWish
                          ?
                      orderList.length > 0
                          ? Container(
                        height: MediaQuery.of(context).size.width + 150,
                            child: ListView.builder(
                                itemCount: orderList.length,
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return OrderView(orderList[index],()async{
                                    var result = await Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>OrderDetailsScreen(orderList[index])));
                                  },);
                                }),
                          )
                          : Center(
                            child: text("No Order Available"),
                          )
                          : Center(
                            child: CircularProgressIndicator(
                              color: MyColorName.primaryDark,
                            ),
                          ),
                    SizedBox(height: 60,)
                  ],
                ),
                const SizedBox(width: 40,)
              ],
            ),
          ),
        )
       );
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
                  "Select Type",
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
                    typeSelect = "1";
                    isCash = false;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "Only Gold Transaction",
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
                    typeSelect = "2";
                    isCash = false;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Only Silver Transaction",
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
                    typeSelect = "3";
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Only Cash Transaction",
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
}
