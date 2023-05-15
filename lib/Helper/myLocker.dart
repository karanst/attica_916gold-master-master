import 'package:atticadesign/Helper/wallettopup.dart';
import 'package:atticadesign/authentication/login.dart';
import 'package:atticadesign/screen/delivery_products.dart';
import 'package:atticadesign/selldigitalgold.dart';
import 'package:flutter/material.dart';

import '../Api/api.dart';
import '../Model/UserDetailsModel.dart';
import '../Utils/Common.dart';
import '../Utils/withdrawmodel.dart';
import '../screen/delivery_goldOrSilver.dart';
import '../screen/sell_digil-silver-onlye.dart';
import '../screen/with_draw_page.dart';

class MyLocker extends StatefulWidget {
  const MyLocker({Key? key}) : super(key: key);

  @override
  State<MyLocker> createState() => _MyLockerState();
}

class _MyLockerState extends State<MyLocker> {
  @override
  void initState() {
    super.initState();
    getWallet();
    getUserDetails();
    goldGram = double.parse(App.localStorage.getString("goldPrice").toString());
    silverGram = double.parse(App.localStorage.getString("silverPrice").toString());
  }
  getUserDetails() async{
    await App.init();
    userId =   App.localStorage.getString("userId");
  }
  String? userId;
  UserDetailsModel userDetailsModel = UserDetailsModel();
  double silverWallet = 0.00,
      goldenWallet = 0.00,
      totalBalance = 0.00,
      silverGram = 62.00,
      goldGram = 5246.96;
  double availeGoldgram = 0.00, availebaleSilveGram = 0.00;
  TextEditingController amountWithDerrwa = TextEditingController();
  TextEditingController choiceAmountController = TextEditingController();

