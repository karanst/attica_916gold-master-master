import 'dart:io';

import 'package:atticadesign/Utils/PushNotificationService.dart';
import 'package:atticadesign/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(myForgroundMessageHandler);
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (context) =>  MySplshScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: '916 Digital Gold',
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home:
        //SplashPage()
        MySplshScreen(),
      );
    });
  }
}
