// add_supllement_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSupplementController extends GetxController {
  final textController = TextEditingController();
  var text = ''.obs;
  var isReminderBeforeTimeChecked = false.obs;
  var isReminderAfterTimeChecked = false.obs;

  @override
  void onInit() {
    textController.addListener(() {
      text.value = textController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
