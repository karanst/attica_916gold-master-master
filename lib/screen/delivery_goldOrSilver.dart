import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Model/address_model.dart';
import 'package:atticadesign/Utils/ApiBaseHelper.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/colors.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:atticadesign/Utils/widget.dart';
import 'package:atticadesign/notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geocoder/model.dart';

import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Model/get-delivery-charge-model.dart';
import 'delivery-address.dart';


class AddNewAddressDelivery extends StatefulWidget {
  final bool typeGOldOrSilver;
  String? goldGrams;
  String? silverGrams;
  String? requiredGrams;
  String? productIds;
  AddNewAddressDelivery({
    required this.typeGOldOrSilver, required this.goldGrams,
    required this.silverGrams, this.requiredGrams, this.productIds});

  @override
  State<AddNewAddressDelivery> createState() => _AddNewAddressDeliveryState();
}

class _AddNewAddressDeliveryState extends State<AddNewAddressDelivery> {
  String initialPrice = "";
  TextEditingController mobileCon = new TextEditingController();
  TextEditingController emailCon = new TextEditingController();
  TextEditingController nameCon = new TextEditingController();
  TextEditingController addressCon = new TextEditingController();
  TextEditingController landCon = new TextEditingController();
  TextEditingController priceCont = new TextEditingController();

  TextEditingController areaCon = new TextEditingController();
  TextEditingController zipCon = new TextEditingController();
  TextEditingController cityCon = new TextEditingController();
  TextEditingController otherCon = new TextEditingController(text: "Other");
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool saveStatus = true;
  String address_id = "";
  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;
  bool loading = true;
  String type = "Home";
  List<String> typeList = ["Home", "Office", "Other"];
  String? areaId, cityId, pinId;
  String? selectedPin;
  String? pincodeId;
  List<CityModel> cityList = [];


  @override
  void initState() {
    super.initState();
    if(widget.requiredGrams != null || widget.requiredGrams != "") {
      priceCont = TextEditingController(text: widget.requiredGrams);
    }
    getLoc(false);
    getLocation();
    // if(isGold == true) {
    //   priceCont = new TextEditingController(text: widget.goldGrams);
    // }else{
    //   priceCont = new TextEditingController(text: widget.silverGrams);
    // }
  }

