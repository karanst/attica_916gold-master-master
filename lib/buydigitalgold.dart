import 'dart:async';
import 'dart:math';

import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Model/live_price_model.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:atticadesign/screen/voucher_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

// import 'package:toggle_switch/toggle_switch.dart';

import 'Api/api.dart';
import 'Helper/Session.dart';
import 'Helper/myCart.dart';
import 'Model/UserDetailsModel.dart';
import 'Model/voucher_model.dart';
import 'Utils/ApiBaseHelper.dart';
import 'Utils/Common.dart';
import 'Utils/Razorpay.dart';
import 'Utils/colors.dart';
import 'Utils/widget.dart';
import 'buydiditalsilver.dart';
import 'notifications.dart';

class BuyDigitalGold extends StatefulWidget {
  const BuyDigitalGold({Key? key}) : super(key: key);

  @override
  State<BuyDigitalGold> createState() => _BuyDigitalGoldState();
}

class _BuyDigitalGoldState extends State<BuyDigitalGold> {
  List categories = ['₹10', '₹20', '₹50', '₹100'];
  List selectedCategories = [];
  var selected = '';
  TextEditingController choiceAmountController = TextEditingController();
  TextEditingController choiceAmountControllerGram = TextEditingController();

  double resultGram = 0.00 ;
  double taotalPrice = 0.00;
  bool isGold = true;
  double goldRate = 5262.96;
  double silverRate = 63;
  bool isBuyNow = true;
  String buyPrice = "";
  Razorpay? _razorpay;
  String razorPayKey = "rzp_test_UUBtmcArqOLqIY";
  String razorPaySecret = "NTW3MUbXOtcwUrz5a4YCshqk";
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    goldGram = double.parse(App.localStorage.getString("goldPrice").toString());
    silverGram = double.parse(App.localStorage.getString("silverPrice").toString());
    goldRate = double.parse(App.localStorage.getString("goldPrice").toString());
    silverRate = double.parse(App.localStorage.getString("silverPrice").toString());
    getWallet();
  }

  UserDetailsModel userDetailsModel = UserDetailsModel();
  LivePriceModel livePriceModel = LivePriceModel();
  double silverWallet = 0.00,
      goldenWallet = 0.00,
      totalBalance = 0.00,
      silverGram = 63.00,
      goldGram = 5246.96;
  double availeGoldgram = 0.00, availebaleSilveGram = 0.00;


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



  // void getWallet() async {
  //   userDetailsModel =
  //       await userDetails(App.localStorage.getString("userId").toString());
  //   if (userDetailsModel != null &&
  //       userDetailsModel.data![0].goldWallet != null &&
  //       userDetailsModel.data![0].goldWallet != "") {
  //     setState(() {
  //       print(userDetailsModel.data![0].goldWallet.toString());
  //       goldenWallet =
  //           double.parse(userDetailsModel.data![0].goldWallet.toString()) *
  //               goldGram;
  //       silverWallet =
  //           double.parse(
  //               userDetailsModel.data![0].silverWallet.toString() == "" ?
  //                   "0" : userDetailsModel.data![0].silverWallet.toString()
  //           ) *
  //               silverGram;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getWallet();
    return Scaffold(
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
          isGold ? "Buy Digital Gold" :  "Buy Digital Silver" ,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
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
                          color: isGold
                              ? Colors.green
                              : Colors.grey,
                          border: Border.all(
                              color: isGold
                                  ? Colors.green
                                  : Colors.black12),
                          borderRadius: BorderRadius.all(
                              Radius.circular(7.0) //
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isBuyNow = true;
                              isGold = !isGold;
                              choiceAmountControllerGram.clear();
                              choiceAmountController.clear();
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
                                    color: isGold ? Colors.white :Color(0xff0C3B2E),
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
                          color: !isGold
                              ? Colors.green
                              : Colors.grey,
                          border: Border.all(
                              color: !isGold
                                  ? Colors.green
                                  : Colors.black12),
                          borderRadius: BorderRadius.all(
                              Radius.circular(7.0) //
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isBuyNow = true;
                              isGold = !isGold;
                              choiceAmountControllerGram.clear();
                              choiceAmountController.clear();
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
                                    color: !isGold ? Colors.white : Color(0xff0C3B2E),
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
            SizedBox(
              height: 15,
            ),
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xff24745E),
                  image: DecorationImage(
                    image:   AssetImage(isGold ? "assets/homepage/coinback.png" : "assets/homepage/silver.png") ,
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 100.0, left: 20, top: 20),
                        child: Text(
                          'Start Buying \ndigital ${isGold ? "Gold" : "Silver"} \nNow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Total ${isGold ? "Gold" : "Silver"} Wallet : '
                        '${isGold  ?
                    "${availeGoldgram.toStringAsFixed(4)} gms \n(₹ ${goldenWallet.toStringAsFixed(2).toString()})"
                    :
                    silverWallet > 1 ? "${availebaleSilveGram.toStringAsFixed(4)} gms \n(₹ ${silverWallet.toStringAsFixed(2).toString()})"
                    : "0.00 gms \n(₹ 0.00)"}',
                    style: TextStyle(
                      color: Color(0xffF1D459),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'How much you want to buy?',
                style: TextStyle(
                  color: Color(0xffF3F3F3).withOpacity(1),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 6),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: choiceAmountController,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            var reate = isGold ? goldRate : silverRate;
                            resultGram = double.parse(value) / reate;
                            choiceAmountControllerGram.text =
                                resultGram.toStringAsFixed(4).toString();
                            double taxAmount = double.parse("${choiceAmountController.text}") * 5/100;
                            double price= double.parse("${choiceAmountController.text}") ;
                            buyPrice =  (price  + taxAmount).toStringAsFixed(2);
                          } else {
                            choiceAmountControllerGram.clear();
                          }
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
                        ],
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.grey,
                          hintText: "₹ Amount",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: '₹ Enter Amount',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Icon(Icons.compare_arrows,
                      color: Colors.white, size: 35),
                  width: 35,
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: choiceAmountControllerGram,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),

                      onChanged: (value) {

                        if (value.isNotEmpty) {
                          double a = isGold ? goldRate : silverRate;
                          taotalPrice = double.parse(value) * a;

                          choiceAmountController.text =
                              taotalPrice.toString();
                          resultGram = double.parse(choiceAmountControllerGram.text.toString());

                          double taxAmount = double.parse("${choiceAmountController.text}") * 5/100;
                          double price= double.parse("${choiceAmountController.text}") ;
                          buyPrice =  (price  + taxAmount).toStringAsFixed(2);

                        } else {
                          taotalPrice = 0.00;
                          choiceAmountController.clear() ;
                        }
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
                      ],
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.grey,
                        hintText: "Gram",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Enter Gram',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: Container(
            //         margin: EdgeInsets.all(15),
            //         child: TextFormField(
            //           controller: choiceAmountController,
            //           style: TextStyle(
            //             fontSize: 24,
            //             color: Colors.blue,
            //             fontWeight: FontWeight.w600,
            //           ),
            //           onChanged: (value){
            //             double abcs =  isGold ? goldRate :silverRate;
            //             if(value.isNotEmpty){
            //               resultGram = int.parse(value) / abcs;
            //               isGold = true;
            //               choiceAmountControllerGram.text = resultGram.toStringAsFixed(2).toString();
            //             }else{
            //               choiceAmountControllerGram.clear();
            //               isGold = false;
            //             }
            //             setState(() {});
            //           },
            //       /*    onFieldSubmitted: (value) {
            //             double abcs =  isGold ? goldRate :silverRate;
            //             resultGram = int.parse(value) / abcs;
            //             if(value.isNotEmpty){
            //               isGold = true;
            //               choiceAmountControllerGram.text = resultGram.toStringAsFixed(2).toString();
            //             }else{
            //               isGold = false;
            //             }
            //             setState(() {});
            //           },*/
            //
            //           keyboardType: TextInputType.number,
            //           decoration: InputDecoration(
            //             focusColor: Colors.white,
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //             ),
            //
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: const BorderSide(
            //                   color: Colors.blue, width: 1.0),
            //               borderRadius: BorderRadius.circular(10.0),
            //             ),
            //             fillColor: Colors.grey,
            //             hintText: "₹ Amount",
            //             hintStyle: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //
            //             labelText: '₹ Enter Amount',
            //             labelStyle: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       child: Icon(Icons.compare_arrows, color: Colors.white, size: 35),
            //       width: 35,
            //     ),
            //     Expanded(
            //       flex: 1,
            //       child: Container(
            //         margin: EdgeInsets.all(15),
            //         child: TextFormField(
            //           controller: choiceAmountControllerGram,
            //           style: TextStyle(
            //             fontSize: 24,
            //             color: Colors.blue,
            //             fontWeight: FontWeight.w600,
            //           ),
            //           onChanged: (value){
            //             if(value.isNotEmpty){
            //               double abc= isGold ? goldRate : silverRate;
            //               taotalPrice = int.parse(value) * abc;
            //               choiceAmountController.text = taotalPrice.toStringAsFixed(2).toString();
            //               isGold = false;
            //             }else{
            //               taotalPrice =0.00;
            //               isGold = true;
            //               choiceAmountController.clear();
            //             }
            //             setState(() {});
            //           },
            //           keyboardType: TextInputType.number,
            //           decoration: InputDecoration(
            //             focusColor: Colors.white,
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: const BorderSide(
            //                   color: Colors.blue, width: 1.0),
            //               borderRadius: BorderRadius.circular(10.0),
            //             ),
            //             fillColor: Colors.grey,
            //             hintText: "Gram",
            //             hintStyle: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //
            //             labelText: 'Enter Gram',
            //             labelStyle: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            SizedBox(
              height: 10,
            ),
            choiceAmountController.text.isNotEmpty ?
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Buy Price with tax : ',
                    style: TextStyle(
                      color: Color(0xffE2E2E2),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text('${buyPrice.toString()}'
                    ,style: TextStyle(
                    color: Color(0xffE2E2E2),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),)
                ],
              ),
            )
            : SizedBox.shrink(),
            SizedBox(
              height: 10,
            ),

            // voucherView(),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                if(isBuyNow){
                  if(choiceAmountController.text != null
                      && choiceAmountController.text.toString().length > 0){
                  doPayment(buyPrice, choiceAmountController.text.toString());
                  }
                  else{
                    Fluttertoast.showToast(msg: "Please enter amount/grams first!");
                  }
                }
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(colors: [
                      isBuyNow ?  Color(0xffF1D459) : Colors.grey,
                     isBuyNow ? Color(0xffB27E29) : Colors.black12,
                    ])),
                child: Center(
                  child: Text(
                    choiceAmountController.text.isNotEmpty ?
                    'BUY NOW ₹ ${buyPrice.toString()}'
                    : 'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  voucherView() {
    return Container(
      height: getHeight1(144),
      width: getWidth1(622),
      decoration: boxDecoration(
        radius: 15,
        bgColor: MyColorName.colorTextFour.withOpacity(0.3),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth1(16),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/buydigitalgold/coupon.png",
            width: getWidth1(79),
            height: getHeight1(54),
            fit: BoxFit.fill,
          ),
          boxWidth(20),
          Container(
              child: text("You have a Voucher",
                  fontSize: 10.sp, fontFamily: fontRegular)),
          boxWidth(20),
          InkWell(
            onTap: () async {
              // var result = await Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => VoucherListView()));
              // print(result);
              // if (result != null) {
              //   setState(() {
              //     model = null;
              //     voucher = null;
              //   });
              //   addVoucher(
              //       choiceAmountController.text, result.promo_code, result);
              // }
            },
            child: Container(
              width: getWidth1(160),
              height: getHeight1(55),
              decoration:
                  boxDecoration(radius: 48, bgColor: MyColorName.primaryDark),
              child: Center(
                child: text("See All",
                    fontFamily: fontMedium,
                    fontSize: 10.sp,
                    textColor: MyColorName.colorTextPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  doPayment(String price, apiPrice){
    
    double a = double.parse(price) * 100;

    choiceAmountController.clear();
    choiceAmountControllerGram.clear();
    RazorPayHelper razorHelper =
    new RazorPayHelper(a.toString(), context, (result) {
      if (result == "error") {
        setState(() {

        });
      }
    }, App.localStorage.getString("userId").toString(), resultGram.toString(), isGold, false, apiPrice);
    razorHelper.init(false);
  }

  ApiBaseHelper apiBase = new ApiBaseHelper();

  addVoucher(total, promoCode, model1) async {
    try {
      Map params = {
        "validate_promo_code": "1",
        "user_id": App.localStorage.getString("userId").toString(),
        "final_total": choiceAmountController.text.toString(),
        "promo_code": promoCode.toString(),
      };
      print("gdfhfdh" + params.toString());
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "validate_promo_code"), params);

      print(response.toString());

      if (!response['error']) {
        setState(() {
          model = model1;
          voucher =
              double.parse(response['data'][0]['final_discount'].toString());
          choiceAmountController.text =
              response['data'][0]['final_total'].toString();
        });
      } else {
        setSnackbar(response['message'], context);
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {});
    }
  }

  double? voucher;
  VoucherModel? model;
}
