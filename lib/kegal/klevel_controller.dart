import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class KegalLevelsController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  late SharedPreferences prefs;

  var levelsList = [].obs;
  late Box kegalLevel;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    kegalLevel = await Hive.openBox(Constants.KEGAL_LEVEL_DATA);
    kegalLevel.put(1, ["LEVEL 1, Training time: 8m 18s"]);
    kegalLevel.put(2, ["LEVEL 2, Training time: 9m 51s"]);
    kegalLevel.put(3, ["LEVEL 3, Training time: 11m 32s"]);
    kegalLevel.put(4, ["LEVEL 4, Training time: 17m 46s"]);
    kegalLevel.put(5, ["LEVEL 5, Training time: 21m 25s"]);
    kegalLevel.put(6, ["LEVEL 6, Training time: 23m 7s"]);
    kegalLevel.put(7, ["LEVEL 7, Training time: 25m 16s"]);
    kegalLevel.put(8, ["LEVEL 8, Training time: 27m 33s"]);
    kegalLevel.put(9, ["LEVEL 9, Training time: 29m 13s"]);
    kegalLevel.put(10, ["LEVEL 10, Training time: 36m 24s"]);
    kegalLevel.put(11, ["LEVEL 11, Training time: 39m 58s"]);
    kegalLevel.put(12, ["LEVEL 12, Training time: 42m 45s"]);
    kegalLevel.put(13, ["LEVEL 13, Training time: 45m 45s"]);
    kegalLevel.put(14, ["LEVEL 14, Training time: 55m 15s"]);
    kegalLevel.put(15, ["LEVEL 15, Training time: 57m 48s"]);
    kegalLevel.put(16, ["LEVEL 16, Training time: 1h 1m"]);
    kegalLevel.put(17, ["LEVEL 17, Training time: 1h 14m"]);
    kegalLevel.put(18, ["LEVEL 18, Training time: 1h 17m"]);
    kegalLevel.put(19, ["LEVEL 19, Training time: 1h 21m"]);
    kegalLevel.put(20, ["LEVEL 20, Training time: 2h"]);

    levelsList.clear();
    for (int i = 0; i < kegalLevel.length; i++) {
      levelsList.add(kegalLevel.getAt(i)[0]);
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
