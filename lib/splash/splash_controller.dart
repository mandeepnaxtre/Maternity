import 'dart:async';
import 'package:get/get.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

//changes
class SplashController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    Timer(const Duration(milliseconds: 2000), () {
      Get.offNamed(Routes.onboarding.path);
    });
  }
}
