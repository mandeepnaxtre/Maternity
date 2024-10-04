import 'package:flutter/material.dart';
import 'package:get/get.dart';


String base_url = "https://nirmaltamang1.com.np/bhajan/api/v1/";

void showSuccessMessage(String message, {String title = ""}) {
  Get.log(message);
  Get.snackbar(title, message,
      backgroundColor: Colors.green, colorText: Colors.white);
}

void showErrorMessage(String message, {String title = ""}) {
  Get.log(message, isError: true);
  Get.snackbar(title, message,
      backgroundColor: Colors.red, colorText: Colors.white);
}