  void getWallet() async {
    userDetailsModel =
        await userDetails(App.localStorage.getString("userId").toString());
    if (userDetailsModel != null &&
        userDetailsModel.data![0].silverWallet != null &&
        userDetailsModel.data![0].silverWallet != "") {
      setState(() {
        print(userDetailsModel.data![0].silverWallet.toString());
        availebaleSilveGram =
            double.parse(userDetailsModel.data![0].silverWallet.toString());
        silverWallet =
            double.parse(userDetailsModel.data![0].silverWallet.toString()) *
                silverGram;
      });
    }
    if (userDetailsModel != null &&
        userDetailsModel.data![0].goldWallet != null &&
        userDetailsModel.data![0].goldWallet != "") {
      setState(() {
        print(userDetailsModel.data![0].goldWallet.toString());
        availeGoldgram =
            double.parse(userDetailsModel.data![0].goldWallet.toString());
        goldenWallet =
            double.parse(userDetailsModel.data![0].goldWallet.toString()) *
                goldGram;
      });
    }
    if (userDetailsModel != null &&
        userDetailsModel.data![0].balance != null &&
        userDetailsModel.data![0].balance != "") {
      setState(() {
        print(userDetailsModel.data![0].balance.toString());
        totalBalance =
            double.parse(userDetailsModel.data![0].balance.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getWallet();
    return Scaffold(
      backgroundColor: Color(0xFF0F261E),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available Cash Balance",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "₹ ${totalBalance.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              height: 120,
              width: 280,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/lockerback.png"),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                     if(userId != null) {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => WalletTopups()),
                       );
                     }else{
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                     }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffF1D459), Color(0xffB27E29)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        height: 40,

                        child: Center(
                          child: Text(
                            "ADD AMOUNT",
                            style: TextStyle(
                                color: Color(0xff004B3F), fontSize: 15),
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
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        if(userId != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WithDrawPage(
                                        availAmount: totalBalance.toStringAsFixed(2),
                                      )));
                        }else{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        }

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffF1D459), Color(0xffB27E29)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        height: 40,

                        child: Center(
                          child: Text(
                            "WITHDRAW AMOUNT",
                            style: TextStyle(
                                color: Color(0xff004B3F), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 10,
          ),
          Card(
            color: Color(0xff15654F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8, right: 12),
                              child: Text(
                                "Gold Balance : ",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xffF1D459), fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  goldenWallet > 1 ?
                                  " ${availeGoldgram.toStringAsFixed(4).toString()} grm (₹ ${goldenWallet.toStringAsFixed(2)})"
                                  :" ${availeGoldgram.toStringAsFixed(4).toString()} grm (₹ 0.00)",
                                  style: TextStyle(
                                      color: Color(0xffF1D459), fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8, right: 12),
                              child: Text(
                                "Silver Balance : ",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xffF1D459), fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  silverWallet > 1 ?
                                  "${availebaleSilveGram.toStringAsFixed(4).toString()} grm "

                                      "(₹ ${silverWallet.toStringAsFixed(2)})"
                                  :   "${availebaleSilveGram.toStringAsFixed(4).toString()} grm "

                                      "(₹ 0.00)",
                                  style: TextStyle(
                                      color: Color(0xffF1D459), fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/lockerback.png"),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if(userId != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SellDigitalGold(
                                            goldGrams: availeGoldgram
                                                .toStringAsFixed(2),
                                            silverGrams: availebaleSilveGram
                                                .toStringAsFixed(2),
                                          )),
                                );
                              }else{
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xffF1D459), Color(0xffB27E29)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Sell ",
                                  style: TextStyle(
                                      color: Color(0xff004B3F), fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if(userId != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DeliveryProducts(
                                              type: true,
                                              goldGrams: availeGoldgram
                                                  .toStringAsFixed(6),
                                              silverGrams: availebaleSilveGram
                                                  .toStringAsFixed(6),
                                            )
                                      // AddNewAddressDelivery(
                                      //   typeGOldOrSilver: true,
                                      // goldGrams: availeGoldgram.toStringAsFixed(2),
                                      // silverGrams: availebaleSilveGram.toStringAsFixed(2),
                                      // )
                                    ));
                              }else{
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xffF1D459), Color(0xffB27E29)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              height: 40,

                              child: Center(
                                child: Text(
                                  "Delivery ",
                                  style: TextStyle(
                                      color: Color(0xff004B3F), fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
               /* Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 4),
                              width: 150,
                              child: Text(
                                "Silver balance",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xffF1D459), fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "₹ ${silverWallet.toStringAsFixed(2).toString()} (${availebaleSilveGram.toStringAsFixed(2).toString()} grm)",
                                style: TextStyle(
                                    color: Color(0xffF1D459), fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),


                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 30, right: 10),
                      //       child: RichText(
                      //         text: TextSpan(
                      //           style: TextStyle(
                      //               color: Colors.black, fontSize: 12),
                      //           children: <TextSpan>[
                      //             TextSpan(
                      //                 text: 'Buy More',
                      //                 style: TextStyle(
                      //                     decoration: TextDecoration.underline,
                      //                     color: Color(0xff98C924)))
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                  height: 120,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/lockerback.png"),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SellDigitalSilverOnlye()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffF1D459),
                                      Color(0xffB27E29)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              height: 40,

                              child: Center(
                                child: Text(
                                  "Sell Silver",
                                  style: TextStyle(
                                      color: Color(0xff004B3F), fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddNewAddressDelivery(typeGOldOrSilver: false,)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xffF1D459), Color(0xffB27E29)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              height: 40,

                              child: Center(
                                child: Text(
                                  "Delivery Silver",
                                  style: TextStyle(
                                      color: Color(0xff004B3F), fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),*/
                // Center(
                //   child: Container(
                //     decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: [Color(0xffF1D459), Color(0xffB27E29)],
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter,
                //         ),
                //         borderRadius: BorderRadius.circular(30.0)),
                //     height: 35,
                //     width: 160,
                //     child: Center(
                //       child: Text(
                //         "DELIVER TO ME",
                //         style:
                //             TextStyle(color: Color(0xff004B3F), fontSize: 15),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
          // ListTile(
          //   leading: Text(
          //     "Recent Transaction History",
          //     style: TextStyle(color: Colors.white, fontSize: 17),
          //   ),
          //   trailing: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => Transaction()),
          //         );
          //       },
          //       child: Text(
          //         "View All",
          //         style: TextStyle(color: Color(0xffF1D459), fontSize: 17),
          //       )),
          // ),
          // FutureBuilder(
          //     future: getTransation(App.localStorage.getString("userId").toString()),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       if (snapshot.hasData && snapshot.data != null) {
          //         TransactionModel? transationModel = snapshot.data;
          //         return transationModel!.data!.isNotEmpty
          //             ? ListView.builder(
          //             shrinkWrap: true,
          //             physics: ClampingScrollPhysics(),
          //             itemCount: transationModel.data!.length > 3 ? 4 : transationModel.data!.length,
          //             itemBuilder: (context, index){
          //               return  Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Card(
          //                   color: Color(0xff24745E),
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10.0),
          //                   ),
          //                   child: ListTile(
          //                     leading: Image.asset(
          //                         "assets/images/lockercupan.png"),
          //                     title: Padding(
          //                       padding: const EdgeInsets.symmetric(vertical: 6),
          //                       child: Text(
          //                         "${transationModel.data![0].purchaseType}",
          //                         style: TextStyle(
          //                             color: Colors.white, fontSize: 18),
          //                       ),
          //                     ),
          //
          //                     subtitle: Padding(
          //                       padding: const EdgeInsets.symmetric(vertical: 12),
          //                       child: RichText(
          //                         text: TextSpan(
          //                           style: TextStyle(
          //                               color: Colors.black,
          //                               fontSize: 17),
          //                           children: <TextSpan>[
          //                             TextSpan(
          //                                 text:
          //                                 "${transationModel.data![0].createdAt}",
          //                                 style: TextStyle(
          //                                     color: Colors.white54)),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     trailing: Text(
          //                       "₹ ${transationModel.data![0].amount}",
          //                       style: TextStyle(
          //                           color: Color(0xffF1D459),
          //                           fontSize: 20),
          //                     ),
          //                   ),
          //                 ),
          //               );
          //             }
          //         )
          //             : Center(child: Text("No Transaction Available"));
          //       } else if (snapshot.hasError) {
          //         return Icon(Icons.error_outline);
          //       } else {
          //         return Container(
          //             height: 50,
          //             width: 50,
          //             child: CircularProgressIndicator(
          //               strokeWidth: 1,
          //             ));
          //       }
          //     })

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     color: Color(0xff24745E),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: ListTile(
          //       leading: Image.asset("assets/images/addition.png"),
          //       title: Text(
          //         "Added To wallet",
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //       subtitle: RichText(
          //         text: TextSpan(
          //           style: TextStyle(color: Colors.black, fontSize: 17),
          //           children: <TextSpan>[
          //             TextSpan(
          //                 text: '05 July 2021',
          //                 style: TextStyle(color: Colors.white54)),
          //             TextSpan(
          //                 text: '   02:12',
          //                 style: TextStyle(color: Colors.white54)),
          //           ],
          //         ),
          //       ),
          //       trailing: Text(
          //         "₹ 12",
          //         style: TextStyle(color: Color(0xffF1D459), fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     color: Color(0xff24745E),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: ListTile(
          //       leading: Image.asset("assets/images/lockeruser.png"),
          //       title: Text(
          //         "Referral Money",
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //       subtitle: RichText(
          //         text: TextSpan(
          //           style: TextStyle(color: Colors.black, fontSize: 17),
          //           children: <TextSpan>[
          //             TextSpan(
          //                 text: '05 July 2021',
          //                 style: TextStyle(color: Colors.white54)),
          //             TextSpan(
          //                 text: '   02:12',
          //                 style: TextStyle(color: Colors.white54)),
          //           ],
          //         ),
          //       ),
          //       trailing: Text(
          //         "₹ 30",
          //         style: TextStyle(color: Color(0xffF1D459), fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     color: Color(0xff24745E),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: ListTile(
          //       leading: Image.asset("assets/images/lockeruser.png"),
          //       title: Text(
          //         "Referral Money",
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //       subtitle: RichText(
          //         text: TextSpan(
          //           style: TextStyle(color: Colors.black, fontSize: 17),
          //           children: <TextSpan>[
          //             TextSpan(
          //                 text: '05 July 2021',
          //                 style: TextStyle(color: Colors.white54)),
          //             TextSpan(
          //                 text: '   02:12',
          //                 style: TextStyle(color: Colors.white54)),
          //           ],
          //         ),
          //       ),
          //       trailing: Text(
          //         "₹ 30",
          //         style: TextStyle(color: Color(0xffF1D459), fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