  getLocation() async {
    try {
      setState(() {
        saveStatus = false;
      });
      Map params = {
        "get_cities": "1",
        "user_id": App.localStorage.getString("userId").toString(),
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_cities"), params);
      setState(() {
        saveStatus = true;
      });
      if (!response['error']) {
        for (var k in response['data']) {
          cityList.add(CityModel.fromJson(k));
        }
      } else {
        setSnackbar(response['message'], context);
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {
        saveStatus = true;
      });
    }
    if(cityId!=null){
      getArea(cityId);
    }
  }
  List<AreaModel> areaList = [];
  getArea(cityId) async {
    try {
      setState(() {
        areaList.clear();
        areaId =null;
        areaCon.text = "";
        saveStatus = false;
      });
      Map params = {
        "id": cityId.toString(),
        "user_id": App.localStorage.getString("userId").toString(),
      };
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "get_areas_by_city_id"), params);
      setState(() {
        saveStatus = true;
      });
      if (!response['error']) {
        for (var k in response['data']) {
          areaList.add(AreaModel.fromJson(k));
        }
      } else {
        setSnackbar(response['message'], context);
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {
        saveStatus = true;
      });
    }
/*    for(int i = 0;i<areaList.length;i++){
      if(areaList[i].id==widget.addressModel!.areaId){
        setState(() {
          areaId = areaList[i].id;
          areaCon.text = areaList[i].name.toString();
        });
      }
    }*/
    /* if (widget.addressModel == null) {
      if (areaList.length > 0) {
        setState(() {
          areaId = areaList[0].id;
          cityId = areaList[0].city_id;
          pinId = areaList[0].pincode_id;
          cityCon.text = areaList[0].city_name;
          areaCon.text = areaList[0].area_name;
          // zipCon.text = areaList[0].pincode;
          stateCon.text = areaList[0].status;
        });
      }
    }
    else {
      setState(() {
        nameCon.text = widget.addressModel!.name;
        mobileCon.text = widget.addressModel!.mobile;
        emailCon.text = widget.addressModel!.email;
        addressCon.text = widget.addressModel!.address;
        cityCon.text = widget.addressModel!.city;
        // zipCon.text = widget.addressModel!.pincode;
        countryCon.text = widget.addressModel!.country;
        address_id = widget.addressModel!.address_id;
        areaCon.text = widget.addressModel!.area;
        cityId = widget.addressModel!.city_id;
        pinId = widget.addressModel!.pincode_id;
        areaId = widget.addressModel!.area_id;
        landCon.text = widget.addressModel!.landmark;
        if (widget.addressModel!.type != "Home" &&
            widget.addressModel!.type != "Office") {
          type = "Other";
          otherCon.text = widget.addressModel!.type;
        } else {
          type = widget.addressModel!.type;
        }
      });
    }*/
  }
  bool isGold = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0F261E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff15654F),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/newbackss.png",
            height: 80,
          ),
        ),
        title: Text(
          "Add Delivery Address",
          style: TextStyle(
            color: Color(0xffF3F3F3),
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            children: [
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
        child: Container(
          width: 100.w,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                              setState(() {
                                isGold = !isGold;
                              });
                              // if(isGold){
                              //   setState((){
                              //     priceCont = new TextEditingController(text: widget.goldGrams);
                              //   });
                              // }
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
                              setState(() {
                                isGold = !isGold;
                              });
                              // if(!isGold) {
                              //   priceCont = new TextEditingController(text: widget.silverGrams);
                              // }
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
              secondView(),
              boxHeight(20),
              Container(
                width: getWidth1(624),
                child: Row(
                  children: typeList.map((e) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          type = e;
                        });
                      },
                      child: Container(
                        width: getWidth1(150),
                        height: getHeight1(50),
                        margin: EdgeInsets.only(right: getWidth1(10)),
                        decoration: boxDecoration(
                            radius: 48,
                            bgColor: type == e
                                ? MyColorName.primaryDark
                                : Colors.transparent,
                            color: MyColorName.primaryDark),
                        child: Center(
                          child: text(
                            e,
                            fontFamily: fontMedium,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              boxHeight(50),
              type == "Other"
                  ? Container(
                width: getWidth1(590),
                child: TextFormField(
                  controller: otherCon,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor:
                    MyColorName.colorTextFour.withOpacity(0.3),
                    filled: false,
                    label: text("Other Type"),
                  ),
                ),
              )
                  : SizedBox(),
              boxHeight(50),
              InkWell(
                onTap: () {

                  if (addressCon.text == "") {
                    setSnackbar("Please Enter Full Address", context);
                    return;
                  }
                  if(cityId==null){
                    setSnackbar("Please Select City", context);
                    return;
                  }

                  if (priceCont.text == "") {
                    setSnackbar("Please Enter price ", context);
                    return;
                  }
                  if (type == "Other" && otherCon.text == "") {
                    setSnackbar("Please Enter Type", context);
                    return;
                  }
                  setState(() {
                    saveStatus = false;
                  });
                  if(isGold) {
                    if (double.parse(widget.requiredGrams.toString()) >
                        double.parse(widget.goldGrams.toString())) {
                      Fluttertoast.showToast(
                          msg: "Required product is more than gold/silver available");
                    } else {
                      addAddress();
                    }
                  }else{
                    if (double.parse(widget.requiredGrams.toString()) >
                        double.parse(widget.silverGrams.toString())) {
                      Fluttertoast.showToast(
                          msg: "Required product is more than gold/silver available");
                    } else {
                      addAddress();
                    }
                  }

                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  width: saveStatus ? getWidth1(622) : getHeight1(88),
                  height: getHeight1(88),
                  decoration: boxDecoration(
                      radius: 48, bgColor: MyColorName.primaryDark),
                  child: Center(
                    child: saveStatus
                        ? text(
                        "Save Delivery Address",
                        fontFamily: fontMedium,
                        fontSize: 10.sp,
                        textColor: MyColorName.colorTextPrimary
                    )
                        : CircularProgressIndicator(
                      color: MyColorName.colorTextPrimary,
                    ),
                  ),
                ),
              ),
              boxHeight(150),
            ],
          ),
        ),
      ),
    );
  }
  PersistentBottomSheetController? controller;
  TextEditingController controllerText = new TextEditingController();
  showBottomSheet() async {
    controller = await scaffoldKey.currentState!.showBottomSheet(
          (context) {
        return SingleChildScrollView(
          child: Container(
            width: getWidth(720),
            color: MyColorName.appbarBg,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: getWidth(590),
                  child: TextFormField(
                    controller: controllerText,
                    onChanged: (value) {
                      for (int i = 0; i < cityList.length; i++) {
                        if (cityList[i]
                            .name!
                            .toLowerCase()
                            .contains(value.toString().toLowerCase())) {
                          controller!.setState!(() {
                            cityList[i].check = true;
                          });
                        } else {
                          cityList[i].check = false;
                        }
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                      filled: false,
                      label: text("Search "),
                    ),
                  ),
                ),
                boxHeight(20),
                Container(
                  width: getWidth(590),
                  child: ListView.builder(
                      itemCount: cityList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return cityList[index].check!
                            ? InkWell(
                          onTap: () {
                            controller!.setState!(() {
                              cityId = cityList[index].id;
                              cityCon.text = cityList[index].name.toString();
                            });
                            getArea(cityId);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(getWidth(15)),
                            color: cityId == cityList[index].id
                                ? MyColorName.colorIcon.withOpacity(0.3)
                                : MyColorName.appbarBg,
                            child: text(
                                cityList[index].name.toString(),
                                textColor: MyColorName.colorIcon,
                                fontSize: 12.sp,
                                fontFamily: fontMedium),
                          ),
                        )
                            : SizedBox();
                      }),
                ),
                boxHeight(10),
              ],
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.sp),
            bottomLeft: Radius.circular(10.sp),
          )),
    );
  }
  PersistentBottomSheetController? controller1;
  TextEditingController controllerText1 = new TextEditingController();
  showBottomSheet1() async {
    controller1 = await scaffoldKey.currentState!.showBottomSheet(
          (context) {
        return SingleChildScrollView(
          child: Container(
            width: getWidth(720),
            color: MyColorName.appbarBg,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: getWidth(590),
                  child: TextFormField(
                    controller: controllerText1,
                    onChanged: (value) {
                      for (int i = 0; i < areaList.length; i++) {
                        if (areaList[i]
                            .name!
                            .toLowerCase()
                            .contains(value.toString().toLowerCase())) {
                          controller1!.setState!(() {
                            areaList[i].check = true;
                          });
                        } else {
                          areaList[i].check = false;
                        }
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                      filled: false,
                      label: text("Search "),
                    ),
                  ),
                ),
                boxHeight(20),
                Container(
                  width: getWidth(590),
                  child: ListView.builder(
                      itemCount: areaList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return areaList[index].check!
                            ? InkWell(
                          onTap: () {
                            controller1!.setState!(() {
                              areaId = areaList[index].id;
                              areaCon.text = areaList[index].name.toString();
                              zipCon.text = areaList[index].pincode.toString();
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(getWidth(15)),
                            color: areaId == areaList[index].id
                                ? MyColorName.colorIcon.withOpacity(0.3)
                                : MyColorName.appbarBg,
                            child: text(
                                areaList[index].name.toString(),
                                textColor: MyColorName.colorIcon,
                                fontSize: 12.sp,
                                fontFamily: fontMedium),
                          ),
                        )
                            : SizedBox();
                      }),
                ),
                boxHeight(10),
              ],
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.sp),
            bottomLeft: Radius.circular(10.sp),
          )),
    );
  }
  Future<List<Address>> _getAddress1(String address) async {
    var add;
    try {
      add = await Geocoder.local.findAddressesFromQuery(address);
      setState(() {
        saveStatus = false;
      });
      return add;
    } catch (e) {
      print(e);
      setState(() {
        saveStatus = true;
      });
      setSnackbar("Address Not Available", context);
    }
    return add;
  }

  String firstLocation = "", lat = "", lng = "";
  double goldRate = 5262.96;
  double silverRate = 63;
  double amount = 0;

  addAddress() async {
    isGold ?
        amount = goldRate * double.parse(priceCont.text.toString())
    : amount = silverRate * double.parse(priceCont.text.toString());

    try {
      setState(() {
        saveStatus = false;
      });
      Map params = {
        "user_id": App.localStorage.getString("userId").toString(),
        "address": addressCon.text.toString(),
        "latitude": lat.toString(),
        "longitude": lng.toString(),
        "type" :isGold ? "1" : "2", //gold
        "amount" : amount.toStringAsFixed(2),
        'grams': priceCont.text.toString()
        //isGold ? priceCont.text.toString() //gold
      };
      print("this is new request ### ${params.toString()}");
      Map response = await apiBase.postAPICall(
          Uri.parse(baseUrl + "calculate_product_request"), params);
      setState(() {
        saveStatus = true;
      });
      if (!response['error']) {
        GetDeliveryChargeModel getDeliveryChargeModel =  GetDeliveryChargeModel.fromJson(response);
        if(getDeliveryChargeModel != null){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  DeliveryAddressPage(
                    getDeliveryChargeModel: getDeliveryChargeModel,
                  type: isGold,
                  productId: widget.productIds,
                  totalGrams: priceCont.text,))).then((value) => {
            // setState((){
            //   saveStatus = false;
            // })
          });
        }

      } else {
        setSnackbar(response['message'], context);
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something Went Wrong", context);
      setState(() {
        saveStatus = true;
      });
    }

    /*  String addressData =
        "${addressCon.text.toString()} ${landCon.text.toString()},${countryCon.text.toString()}";
    print(addressData);
    _getAddress1(addressData).then((value) async {
      firstLocation = value.first.subLocality.toString();
      print(value.first.coordinates.latitude.toString() +
          " | " +
          value.first.coordinates.longitude.toString());
      lat = value.first.coordinates.latitude.toString();
      lng = value.first.coordinates.longitude.toString();
      print("Lat" + lat);
      try {
        setState(() {
          saveStatus = false;
        });
        Map params = {
          "add_addresss": "1",
          "user_id": curUserId.toString(),
          "mobile": mobileCon.text.toString(),
          "name": nameCon.text.toString(),
          "type": type.toString() == "Other" ? otherCon.text : type.toString(),
          "address": addressCon.text.toString(),
          "landmark": landCon.text.toString(),
          "area_id": areaId.toString(),
          "pincode": zipCon.text.toString(),
          "city_id": cityId.toString(),
          "city": cityCon.text.toString(),
          "state": stateCon.text.toString(),
          "email": emailCon.text.toString(),
          "country": countryCon.text.toString(),
          "latitude": lat.toString(),
          "longitude": lng.toString(),
          "is_default": type == "Home" ? "1" : "0",
        };
        Map response = await apiBase.postAPICall(
            Uri.parse(baseUrl + "add_address"), params);
        setState(() {
          saveStatus = true;
        });
        if (!response['error']) {
          Navigator.pop(context, "yes");
        } else {
          setSnackbar(response['message'], context);
        }
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          saveStatus = true;
        });
      }
    });
    return;*/
  }

  updateAddress() async {
    String addressData =
        "${addressCon.text.toString().replaceAll(",", " ")},";
    print(addressData);
    _getAddress1(addressData).then((value) async {
      firstLocation = value.first.subLocality.toString();
      print(value.first.coordinates.latitude.toString() +
          " | " +
          value.first.coordinates.longitude.toString());
      lat = value.first.coordinates.latitude.toString();
      lng = value.first.coordinates.longitude.toString();
      print("Lat" + lat);
      try {
        setState(() {
          saveStatus = false;
        });
        Map params = {
          "update_address": "1",
          "id": address_id,
          "user_id": App.localStorage.getString("userId").toString(),
          "mobile": mobileCon.text.toString(),
          "name": nameCon.text.toString(),
          "type": type.toString() == "Other" ? otherCon.text : type.toString(),
          "address": addressCon.text.toString(),
          "landmark": landCon.text.toString(),
          "area_id": areaId.toString(),
          "pincode": zipCon.text.toString(),
          "city_id": cityId.toString(),
          "city": cityCon.text.toString(),
          "email": emailCon.text.toString(),
          "latitude": lat.toString(),
          "longitude": lng.toString(),
          "is_default": type == "Home" ? "1" : "0",
        };

        print("USER ADDRESS PARAM ================= $params");

        Map response = await apiBase.postAPICall(
            Uri.parse(baseUrl + "update_address"), params);
        setState(() {
          saveStatus = true;
        });
        if (!response['error']) {
          Navigator.pop(context, "yes");
        } else {
          setSnackbar(response['message'], context);
        }
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          saveStatus = true;
        });
      }
    });
    return;
  }
  String pinId1 = "";
  secondView() {
    return Container(
      width: getWidth1(624),
      child: Column(
        children: [
        /*  Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: nameCon,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Full Name"),
              ),
            ),
          ),
          *//*   boxHeight(50),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: emailCon,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Email Address"),
              ),
            ),
          ),*//*
          boxHeight(50),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: mobileCon,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Mobile Number"),
              ),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Row(
              children: [
                Text(
                  isGold ?
                  "Available Gold : ${widget.goldGrams} gms"
                      :
                       "Available Silver : ${widget.silverGrams} gms"
                )
              ],
            ),
          ),
          boxHeight(15),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: priceCont,
              enabled: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Total Gram"),
              ),
            ),
          ),
          boxHeight(20),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: addressCon,
              onTap: () async {},
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Enter Address"),
              ),
            ),
          ),
          boxHeight(15),
          InkWell(
            onTap: () {
              if (_currentPosition != null) {
                setState(() {
                  addressCon.text = addr;
                     // areaCon.text = area;
                  zipCon.text = pin;
                  cityCon.text = city;

                  lat = _currentPosition!.latitude.toString();
                  lng = _currentPosition!.longitude.toString();
                });
              } else {
                setSnackbar("Please Wait!!", context);
                getLoc(true);
              }
            },
            child: Container(
              width: getWidth1(590),
              child: Row(
                children: [
                  Icon(
                    Icons.location_searching,
                    color: MyColorName.colorIcon,
                  ),
                  boxWidth(10),
                  text("Use Current Location"),
                ],
              ),
            ),
          ),
          boxHeight(50),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: landCon,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Enter Landmark"),
              ),
            ),
          ),

          boxHeight(50),
          Container(
            width: getWidth1(590),
            child: TextFormField(
              controller: cityCon,
              enabled: true,
              readOnly: true,
              onTap: (){
                showBottomSheet();
              },
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                filled: false,
                label: text("Enter City"),
              ),
            ),
          ),
          boxHeight(20),
          Container(
            width: getWidth1(590),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: getWidth1(260),
                  child: TextFormField(
                    controller: areaCon,
                    enabled: true,
                    readOnly: true,
                    onTap: (){
                      if(areaList.length>0)
                        showBottomSheet1();
                      else
                        setSnackbar("Please Select City", context);
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                      filled: false,
                      label: text("Area"),
                    ),
                  ),
                ),
                Container(
                  width: getWidth1(260),
                  child: TextFormField(
                    controller: zipCon,
                    enabled: true,
                    readOnly: true,
                    onTap: (){

                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: MyColorName.colorTextFour.withOpacity(0.3),
                      filled: false,
                      label: text("Zip Code"),
                    ),
                  ),
                ),

              ],
            ),
          ),
          boxHeight(50),
        ],
      ),
    );
  }

  LocationData? _currentPosition;

  String _address = "",
      addr = "",
      landmark = "",
      area = "",
      city = "",
      pin = "";
  Location location1 = Location();

  Future<void> getLoc(bool status) async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location1.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location1.requestService();
      if (!_serviceEnabled) {
        print('ek');
        return;
      }
    }

    _permissionGranted = await location1.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location1.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('no');
        return;
      }
    }

    location1.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.latitude} : ${currentLocation.longitude}");
      if (mounted) {
        setState(() {
          _currentPosition = currentLocation;
          print(currentLocation.latitude);
          _getAddress(_currentPosition!.latitude, _currentPosition!.longitude)
              .then((value) {
            setState(() {
              _address = "${value.first.addressLine}";
              firstLocation = value.first.subLocality.toString();
              addr = value.first.addressLine.split(value.first.subLocality)[0];
              landmark = value.first.locality;
                area = value.first.subLocality;
              city = value.first.locality;
              // pin = value.first.postalCode;

              // print(value.first.addressLine);
              // print(value.first.locality);
              // print(value.first.adminArea);
              // print(value.first.subLocality);
              // print(value.first.postalCode);
              if (status) {
                addressCon.text = '$addr''$landmark';
                //landCon.text = landmark;
                areaCon.text = area;
                // zipCon.text = pin;
                cityCon.text = city;
                lat = _currentPosition!.latitude.toString();
                lng = _currentPosition!.longitude.toString();
              }
            });
          });
        });
      }
    });
  }

  Future<List<Address>> _getAddress(double? lat, double? lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> add =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

}
