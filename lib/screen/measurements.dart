import 'dart:async';

import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Helper/myCart.dart';
import 'package:atticadesign/Model/get_measure_model.dart';
import 'package:atticadesign/Model/measurement_model.dart';
import 'package:atticadesign/Utils/ApiBaseHelper.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:atticadesign/notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Measurement extends StatefulWidget {
  const Measurement({Key? key}) : super(key: key);

  @override
  State<Measurement> createState() => _MeasurementState();
}

class _MeasurementState extends State<Measurement> {
  List<Widget> measurements = [];
  TextEditingController relativeController = TextEditingController( text: "Self");
  TextEditingController relative1Controller = TextEditingController( text: "Self");
  bool measureVisible = false;
  ApiBaseHelper apiBase = new ApiBaseHelper();
  List<Sizes> sizes = [];
  List<Categories> categories = [];
  String? _chosenCat1;
  String? _chosenCat2;
  String? _chosenCat3;
  String? _selectSize1;
  String? _selectSize2;
  String? _selectSize3;
  String? _chosenCat4;
  String? _chosenCat5;
  String? _chosenCat6;
  String? _selectSize4;
  String? _selectSize5;
  String? _selectSize6;

  List<String> sizeRing = [
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  ];
  List<String> sizeBangles = [
    "2.0",
    "2.1",
    "2.2",
    "2.3",
    "2.4",
    "2.5",
    "2.6",
    "2.7",
    "2.8",
    "2.9",

  ];
  List<String> sizeCuffs = [
    "S",
    "M",
    "L"
  ];

