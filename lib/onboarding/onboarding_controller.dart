import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

//changes
class OnBoardingController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  late TabController tabController;
  var tabObxcount = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    //tabController = TabController(length: 5, vsync: this);
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
