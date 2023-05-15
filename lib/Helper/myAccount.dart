import 'dart:convert';

import 'package:atticadesign/Api/api.dart';
import 'package:atticadesign/Helper/Color.dart';
import 'package:atticadesign/Helper/Session.dart';
import 'package:atticadesign/Helper/wishlist.dart';
import 'package:atticadesign/HomePage.dart';
import 'package:atticadesign/Model/UserDetailsModel.dart';
import 'package:atticadesign/Utils/Common.dart';
import 'package:atticadesign/Utils/colors.dart';
import 'package:atticadesign/Utils/constant.dart';
import 'package:atticadesign/Utils/widget.dart';
import 'package:atticadesign/authentication/login.dart';
import 'package:atticadesign/bottom_navigation.dart';
import 'package:atticadesign/notifications.dart';
import 'package:atticadesign/privacypolicy.dart';
import 'package:atticadesign/screen/address_list_view.dart';
import 'package:atticadesign/screen/measurements.dart';
import 'package:atticadesign/screen/order_list.dart';
import 'package:atticadesign/splash.dart';
import 'package:atticadesign/termsandcondition.dart';
// import 'package:call_log/call_log.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../ContactsPage.dart';
import '../Utils/walletList.dart';
import '../helpandsupport.dart';
import '../orderHistory.dart';
import '../transaction.dart';
import 'editProfile.dart';

import 'kYC.dart';
import 'm-pin-set.dart';
import 'package:http/http.dart' as http;


