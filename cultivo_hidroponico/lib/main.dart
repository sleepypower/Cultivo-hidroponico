import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Domain/Authentication/AuthenticationController.dart';
import 'Screens/logIn.dart';
import 'Screens/signUp.dart';

void main() {
  Get.put(AuthenticationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LogIn(),
      getPages: [
        GetPage(name: '/LogIn', page: () => LogIn()),
        GetPage(name: '/SignUp', page: () => SignUp()),
      ],
    );
  }
}

