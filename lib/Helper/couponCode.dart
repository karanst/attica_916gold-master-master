import 'package:atticadesign/Api/api.dart';
import 'package:atticadesign/Helper/myCart.dart';
import 'package:atticadesign/Helper/wallettopup.dart';
import 'package:atticadesign/Model/GetCouponModel.dart';
import 'package:atticadesign/bottom_navigation.dart';
import 'package:atticadesign/notifications.dart';
import 'package:flutter/material.dart';

class CouponCode extends StatefulWidget {
  const CouponCode({Key? key}) : super(key: key);

  @override
  State<CouponCode> createState() => _CouponCodeState();
}

class _CouponCodeState extends State<CouponCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F261E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15654F),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            );
          },
          child: Image.asset(
            "assets/images/newbackss.png",
            height: 8,
            width: 8,
          ),
        ),
        title: Text(
          "Coupon code",
          style: TextStyle(color: Colors.white54),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCart()),
              );
            },
            child: Image.asset(
              "assets/images/shop.png",
              height: 15,
              width: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotiPage()),
                );
              },
              child: Image.asset(
                "assets/images/well.png",
                height: 15,
                width: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //     color: Color(0xff376356),
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => WalletTopups()),
            //         );
            //       },
            //       child: Center(
            //         child: Container(
            //           height: 45,
            //           child: Center(
            //             child: TextField(
            //               maxLines: 1,
            //               style: TextStyle(fontSize: 15),
            //               textAlignVertical: TextAlignVertical.center,
            //               decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   filled: true,
            //                   hintStyle: TextStyle(
            //                       color: Color(0xffF1D459).withOpacity(0.3)),
            //                   hintText: 'Enter coupon code',
            //                   suffix: Text("Apply Code")),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Active coupon code ",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                color: Color(0xff24745E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: FutureBuilder(
                    future: getCouponcode(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      GetCouponModel? coupan = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: coupan!.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text(
                                        "${coupan.data![index].promoCode}",
                                        style: TextStyle(
                                            color: Color(0xffF1D459),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "${coupan.data![index].message}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color(0xffffffff)
                                                .withOpacity(0.5),
                                            fontSize: 14),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Colors.black,
                                      width: 2,
                                      thickness: 2,
                                      indent: 5,
                                      endIndent: 0,
                                    ),
                                    Text(
                                      "${coupan.data![index].minimumOrderAmount}",
                                      style: TextStyle(
                                          color: Color(0xffF1D459),
                                          fontSize: 25),
                                    ),

                                  ],
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(child: Icon(Icons.error_outline));
                      } else {
                        return Center(
                          child: Container(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          ),
                        );
                      }
                    })),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
