import 'dart:async';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

//changes
class ProfileController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  late Box dailyUpdateData;
  @override
  void onInit() async {
    super.onInit();

    dailyUpdateData = await Hive.openBox(Constants.UPDATE_DATA);
  }

  @override
  void onReady() async {
    super.onReady();

  }
}
