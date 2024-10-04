import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class RegisterController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;

  final periodStartDate = "".obs;
  final dueDate = "".obs;
  final congratsMsg = "".obs;

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    throw Exception("This is a crash!");
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
