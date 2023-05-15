import 'dart:convert';
import 'dart:io';

import 'package:atticadesign/Api/api.dart';
import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Model/UserDetailsModel.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import '../Utils/Common.dart';
import '../Utils/constant.dart';
import 'Session.dart';

class KYCScreen extends StatefulWidget {
  final bool isKyc;
  UserDetailsModel model;
   KYCScreen({Key? key, required this.isKyc, required this.model}) : super(key: key);

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  String? _dropDownValue;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController EmailCtr = TextEditingController();
  TextEditingController OtpCtr = TextEditingController();
  File? _aadhaarFront,_aadhaarBack, _panImage;

  Future getImage(ImgSource source, BuildContext context, int i) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );

    setState(() {
      // _imageFron = File(image.path);
      getCropImage(context, i, image);
    });
  }
  void getCropImage(BuildContext context, int i, var image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      if(i==1){
        _aadhaarFront = File(croppedFile!.path);
      }else  if(i==2){
        _aadhaarBack = File(croppedFile!.path);
      }else  if(i==3){
        _panImage = File(croppedFile!.path);
      }
    });
  }
  void requestPermission(BuildContext context, int i) async {
    if (await Permission.camera.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      if (statuses[Permission.camera] == PermissionStatus.granted &&
          statuses[Permission.storage] == PermissionStatus.granted) {
        getImage(ImgSource.Gallery, context, i);
      } else {
        if (await Permission.camera.isDenied ||
            await Permission.storage.isDenied) {
          openAppSettings();
        } else {
          setSnackbar("Oops you just denied the permission", context);
        }
      }
    }
  }

  List lista = [
    'Aadhar card',
    'Driving Licence',
    'Passport',
  ];



  Future<void> submitSubscription() async {
    await App.init();
  String? userId =  App.localStorage.getString("userId");
    if (_aadhaarFront != null) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(baseUrl + "kyc_request"),
        );
        Map<String, String> headers = {
          "token": App.localStorage.getString("token").toString(),
          "Content-type": "multipart/form-data"
        };
        request.files.add(
          http.MultipartFile(
            'front_view',
            _aadhaarFront!.readAsBytes().asStream(),
            _aadhaarFront!.lengthSync(),
            filename: _aadhaarFront!.path != null
                ? path.basename(_aadhaarFront!.path)
                : path.basename("assets/images/manuser.png"),
            contentType: MediaType('image', 'jpeg'),
          ),
        );
        if(_aadhaarBack!= null){
          request.files.add(
            http.MultipartFile(
              'back_view',
              _aadhaarBack!.readAsBytes().asStream(),
              _aadhaarBack!.lengthSync(),
              filename: _aadhaarBack!.path != null
                  ? path.basename(_aadhaarBack!.path)
                  : path.basename("assets/images/manuser.png"),
              contentType: MediaType('image', 'jpeg'),
            ),
          );
        } if(_panImage!= null){
          request.files.add(
            http.MultipartFile(
              'front_view',
              _panImage!.readAsBytes().asStream(),
              _panImage!.lengthSync(),
              filename: _panImage!.path != null
                  ? path.basename(_panImage!.path)
                  : path.basename("assets/images/manuser.png"),
              contentType: MediaType('image', 'jpeg'),
            ),
          );
        }
        request.headers.addAll(headers);
        request.fields.addAll({
          "back_view": "",
          "user_id": userId!,
          "type": "1",
        });
        print("request: " + request.toString());
        var res = await request.send();
        print("This is response:" + res.toString());
        if (res.statusCode == 200) {
          final respStr = await res.stream.bytesToString();
          print(respStr.toString());
          Map data = jsonDecode(respStr.toString());
          if (!data['error']) {
            setState(() {
              setSnackbar("KYC uploaded successfully", context);
             Navigator.pop(context);
              // Navigator.pop(context);
            });
          } else {
            Navigator.pop(context);
            setSnackbar("KYC uploaded successfully", context);
          }
        }
      }
    }