class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  bool isKyc = false;

  @override
  void initState() {
    super.initState();
    getSaved();
    getUserDetails();
  }

  getUserDetails() async{
    await App.init();
    userId =   App.localStorage.getString("userId");
  }

  UserDetailsModel userDetailsModel = UserDetailsModel();
  String? userId;

  getSaved() async {
    userDetailsModel = await userDetails(App.localStorage.getString("userId").toString());
    await App.init();
    if (App.localStorage.getString("address") != null) {
      setState(() {
        userId = App.localStorage.getString("userId").toString();
      });
    }
    if (App.localStorage.getString("address") != null) {
      setState(() {
        deliveryLocation = App.localStorage.getString("address").toString();
      });
    }
    if (App.localStorage.getString("image") != null) {
      setState(() {
        image = App.localStorage.getString("image").toString();
      });
    }
    if (App.localStorage.getString("name") != null) {
      setState(() {
        name = App.localStorage.getString("name").toString();
      });
    }
    if (App.localStorage.getString("email") != null) {
      setState(() {
        email = App.localStorage.getString("email").toString();
      });
    } if (App.localStorage.getString("KYC") != null) {
      setState(() {
        KYC = App.localStorage.getString("KYC").toString();
      });
    }
    if (App.localStorage.getString("phone") != null) {
      setState(() {
        mobile = App.localStorage.getString("phone").toString();
      });
    }
  }

  accountDelete() async {
    var headers = {
      'Cookie': 'ci_session=3ab2e0bfe4c2535c351d13c7ca58f780dce6aa8f'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse('${baseUrl1}remove_user?user_id=$userId'));
    // request.fields.addAll({
    //
    // });
    print("this is request =====>>>>> ${baseUrl1}remove_user?user_id=$userId");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("this response @@ ${response.statusCode}");
      final str = await response.stream.bytesToString();
      var result= json.decode(str);
      if(result['status'] == true){
        setSnackbar("${result['message']}", context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()));
      }else{
        setSnackbar("${result['message']}", context);
      }
      // var result = GetProfileModel.fromJson(json.decode(str));
      // approvalStatus = result.data![0].status;
      // uName = result.data![0].uname;
      // userImage = result.data![0].profileImage;
      // wallet = result.data![0].wallet.toString();
      // prefs.setString(TokenString.walletBalance, wallet.toString());
      // print("this is approval status ====>>> ${approvalStatus.toString()}");
      // if (approvalStatus == "0") {
      //   setState(() {
      //     isSwitched = false;
      //   });
      // } else {
      //   setState(() {
      //     isSwitched = true;
      //   });
      // }
      // // prefs.setString(TokenString.approvalStatus, approvalStatus!);
      // print("this is approval status ====>>> ${approvalStatus.toString()}");
      //
      // return GetProfileModel.fromJson(json.decode(str));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F261E),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: commonHWImage(
                    image,
                    100.0,
                    100.0,
                    "assets/images/manuser.png",
                    context,
                    "assets/images/manuser.png"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(name,
                  style: TextStyle(color: Colors.white,fontSize: 20))),
              SizedBox(height: 20,),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset("assets/images/edit.png",height: 20,),
                      onTap: ()async{
                        var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                        if(result!=null){
                          getSaved();
                        }
                      },
                      title: Text("Edit Profile",style: TextStyle(color: Colors.white,fontSize: 18),),

                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
            /*  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    // GET WHOLE CALL LOG
                    getPermissionUser();
                  },
                  child: Card(
                    color: Color(0xff24745E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/yourkyc.png",height: 20,),
                          // SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("Call Log",style: TextStyle(color: Colors.white,fontSize: 17)),
                          ),
                          SizedBox(width: 150,),
                          // Image.asset("assets/images/redregtangle.png",height: 20,),
                          // SizedBox(width: 10,),
                          // Text("Not Verified",style: TextStyle(color: Color(0xffFF0000),fontSize: 15)),
                          // SizedBox(width: 30,),
                          Image.asset("assets/images/rightarrow.png",height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),*/
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset("assets/images/wishlist.png",height: 20,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Wishlist()),
                        );
                      },
                      title: Text("Wish list",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),
                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading:Icon(Icons.gpp_good,color: Colors.yellow[600],size: 30),
                      onTap: (){

                        if(KYC == "1"){
                         setState((){
                           isKyc = true;
                         });
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  KYCScreen(
                            isKyc: isKyc,
                            model: userDetailsModel,
                          )),
                        );
                      },
                      title: Text("KYC",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),
                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading:Icon(Icons.pin,color: Colors.yellow[600],size: 30),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PinScreen(
                            reset: false,
                          )),
                        );
                      },
                      title: Text("Set M-Pin",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),
                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
              userId != null ?
              SizedBox.shrink()
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(Icons.login, size: 20, color: colors.grad1Color,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      title: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              ),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.scale,
                      color: Colors.yellow[600],
                      size: 24,
                      ),
                      // Image.asset("assets/images/wishlist.png",height: 20,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Measurement()),
                        );
                      },
                      title: Text("Measurements",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),
                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.location_on,size: 24.sp,color:MyColorName.colorIcon,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddressList(false,false)),
                        );
                      },
                      title: Text("My Address",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Card(
              //     color: Color(0xff24745E),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ListTile(
              //         leading:  Icon(Icons.account_balance_wallet,color:MyColorName.colorIcon),
              //         onTap: (){
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) =>  WalletList()),
              //           );
              //         },
              //         title: Text("My Wallet",style: TextStyle(color: Colors.white,fontSize: 18),),
              //         trailing:
              //         Image.asset("assets/images/rightarrow.png",height: 20,),
              //
              //       ),
              //     ),
              //   ),
              // ),
          /*    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  OrderList()),
                        );
                      },
                      leading: Image.asset("assets/images/myoder.png",height: 20,),
                      title: Text("Order History",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),
                    ),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Image.asset("assets/images/helpsupport.png",height: 20,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HelpAndSupport()),
                        );
                      },
                      title: Text("Help and support",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              ),
            userId != null ?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color(0xff24745E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Image.asset("assets/images/helpsupport.png",height: 20,),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Transaction()),
                      );
                    },
                    title: Text("My Orders",style: TextStyle(color: Colors.white,fontSize: 18),),
                    trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                  ),
                ),
              ),
            )
              : SizedBox.shrink(),

              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(Icons.delete_forever, color: MyColorName.colorIcon,),
                      onTap: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete Account"),
                                content: Text("Are you sure you want to delete your account?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: colors.grad1Color),
                                    child: Text("YES",
                                    style: TextStyle(color: colors.primary),),
                                    onPressed: () async {
                                      accountDelete();

                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: colors.grad1Color),
                                    child: Text("NO",
                                    style: TextStyle(color: colors.primary),),
                                    onPressed: () {
                                      print("this is current userid ${userId.toString()}");
                                  Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      title: Text("Delete Account",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PrivacyPolicyPage()),
                        );
                      },
                      leading: Image.asset("assets/images/privacy.png",height: 20,),
                      title: Text("Privacy Policy",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  TermsAndConditions()),
                        );
                      },
                      leading: Image.asset("assets/images/term.png",height: 20,),
                      title: Text("Terms and Conditions",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              ),
              userId != null ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff24745E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: colors.primary,
                                title: Text("Logout",
                                style: TextStyle(
                                  color:  Color(0xffF1D459)
                                ),),

                                content: Text("Do You Want to Logout ?",
                                  style: TextStyle(
                                      color:  Color(0xffF1D459)
                                  ),),

                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffF1D459)
                                    ),
                                    child: Text('No',
                                      style: TextStyle(color: colors.primary),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffF1D459)
                                      ),
                                      child: Text('Yes',
                                        style: TextStyle(color: colors.primary),),

                                      onPressed: () async {
                                        await App.init();
                                        App.localStorage.clear();
                                        //Common().toast("Logout");
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
                                      }),
                                ],
                              );
                            });
                      },
                      leading: Image.asset("assets/images/logout.png",height: 20,),
                      title: Text("Log Out",style: TextStyle(color: Colors.white,fontSize: 18),),
                      trailing: Image.asset("assets/images/rightarrow.png",height: 20,),

                    ),
                  ),
                ),
              )
              : SizedBox.shrink(),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  //Check contacts permission

  void getPermissionUser() async {
    if (await Permission.phone.request().isGranted) {
     /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlutterContactsExample()));*/
    } else {
      await Permission.phone.request();
    }
  }

}
