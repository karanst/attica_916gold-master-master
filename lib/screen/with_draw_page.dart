import 'package:atticadesign/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Api/api.dart';
import '../Utils/withdrawmodel.dart';

class WithDrawPage extends StatefulWidget {
 final String? availAmount;
  const WithDrawPage({Key? key, this.availAmount}) : super(key: key);

  @override
  State<WithDrawPage> createState() => _WithDrawPageState();
}

class _WithDrawPageState extends State<WithDrawPage> {
  bool isGold = true, isUpi = true;
  List categories = [
    " ₹ 1000 ",
    " ₹ 2000 ",
    " ₹ 5000 ",
  ];

  List selectedCategories = [];
  TextEditingController choiceAmountController = TextEditingController();
  TextEditingController acccountNumber = TextEditingController();
  TextEditingController accountHolderName = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController upiId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F261E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15654F),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/newbackss.png",
            height: 8,
            width: 8,
          ),
        ),
        title: Text("Withdraw Wallet TopUp"),
        actions: [
          Image.asset(
            "assets/images/shop.png",
            height: 15,
            width: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/well.png",
              height: 15,
              width: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
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
                      "₹ ${widget.availAmount.toString()}",
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Withdraw wallet",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(top: 10.0, left: 15.0),
            //           child: Container(
            //             height: 50,
            //             width: 150,
            //             decoration: BoxDecoration(
            //               color: isGold ? Colors.green : Colors.grey,
            //               border: Border.all(
            //                   color:
            //                   isGold ? Colors.green : Colors.black12),
            //               borderRadius:
            //               BorderRadius.all(Radius.circular(7.0) //
            //               ),
            //             ),
            //             child: InkWell(
            //               onTap: () {
            //                 setState(() {
            //                   isGold = !isGold;
            //                 });
            //               },
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 15),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Image.asset(
            //                       'assets/homepage/gold.png',
            //                       height: 30,
            //                     ),
            //                     SizedBox(
            //                       width: 5,
            //                     ),
            //                     Text(
            //                       'Gold',
            //                       style: TextStyle(
            //                         color: isGold
            //                             ? Colors.white
            //                             : Color(0xff0C3B2E),
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(top: 10.0, right: 15),
            //           child: Container(
            //             height: 50,
            //             width: 150,
            //             decoration: BoxDecoration(
            //               color: !isGold ? Colors.green : Colors.grey,
            //               border: Border.all(
            //                   color:
            //                   !isGold ? Colors.green : Colors.black12),
            //               borderRadius:
            //               BorderRadius.all(Radius.circular(7.0) //
            //               ),
            //             ),
            //             child: InkWell(
            //               onTap: () {
            //                 setState(() {
            //                   isGold = !isGold;
            //                 });
            //               },
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 10),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Image.asset(
            //                       'assets/homepage/silverbrick.png',
            //                       height: 30,
            //                     ),
            //                     SizedBox(
            //                       width: 5,
            //                     ),
            //                     Text(
            //                       'Silver',
            //                       style: TextStyle(
            //                         color: !isGold
            //                             ? Colors.white
            //                             : Color(0xff0C3B2E),
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: choiceAmountController,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "₹ Enter Amount",
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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25))),
                        side: BorderSide(width: 1, color: Color(0xff0C3B2E)),
                        backgroundColor: Color(0xff15654F),
                        label: Text('1000',
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.white, fontSize: 20)),
                        labelPadding: EdgeInsets.symmetric(horizontal: 12),
                        selected: choiceAmountController == '1000',
                        onSelected: (bool selected) {
                          setState(() {
                            choiceAmountController.text =
                            (selected ? '1000' : '');
                            print("10::---$choiceAmountController");
                          });
                        },
                        selectedColor: Color(0xff699a8d),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25))),
                        side: BorderSide(width: 1, color: Color(0xff0C3B2E)),
                        backgroundColor: Color(0xff15654F),
                        label: Text('2000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffF3F3F3).withOpacity(0.5),
                                fontSize: 20)),
                        labelPadding: EdgeInsets.symmetric(horizontal: 12),
                        // selected: choice== 'right',
                        selected: choiceAmountController == '2000',
                        onSelected: (bool selected) {
                          setState(() {
                            print("20::");
                            choiceAmountController.text =
                            (selected ? '2000' : '');
                          });
                        },
                        selectedColor: Color(0xff699a8d),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25))),
                        side: BorderSide(width: 1, color: Color(0xff0C3B2E)),
                        backgroundColor: Color(0xff15654F),
                        label: Text('5000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffF3F3F3).withOpacity(0.5),
                                fontSize: 20)),
                        labelPadding: EdgeInsets.symmetric(horizontal: 12),
                        selected: choiceAmountController == '5000',
                        onSelected: (bool selected) {
                          setState(() {
                            print("50::");
                            choiceAmountController.text =
                            (selected ? '5000' : '');
                          });
                        },
                        selectedColor: Color(0xff699a8d),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25))),
                        side: BorderSide(width: 1, color: Color(0xff0C3B2E)),
                        backgroundColor: Color(0xff15654F),
                        label: Text('10000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffF3F3F3).withOpacity(0.5),
                                fontSize: 20)),
                        labelPadding: EdgeInsets.symmetric(horizontal: 12),
                        selected: choiceAmountController == '10000',
                        onSelected: (bool selected) {
                          setState(() {
                            print("100::");
                            choiceAmountController.text =
                            (selected ? '10000' : '');
                          });
                        },
                        selectedColor: Color(0xff699a8d),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
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
                          color: isUpi ? Colors.green : Colors.grey,
                          border: Border.all(
                              color:
                              isUpi ? Colors.green : Colors.black12),
                          borderRadius:
                          BorderRadius.all(Radius.circular(7.0) //
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isUpi = !isUpi;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                '@-UPI',
                                style: TextStyle(
                                  color: isUpi
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
                          color: !isUpi ? Colors.green : Colors.grey,
                          border: Border.all(
                              color:
                              !isUpi ? Colors.green : Colors.black12),
                          borderRadius:
                          BorderRadius.all(Radius.circular(7.0) //
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isUpi = !isUpi;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bank Transfer',
                                style: TextStyle(
                                  color: !isUpi
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if(isUpi)
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: upiId,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Enter UPI ID",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  labelText: 'Enter UPI ID',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if(!isUpi)
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: bankName,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Enter Account holder name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  labelText: 'Enter Account holder name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            if(!isUpi)

              Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: acccountNumber,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Enter Account Number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  labelText: 'Enter Account Number',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            if(!isUpi)

              Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: accountHolderName,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Enter Account Type",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  labelText: 'Enter Account Type',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            if(!isUpi)
              Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: ifscCode,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Enter IFSC Code",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  labelText:  "Enter IFSC Code",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
            if(choiceAmountController.text.isNotEmpty){
              if(isUpi) {
                if ((upiId.text.isNotEmpty && upiId.text.contains("@"))
                    || upiId.text == null) {
                  Withdrawmodel? a =
                  await withDrawApi(amount: choiceAmountController.text,
                      accountHoldername: accountHolderName.text,
                      accountNumber: acccountNumber.text,
                      BankName: bankName.text,
                      ifscCode: ifscCode.text,
                      upiId: upiId.text);
                  if (a != null) {
                    choiceAmountController.clear();
                    acccountNumber.clear();
                    accountHolderName.clear();
                    ifscCode.clear();
                    bankName.clear();
                    upiId.clear();
                    Fluttertoast.showToast(
                        backgroundColor: Colors.green,
                        fontSize: 18, textColor: Colors.yellow,
                        msg: "${a.message.toString()}");
                    Navigator.pop(context);
                  }
                } else {
                  Fluttertoast.showToast(
                      backgroundColor: Colors.green,
                      fontSize: 18, textColor: Colors.yellow,
                      msg: "Please enter valid Upi Id!");
                }
              }else{
                if ((accountHolderName.text.isNotEmpty && acccountNumber.text.isNotEmpty)
                    || bankName.text.isNotEmpty || ifscCode.text.isNotEmpty) {
                  Withdrawmodel? a =
                  await withDrawApi(
                      amount: choiceAmountController.text,
                      accountHoldername: accountHolderName.text,
                      accountNumber: acccountNumber.text,
                      BankName: bankName.text,
                      ifscCode: ifscCode.text,
                      upiId: upiId.text);
                  if (a != null) {
                    choiceAmountController.clear();
                    acccountNumber.clear();
                    accountHolderName.clear();
                    ifscCode.clear();
                    bankName.clear();
                    upiId.clear();
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        backgroundColor: Colors.green,
                        fontSize: 18, textColor: Colors.yellow,
                        msg: "Withdraw request successfully");
                  }
                } else {
                  Fluttertoast.showToast(
                      backgroundColor: Colors.green,
                      fontSize: 18, textColor: Colors.yellow,
                      msg: "Please enter valid Bank Details!");
                }

              }
            }else{
              Fluttertoast.showToast(
                  backgroundColor: Colors.green,
                  fontSize: 18, textColor: Colors.yellow,
                  msg: "Please enter amount you want to withdraw!!");
            }

              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffF1D459), Color(0xffB27E29)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      "PROCEED TO WITHDRAW",
                      style: TextStyle(color: Color(0xff004B3F), fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
