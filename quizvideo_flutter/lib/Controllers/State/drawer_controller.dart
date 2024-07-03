import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  RxString selectedItem = ''.obs;

  selectItem(BuildContext context, String item) {
    if (selectedItem.value == item) {
      selectedItem.value = '';
      return;
    }
    selectedItem.value = item;
  }
}