  List<MyMeasurement> myMeasurements = [];
  List<FamilyMeasurement> familyMeasurements = [];
  bool isData = false;
  bool isMeasureExist = false;
  addMeasurements() {
    setState(() {
      measurements.add(
          Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 15, bottom: 15),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: relative1Controller,
                      onChanged: (value) {
                        // setState(() {
                        //   value = labNotes;
                        // });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Relative",
                          // hintStyle: hintTextNormal(12),
                          border: InputBorder.none
                        // OutlineInputBorder(
                        //
                        //   borderRadius:
                        //   BorderRadius.circular(5.0),
                        //   borderSide:  BorderSide(
                        //       color: Colors.white)
                        // )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   height: 45,
                        //   width: MediaQuery.of(context).size.width / 2 - 40,
                        //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       border: Border.all(
                        //         color: const Color(0xFFD9D3D3),
                        //         width: 1,
                        //       )),
                        //   child: categories != null ?
                        //   DropdownButtonHideUnderline(
                        //     child: ButtonTheme(
                        //       alignedDropdown: true,
                        //       child: DropdownButton<String>(
                        //         value: _chosenCat4,
                        //         // style: textNormal(14, MyColor.fourteenthClr),
                        //         icon: const Icon(Icons.keyboard_arrow_down,
                        //             color: Colors.black54, size: 20),
                        //         iconEnabledColor: Colors.blue,
                        //         items: [
                        //           for (int i = 0;
                        //           i < categories[0].subcategories!.length;
                        //           i++)
                        //             DropdownMenuItem(
                        //                 value: categories[0].subcategories![i].id,
                        //                 child: Text(
                        //                   categories[0].subcategories![i].name
                        //                       .toString(),
                        //                   // style: textNormal(16, MyColor.fourteenthClr),
                        //                 )),
                        //         ],
                        //         hint: Text(
                        //           'Categories',
                        //           // style: textNormal(16, MyColor.fifteenthClr),
                        //         ),
                        //         onChanged: (String? value) {
                        //           setState(() {
                        //             _chosenCat4 = value!;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   )
                        //       : SizedBox(),
                        // ),
                        Text("Rings",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.5,
                              //2 - 40,
                          padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFD9D3D3),
                                width: 1,
                              )),
                          child: sizeRing != null ?
                          DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _selectSize4,
                                // style: textNormal(14, MyColor.fourteenthClr),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black54, size: 20),
                                iconEnabledColor: Colors.blue,
                                items: sizeRing.map(
                                      (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                hint: Text(
                                  'Sizes',
                                  // style: textNormal(16, MyColor.fifteenthClr),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectSize4 = value!;
                                  });
                                },
                              ),
                            ),
                          )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bangles",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        // Container(
                        //   height: 45,
                        //   width: MediaQuery.of(context).size.width / 2 - 40,
                        //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       border: Border.all(
                        //         color: const Color(0xFFD9D3D3),
                        //         width: 1,
                        //       )),
                        //   child: categories != null ?
                        //   DropdownButtonHideUnderline(
                        //     child: ButtonTheme(
                        //       alignedDropdown: true,
                        //       child: DropdownButton<String>(
                        //         value: _chosenCat5,
                        //         // style: textNormal(14, MyColor.fourteenthClr),
                        //         icon: const Icon(Icons.keyboard_arrow_down,
                        //             color: Colors.black54, size: 20),
                        //         iconEnabledColor: Colors.blue,
                        //         items: [
                        //           for (int i = 0;
                        //           i < categories[0].subcategories!.length;
                        //           i++)
                        //             DropdownMenuItem(
                        //                 value: categories[0].subcategories![i].id,
                        //                 child: Text(
                        //                   categories[0].subcategories![i].name
                        //                       .toString(),
                        //                   // style: textNormal(16, MyColor.fourteenthClr),
                        //                 )),
                        //         ],
                        //         hint: Text(
                        //           'Categories',
                        //           // style: textNormal(16, MyColor.fifteenthClr),
                        //         ),
                        //         onChanged: (String? value) {
                        //           setState(() {
                        //             _chosenCat5 = value!;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   )
                        //       : SizedBox(),
                        // ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.5,
                              //2 - 40,
                          padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFD9D3D3),
                                width: 1,
                              )),
                          child: sizeBangles != null ?
                          DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _selectSize5,
                                // style: textNormal(14, MyColor.fourteenthClr),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black54, size: 20),
                                iconEnabledColor: Colors.blue,
                                items: sizeBangles.map(
                                      (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                hint: Text(
                                  'Sizes',
                                  // style: textNormal(16, MyColor.fifteenthClr),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectSize5 = value!;
                                  });
                                },
                              ),
                            ),
                          )
                              : SizedBox(),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: 5,
                        //     top: 5,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 8.0),
                        //         child: InkWell(
                        //           onTap: () {
                        //             setState(() {
                        //               // labTests.add(LabTests(
                        //               //   name: _chosenTest.toString(),
                        //               //   note: labNotesController.text.toString(),
                        //               // ));
                        //               addMeasurements();
                        //               measureVisible = true;
                        //             });
                        //             // setState(() {
                        //             //   _chosenTest = null;
                        //             //   labNotesController.text = "";
                        //             // });
                        //           },
                        //           child: Container(
                        //             height: 30,
                        //             width: 30,
                        //             decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.yellow[600]),
                        //             child: const Center(
                        //               child: Icon(
                        //                 Icons.add, size: 18,
                        //                 color: colors.primary,
                        //                 // color: MyColor.bgColor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cuff",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        // Container(
                        //   height: 45,
                        //   width: MediaQuery.of(context).size.width / 1.5,
                        //       //2 - 40,
                        //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       border: Border.all(
                        //         color: const Color(0xFFD9D3D3),
                        //         width: 1,
                        //       )),
                        //   child: categories != null ?
                        //   DropdownButtonHideUnderline(
                        //     child: ButtonTheme(
                        //       alignedDropdown: true,
                        //       child: DropdownButton<String>(
                        //         value: _chosenCat6,
                        //         // style: textNormal(14, MyColor.fourteenthClr),
                        //         icon: const Icon(Icons.keyboard_arrow_down,
                        //             color: Colors.black54, size: 20),
                        //         iconEnabledColor: Colors.blue,
                        //         items: [
                        //           for (int i = 0;
                        //           i < categories[0].subcategories!.length;
                        //           i++)
                        //             DropdownMenuItem(
                        //                 value: categories[0].subcategories![i].id,
                        //                 child: Text(
                        //                   categories[0].subcategories![i].name
                        //                       .toString(),
                        //                   // style: textNormal(16, MyColor.fourteenthClr),
                        //                 )),
                        //         ],
                        //         hint: Text(
                        //           'Categories',
                        //           // style: textNormal(16, MyColor.fifteenthClr),
                        //         ),
                        //         onChanged: (String? value) {
                        //           setState(() {
                        //             _chosenCat6 = value!;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   )
                        //       : SizedBox(),
                        // ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.5,
                              //2 - 40,
                          padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFD9D3D3),
                                width: 1,
                              )),
                          child: sizeCuffs != null ?
                          DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _selectSize6,
                                // style: textNormal(14, MyColor.fourteenthClr),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black54, size: 20),
                                iconEnabledColor: Colors.blue,
                                items: sizeCuffs.map(
                                      (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                hint: Text(
                                  'Sizes',
                                  // style: textNormal(16, MyColor.fifteenthClr),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectSize6 = value!;
                                  });
                                },
                              ),
                            ),
                          )
                              : SizedBox(),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: 5,
                        //     top: 5,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 8.0),
                        //         child: InkWell(
                        //           onTap: () {
                        //             setState(() {
                        //               // labTests.add(LabTests(
                        //               //   name: _chosenTest.toString(),
                        //               //   note: labNotesController.text.toString(),
                        //               // ));
                        //               addMeasurements();
                        //               measureVisible = true;
                        //             });
                        //             // setState(() {
                        //             //   _chosenTest = null;
                        //             //   labNotesController.text = "";
                        //             // });
                        //           },
                        //           child: Container(
                        //             height: 30,
                        //             width: 30,
                        //             decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.yellow[600]),
                        //             child: const Center(
                        //               child: Icon(
                        //                 Icons.add, size: 18,
                        //                 color: colors.primary,
                        //                 // color: MyColor.bgColor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ))
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMeasurementData();
    getData();
  }
  getData() async {
    try {
      // setState(() {
      //   loadingWish = false;
      //   orderList.clear();
      // });
      Map params = {
        // "get_favorites": "1",
        // "user_id": App.localStorage.getString("userId").toString(),
        // "limit": "10",
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_lists"), params);
      // setState(() {
      //   loadingWish = true;
      // });
      if (response['status']) {
        setState((){
          isData = true;
        });
        // for(var v in response['data']['sizes']){
        //   setState(() {
        //     sizes.add(Sizes.fromJson(v));
        //   });
        //   print("this is categories @@@ ${sizes[0].data}");
        // }
        for(var v in response['data']['categories']){
          setState(() {
            categories.add( Categories.fromJson(v));
          });
        }
      } else {
        setState(() {
          likeCount = 0;
        });
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      // setState(() {
      //   loadingWish = true;
      // });
    }
  }

  getMeasurementData() async {
    try {
      // setState(() {
      //   loadingWish = false;
      //   orderList.clear();
      // });
      Map params = {
        "user_id": App.localStorage.getString("userId").toString(),
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_my_measurement"), params);
      // setState(() {
      //   loadingWish = true;
      // });
      if (response.isNotEmpty) {
        for(var v in response['my_measurement']){
          setState(() {
            myMeasurements.add( MyMeasurement.fromJson(v));
          });
        }
        for(var v in response['family_measurement']){
          setState(() {
            familyMeasurements.add( FamilyMeasurement.fromJson(v));
          });
        }
        // Fluttertoast.showToast(msg: response['message']);
      } else {
        // Fluttertoast.showToast(msg: response['message']);
        setState(() {
          likeCount = 0;
        });
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      // setState(() {
      //   loadingWish = true;
      // });
    }
  }

  submitMeasurement() async {
    try {
      // setState(() {
      //   loadingWish = false;
      //   orderList.clear();
      // });
      Map params = {
        'category':'Rings,Bangles,Cuff',
        'relation': relativeController.text.toString(),
        'size': '${_selectSize1.toString()}, ${_selectSize2.toString()}, ${_selectSize3.toString()}, ${_selectSize4.toString()}, ${_selectSize5.toString()}, ${_selectSize6.toString()}',
        "user_id": App.localStorage.getString("userId").toString(),
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "add_measurement"), params);
      // setState(() {
      //   loadingWish = true;
      // });
      if (response['status']) {
        Fluttertoast.showToast(msg: response['message']);
      } else {
        Fluttertoast.showToast(msg: response['message']);
        setState(() {
          likeCount = 0;
        });
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      // setState(() {
      //   loadingWish = true;
      // });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F261E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff15654F),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/newbackss.png",
              height: 80,
            ),
          ),
        ),
        title: Text(
          "Measurements",
          style: TextStyle(
            color: Color(0xffF3F3F3),
            fontSize: 20,
          ),
        ),
        // actions: [
        //   Row(
        //     children: [
        //       GestureDetector(
        //           onTap: (){
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => MyCart()));
        //           },
        //           child: Icon(Icons.shopping_cart_outlined, color: Color(0xffF1D459))),
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(right: 15.0),
        //         child: InkWell(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => NotiPage()),
        //               );
        //             },
        //             child: Icon(Icons.notification_add_outlined,
        //                 color: Color(0xffF1D459))),
        //       ),
        //     ],
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child:
            // isData ?
        Column(
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            controller: relativeController,
                            onChanged: (value) {
                              // setState(() {
                              //   value = labNotes;
                              // });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Relative",
                                // hintStyle: hintTextNormal(12),
                                border: InputBorder.none
                              // OutlineInputBorder(
                              //
                              //   borderRadius:
                              //   BorderRadius.circular(5.0),
                              //   borderSide:  BorderSide(
                              //       color: Colors.white)
                              // )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rings",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                              // Container(
                              //   height: 45,
                              //   width: MediaQuery.of(context).size.width / 2 - 40,
                              //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //       border: Border.all(
                              //         color: const Color(0xFFD9D3D3),
                              //         width: 1,
                              //       )),
                              //   child: categories != null ?
                              //   DropdownButtonHideUnderline(
                              //     child: ButtonTheme(
                              //       alignedDropdown: true,
                              //       child: DropdownButton<String>(
                              //         value: _chosenCat1,
                              //         // style: textNormal(14, MyColor.fourteenthClr),
                              //         icon: const Icon(Icons.keyboard_arrow_down,
                              //             color: Colors.black54, size: 20),
                              //         iconEnabledColor: Colors.blue,
                              //         items: [
                              //           for (int i = 0;
                              //           i < categories[0].subcategories!.length;
                              //           i++)
                              //             DropdownMenuItem(
                              //                 value: categories[0].subcategories![i].id,
                              //                 child: Text(
                              //                   categories[0].subcategories![i].name
                              //                       .toString(),
                              //                   // style: textNormal(16, MyColor.fourteenthClr),
                              //                 )),
                              //         ],
                              //         hint: Text(
                              //           'Categories',
                              //           // style: textNormal(16, MyColor.fifteenthClr),
                              //         ),
                              //         onChanged: (String? value) {
                              //           setState(() {
                              //             _chosenCat1 = value!;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   )
                              //       : SizedBox(),
                              // ),
                              Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 1.5 ,
                                padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: const Color(0xFFD9D3D3),
                                      width: 1,
                                    )),
                                child: sizeRing != null ?
                                DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: _selectSize1,
                                      // style: textNormal(14, MyColor.fourteenthClr),
                                      icon: const Icon(Icons.keyboard_arrow_down,
                                          color: Colors.black54, size: 20),
                                      iconEnabledColor: Colors.blue,
                                      items: sizeRing.map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      hint: Text(
                                        'Sizes',
                                        // style: textNormal(16, MyColor.fifteenthClr),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectSize1 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //   height: 45,
                              //   width: MediaQuery.of(context).size.width / 2 - 40,
                              //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //       border: Border.all(
                              //         color: const Color(0xFFD9D3D3),
                              //         width: 1,
                              //       )),
                              //   child: categories != null ?
                              //   DropdownButtonHideUnderline(
                              //     child: ButtonTheme(
                              //       alignedDropdown: true,
                              //       child: DropdownButton<String>(
                              //         value: _chosenCat2,
                              //         // style: textNormal(14, MyColor.fourteenthClr),
                              //         icon: const Icon(Icons.keyboard_arrow_down,
                              //             color: Colors.black54, size: 20),
                              //         iconEnabledColor: Colors.blue,
                              //         items: [
                              //           for (int i = 0;
                              //           i < categories[0].subcategories!.length;
                              //           i++)
                              //             DropdownMenuItem(
                              //                 value: categories[0].subcategories![i].id,
                              //                 child: Text(
                              //                   categories[0].subcategories![i].name
                              //                       .toString(),
                              //                   // style: textNormal(16, MyColor.fourteenthClr),
                              //                 )),
                              //         ],
                              //         hint: Text(
                              //           'Categories',
                              //           // style: textNormal(16, MyColor.fifteenthClr),
                              //         ),
                              //         onChanged: (String? value) {
                              //           setState(() {
                              //             _chosenCat2 = value!;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   )
                              //       : SizedBox(),
                              // ),
                              Text("Bangles",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),),
                              Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 1.5,
                                    //2 - 40,
                                padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: const Color(0xFFD9D3D3),
                                      width: 1,
                                    )),
                                child: sizeBangles != null ?
                                DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: _selectSize2,
                                      // style: textNormal(14, MyColor.fourteenthClr),
                                      icon: const Icon(Icons.keyboard_arrow_down,
                                          color: Colors.black54, size: 20),
                                      iconEnabledColor: Colors.blue,
                                      items: sizeBangles.map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      hint: Text(
                                        'Sizes',
                                        // style: textNormal(16, MyColor.fifteenthClr),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectSize2 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                )
                                    : SizedBox(),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 5,
                              //     top: 5,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.only(top: 8.0),
                              //         child: InkWell(
                              //           onTap: () {
                              //             setState(() {
                              //               // labTests.add(LabTests(
                              //               //   name: _chosenTest.toString(),
                              //               //   note: labNotesController.text.toString(),
                              //               // ));
                              //               addMeasurements();
                              //               measureVisible = true;
                              //             });
                              //             // setState(() {
                              //             //   _chosenTest = null;
                              //             //   labNotesController.text = "";
                              //             // });
                              //           },
                              //           child: Container(
                              //             height: 30,
                              //             width: 30,
                              //             decoration: BoxDecoration(
                              //                 shape: BoxShape.circle,
                              //                 color: Colors.yellow[600]),
                              //             child: const Center(
                              //               child: Icon(
                              //                 Icons.add, size: 18,
                              //                 color: colors.primary,
                              //                 // color: MyColor.bgColor,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //   height: 45,
                              //   width: MediaQuery.of(context).size.width / 2 - 40,
                              //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //       border: Border.all(
                              //         color: const Color(0xFFD9D3D3),
                              //         width: 1,
                              //       )),
                              //   child: categories != null ?
                              //   DropdownButtonHideUnderline(
                              //     child: ButtonTheme(
                              //       alignedDropdown: true,
                              //       child: DropdownButton<String>(
                              //         value: _chosenCat3,
                              //         // style: textNormal(14, MyColor.fourteenthClr),
                              //         icon: const Icon(Icons.keyboard_arrow_down,
                              //             color: Colors.black54, size: 20),
                              //         iconEnabledColor: Colors.blue,
                              //         items: [
                              //           for (int i = 0;
                              //           i < categories[0].subcategories!.length;
                              //           i++)
                              //             DropdownMenuItem(
                              //                 value: categories[0].subcategories![i].id,
                              //                 child: Text(
                              //                   categories[0].subcategories![i].name
                              //                       .toString(),
                              //                   // style: textNormal(16, MyColor.fourteenthClr),
                              //                 )),
                              //         ],
                              //         hint: Text(
                              //           'Categories',
                              //           // style: textNormal(16, MyColor.fifteenthClr),
                              //         ),
                              //         onChanged: (String? value) {
                              //           setState(() {
                              //             _chosenCat3 = value!;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   )
                              //       : SizedBox(),
                              // ),
                              Text("Cuff",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),),
                              Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 1.5,
                                    //2 - 40,
                                padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: const Color(0xFFD9D3D3),
                                      width: 1,
                                    )),
                                child: sizeCuffs != null ?
                                DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: _selectSize3,
                                      // style: textNormal(14, MyColor.fourteenthClr),
                                      icon: const Icon(Icons.keyboard_arrow_down,
                                          color: Colors.black54, size: 20),
                                      iconEnabledColor: Colors.blue,
                                      items: sizeCuffs.map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      hint: Text(
                                        'Sizes',
                                        // style: textNormal(16, MyColor.fifteenthClr),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectSize3 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                )
                                    : SizedBox(),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 5,
                              //     top: 5,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.only(top: 8.0),
                              //         child: InkWell(
                              //           onTap: () {
                              //             setState(() {
                              //               // labTests.add(LabTests(
                              //               //   name: _chosenTest.toString(),
                              //               //   note: labNotesController.text.toString(),
                              //               // ));
                              //               addMeasurements();
                              //               measureVisible = true;
                              //             });
                              //             // setState(() {
                              //             //   _chosenTest = null;
                              //             //   labNotesController.text = "";
                              //             // });
                              //           },
                              //           child: Container(
                              //             height: 30,
                              //             width: 30,
                              //             decoration: BoxDecoration(
                              //                 shape: BoxShape.circle,
                              //                 color: Colors.yellow[600]),
                              //             child: const Center(
                              //               child: Icon(
                              //                 Icons.add, size: 18,
                              //                 color: colors.primary,
                              //                 // color: MyColor.bgColor,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 40,
                              ),
                              primary: colors.grad1Color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed: (){
                            setState((){
                              addMeasurements();
                              measureVisible = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add",
                                style: TextStyle(
                                    color: colors.primary
                                ),),
                              Icon(Icons.add,
                                  size: 16,
                                  color: colors.primary)
                            ],
                          )),
                    ],
                  ),
                ),
                Visibility(
                  visible: measureVisible,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: measurements.length,
                      itemBuilder: (context, index) {
                        return measurements[index];
                      }),
                ),

                ElevatedButton(
                    onPressed: (){
                      if(relativeController.text.isNotEmpty &&
                          _selectSize1!= null ||
                          _selectSize2!= null ||
                          _selectSize3!= null ||
                      _chosenCat1!= null ||
                          _chosenCat2!= null ||
                          _chosenCat3!= null
                      ){

                        submitMeasurement();
                      } else{
                        Fluttertoast.showToast(
                          backgroundColor: Colors.green,
                            textColor: Colors.yellow,
                            msg: "Please enter all fields!!");
                      }


                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        fixedSize: Size(150, 45),
                        primary: colors.grad1Color
                    ),
                    child: Text("Submit",
                      style: TextStyle(
                          color: colors.primary
                      ),)),





                myMeasurements.isNotEmpty ?
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Self",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    myMeasurements != null ?
                    Container(
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: myMeasurements.length,
                          itemBuilder: (c, i){
                            return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 5, bottom: 5),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${myMeasurements[i].name.toString().capitalize()}s", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          // Container(
                                          //   height: 45,
                                          //   width: MediaQuery.of(context).size.width / 2 - 40,
                                          //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                          //   decoration: BoxDecoration(
                                          //       borderRadius: BorderRadius.circular(5.0),
                                          //       border: Border.all(
                                          //         color: const Color(0xFFD9D3D3),
                                          //         width: 1,
                                          //       )),
                                          //   child: Center(
                                          //     child: Text(myMeasurements[i].name.toString(), style: TextStyle(
                                          //         color: Colors.white
                                          //     ),),
                                          //   ),
                                          // ),
                                          Container(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width / 1.5,
                                            //2 - 40,
                                            padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: const Color(0xFFD9D3D3),
                                                  width: 1,
                                                )),
                                            child: Center(
                                              child: Text(myMeasurements[i].size.toString(), style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ));
                          }),
                    )
                        : SizedBox.shrink(),
                    familyMeasurements.isNotEmpty ?
                    Column(
                      children: [

                        // Container(
                        //   width: MediaQuery.of(context).size.width / 2 - 40,
                        //   height: 45,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(5)),
                        //   child: Center(
                        //     child: Text(
                        //       '${familyMeasurements[index].title.toString()}',
                        //       style: TextStyle(
                        //           color: Colors.white
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        familyMeasurements != null ?

                        Container(
                          // height: 200,
                          child:   ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: familyMeasurements.length,
                              itemBuilder: (context, index){
                                return
                                  Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      Container(
                                        width: MediaQuery.of(context).size.width / 2 - 40,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${familyMeasurements[index].title.toString()}',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                            shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: familyMeasurements[index].data!.length,
                              itemBuilder: (c, i){
                                return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15, top: 15, bottom: 0),
                                        child: Column(
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  familyMeasurements[index].data![i].categoryId.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                  ),),
                                                // Container(
                                                //   height: 45,
                                                //   width: MediaQuery.of(context).size.width / 2 - 40,
                                                //   padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                                //   decoration: BoxDecoration(
                                                //       borderRadius: BorderRadius.circular(5.0),
                                                //       border: Border.all(
                                                //         color: const Color(0xFFD9D3D3),
                                                //         width: 1,
                                                //       )),
                                                //   child: Text(familyMeasurements[i].data![i].categoryId.toString(), style: TextStyle(
                                                //       color: Colors.white
                                                //   ),),
                                                // ),
                                                Container(
                                                  height: 45,
                                                  width: MediaQuery.of(context).size.width / 1.5,
                                                  //2 - 40,
                                                  padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      border: Border.all(
                                                        color: const Color(0xFFD9D3D3),
                                                        width: 1,
                                                      )),
                                                  child: Center(
                                                    child: Text(familyMeasurements[index].data![i].size.toString(), style: TextStyle(
                                                        color: Colors.white
                                                    ),),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ));
                              }),
                                    ],
                                  );}
    )
  ,
                        )
                            : SizedBox.shrink(),
                        const SizedBox(height: 30,)
                      ],
                    ):
                    SizedBox.shrink(),
                  ],
                )
                    : SizedBox.shrink()

              ],
            ),

          ],
        ),
                // :

                    // : Center(
                    // child:
                    // CircularProgressIndicator())


      ),
    );
  }
}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}