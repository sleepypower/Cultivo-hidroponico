

import 'package:cultivo_hidroponico/Domain/Controllers/dashBoardController.dart';
import 'package:cultivo_hidroponico/Screens/actuatorPage.dart';
import 'package:cultivo_hidroponico/Screens/home.dart';
import 'package:cultivo_hidroponico/Screens/logIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                ActuatorPage(),
                Home(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey[80],
            selectedItemColor: Colors.white,
            onTap: controller.changeTabIndex,
            currentIndex: controller.pageIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff32B768),
            elevation: 100,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.wrench),
                label: "label",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "label",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock),
                label: "label",
              ),
            ],
          ),
        );
      },
    );
  }
  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}