@override
void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F261E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15654F),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/newbackss.png",
            height: 80,
            width: 80,
          ),
        ),
        title: Text("KYC Verification"),
        actions: [

        ],
      ),
      body:
      widget.isKyc ?
          widget.model.data![0].kycDocType =="1" ?
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center(child: Text("KYC Already Completed", style: TextStyle(
                 color: colors.grad1Color,
                 fontWeight: FontWeight.w600,
                 fontSize: 20
             ),)),
             SizedBox(
               height: 10,
             ),
             Center(
                 child: Text(
                   "Aadhaar Card",
                   style: TextStyle(color: Colors.white54, fontSize: 20),
                 )),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Container(
                 // height: 280,
                 // width: 300,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(
                     12,
                   ),
                   color: Color(0xff24745E),
                 ),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     // Padding(
                     //   padding: const EdgeInsets.all(8.0),
                     //   child: Container(
                     //     decoration: BoxDecoration(
                     //         color: Color(0xff0C3B2E),
                     //         borderRadius: BorderRadius.circular(30.0)),
                     //     height: 50,
                     //     width: 320,
                     //     child: TextField(
                     //       maxLines: 1,
                     //       maxLength: 12,
                     //       keyboardType: TextInputType.number,
                     //       style: TextStyle(fontSize: 17),
                     //       textAlignVertical: TextAlignVertical.center,
                     //       decoration: InputDecoration(
                     //           border: InputBorder.none,
                     //           filled: true,
                     //           counterText: "",
                     //           hintStyle: TextStyle(
                     //               color: colors.secondary.withOpacity(0.9)),
                     //           hintText: ("Enter Aadhaar number")),
                     //     ),
                     //   ),
                     // ),
                     GestureDetector(
                       onTap: (){
                         // requestPermission(context, 1);
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                             height: 150,
                             width: 325,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(
                                 12,
                               ),
                               color: Color(0xff0C3B2E),
                             ),
                             child:
                             widget.model.data![0].frontView != null
                                 || widget.model.data![0].frontView.toString() != ''?
                                 Image.network(widget.model.data![0].frontView.toString())
                            : Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Image.asset(
                                   "assets/images/upload.png",
                                   height: 20,
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Aadhaar Card (Front)",
                                   style: TextStyle(color: Color(0xffF1D459)),
                                 )
                               ],
                             )
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         // requestPermission(context,2);
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                             height: 150,
                             width: 325,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(
                                 12,
                               ),
                               color: Color(0xff0C3B2E),
                             ),
                             child: widget.model.data![0].backView != null
                                 || widget.model.data![0].backView.toString() != ''?
                             Image.network(widget.model.data![0].backView.toString()):
                             // Image.file(File(_aadhaarBack!.path), height: 150, width: 300,):
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Image.asset(
                                   "assets/images/upload.png",
                                   height: 20,
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   "Aadhaar Card (Back)",
                                   style: TextStyle(color: Color(0xffF1D459)),
                                 )
                               ],
                             )),
                       ),
                     ),
                   ],
                 ),
               ),
             ),

           ],
         )
          :  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("KYC Already Completed", style: TextStyle(
                  color: colors.grad1Color,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),)),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                    "Pan Card",
                    style: TextStyle(color: Colors.white54, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  // height: 280,
                  // width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Color(0xff24745E),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Color(0xff0C3B2E),
                      //         borderRadius: BorderRadius.circular(30.0)),
                      //     height: 50,
                      //     width: 320,
                      //     child: TextField(
                      //       maxLines: 1,
                      //       maxLength: 12,
                      //       keyboardType: TextInputType.number,
                      //       style: TextStyle(fontSize: 17),
                      //       textAlignVertical: TextAlignVertical.center,
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           filled: true,
                      //           counterText: "",
                      //           hintStyle: TextStyle(
                      //               color: colors.secondary.withOpacity(0.9)),
                      //           hintText: ("Enter Aadhaar number")),
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: (){
                          // requestPermission(context, 1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 150,
                              width: 325,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                color: Color(0xff0C3B2E),
                              ),
                              child:
                              widget.model.data![0].frontView != null
                                  || widget.model.data![0].frontView.toString() != ''?
                              Image.network(widget.model.data![0].frontView.toString())
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    "assets/images/upload.png",
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pan Card (Front)",
                                    style: TextStyle(color: Color(0xffF1D459)),
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )
      : ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          /*Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 70,
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: EmailCtr,
                  decoration: InputDecoration(
                      labelText: "Enter email id",
                      hintStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              )),

          InkWell(
              child: Container(
                  height: 60,
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Email Verify",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
              onTap: () async {
                var a = await emailVerication(EmailCtr.text);
                if (a != null) {
                  showDialog(
                    context: context,
                    builder: (ctxt) => new AlertDialog(
                      title: Text("${a.message}"),
                      actions: [
                        GestureDetector(
                          child: Center(child: Text("Okay")),
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                }
              }),
*/
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Container(
          //     height: 70,
          //     width: 300,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(
          //         12,
          //       ),
          //       color: Color(0xff24745E),
          //     ),
          //     child: Center(
          //         child: Text(
          //       "KYC of your Address proof/ Aadhaar Card is \npending please complete to buy gold ",
          //       style: TextStyle(color: Color(0xffF1D459), fontSize: 15),
          //     )),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15, right: 15),
          //   child: Container(
          //     decoration:
          //         BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          //     child: DropdownButton<String>(
          //         value: _dropDownValue,
          //         isExpanded: true,
          //         underline: Container(
          //           height: 1.0,
          //           decoration: const BoxDecoration(),
          //           child: Text(
          //             'Choose Your Delivery Location Type',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 15,
          //             ),
          //           ),
          //         ),
          //         dropdownColor: Color(0xff24745E),
          //        hint: _dropDownValue == null
          //            ? Padding(
          //          padding:
          //          const EdgeInsets.only(left: 10.0),
          //          child: Text(
          //            'Choose Your Delivery Location Type',
          //            style: TextStyle(
          //              color: Colors.white,
          //              fontSize: 15,
          //            ),
          //          ),
          //        )
          //            : Text(
          //          _dropDownValue!,
          //          style: TextStyle(color: Colors.white),
          //        ),
          //         iconSize: 40.0,
          //         iconEnabledColor: Colors.yellow,
          //         style: TextStyle(color: Colors.white),
          //         items: lista.map(
          //           (val) {
          //             return DropdownMenuItem<String>(
          //               value: val,
          //               child: val != null ? Text(val) : Text("Select ID"),
          //             );
          //           },
          //         ).toList(),
          //         onChanged: (val) {
          //           setState(
          //             () {
          //               _dropDownValue = val as String?;
          //             },
          //           );
          //         }),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Aadhaar Card",
            style: TextStyle(color: Colors.white54, fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              // height: 280,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: Color(0xff24745E),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff0C3B2E),
                          borderRadius: BorderRadius.circular(30.0)),
                      height: 50,
                      width: 320,
                      child: TextField(
                        maxLines: 1,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            counterText: "",
                            hintStyle: TextStyle(
                                color: colors.secondary.withOpacity(0.9)),
                            hintText: ("Enter Aadhaar number")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      requestPermission(context, 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 150,
                          width: 325,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            color: Color(0xff0C3B2E),
                          ),
                          child:
                          _aadhaarFront != null ?
                              Image.file(File(_aadhaarFront!.path), height: 150, width: 300,):
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                "assets/images/upload.png",
                                height: 20,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Aadhaar Card (Front)",
                                style: TextStyle(color: Color(0xffF1D459)),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      requestPermission(context,2);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 150,
                          width: 325,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            color: Color(0xff0C3B2E),
                          ),
                          child: _aadhaarBack != null ?
                          Image.file(File(_aadhaarBack!.path), height: 150, width: 300,):
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                "assets/images/upload.png",
                                height: 20,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Aadhaar Card (Back)",
                                style: TextStyle(color: Color(0xffF1D459)),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.white54,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "PanCard",
            style: TextStyle(color: Colors.white54, fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              // height: 180,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: Color(0xff24745E),
              ),
              child: _panImage != null ?
              Image.file(File(_panImage!.path), height: 150, width: 300,):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff0C3B2E),
                          borderRadius: BorderRadius.circular(30.0)),
                      height: 50,
                      width: 320,
                      child: TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 17),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintStyle: TextStyle(
                                color: Color(0xffafaf7b).withOpacity(0.3)),
                            hintText: ("Enter Pan number")),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      requestPermission(context, 3);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 325,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          color: Color(0xff0C3B2E),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/images/upload.png",
                              height: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pan Card (Front)",
                              style: TextStyle(color: Color(0xffF1D459)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(_aadhaarFront!= null) {
                submitSubscription();
              }else{
                setSnackbar("Please upload your documents for your KYC", context);

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
                height: 50,
                width: 160,
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(color: Color(0xff004B3F), fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]
      ),
    );
  }

  String? isEmailValid(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }
}


class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: Colors.indigoAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        // ExpandableIcon(
                        //   theme: const ExpandableThemeData(
                        //     expandIcon: Icons.arrow_right,
                        //     collapseIcon: Icons.arrow_drop_down,
                        //     iconColor: Colors.white,
                        //     iconSize: 28.0,
                        //     iconRotationAngle: math.pi / 2,
                        //     iconPadding: EdgeInsets.only(right: 5),
                        //     hasIcon: false,
                        //   ),
                        // ),
                        Expanded(
                          child: Text(
                            "Items",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: buildList(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
