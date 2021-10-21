import 'package:get/get.dart';

class DashBoardController extends GetxController {

  var pageIndex = 1.obs;
  var h = "Hey".obs;

  //int get pageIndex => pageIndex.value;

  void changeTabIndex (int index) {
    pageIndex.value = index;
  }

}

