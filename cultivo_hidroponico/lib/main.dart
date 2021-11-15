import 'package:cultivo_hidroponico/Screens/dashboard.dart';
import 'package:cultivo_hidroponico/Screens/sensorPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Domain/Controllers/AuthenticationController.dart';
import 'Domain/Controllers/dashBoardController.dart';
import 'Screens/home.dart';
import 'Screens/logIn.dart';
import 'Screens/signUp.dart';

void main() {
  Get.put(AuthenticationController());
  Get.put(DashBoardController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
      getPages: [
        GetPage(name: '/LogIn', page: () => LogIn()),
        GetPage(name: '/SignUp', page: () => SignUp()),
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/Dashboard', page: () => Dashboard()),
        GetPage(name: '/Sensor', page: () => SensorPage()),
      ],
    );
  }
}

