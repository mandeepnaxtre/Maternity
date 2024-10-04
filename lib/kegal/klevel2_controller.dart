import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class KegalLevel2Controller extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  late SharedPreferences prefs;

  var levelsList2 = [].obs;
  late Box kegalLevel2;

  var send = [].obs;

  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();
    kegalLevel2 = await Hive.openBox(Constants.KEGAL_LEVEL2_DATA);

    kegalLevel2.put(1, ["DAY 1", "3s-3s, 10 times", "10s-10s-10s"]);
    kegalLevel2.put(2, ["DAY 2", "3s-3s, 11 times", "10s-10s-10s"]);
    kegalLevel2.put(3, ["DAY 3", "3s-3s, 12 times", "10s-10s-10s"]);
    kegalLevel2.put(4, ["DAY 4", "3s-3s, 10 times", "12s-10s-10s"]);
    kegalLevel2.put(5, ["DAY 5", "3s-3s, 12 times", "12s-12s-10s"]);

    /*kegalLevel.put(6, ["LEVEL 6, Training time: 23m 7s"]);
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
    kegalLevel.put(20, ["LEVEL 20, Training time: 2h"]);*/

    levelsList2.clear();
    for (int i = 0; i < kegalLevel2.length; i++) {
      //levelsList2.add(kegalLevel2.getAt(i)[0]);

      // send = [
      //   {'level': kegalLevel2.getAt(i)[0].toString().split(',')},
      //   {"Classic": "3s-3s, 10 times", "Pulses": "10s-10s-10s"}
      // ];

      levelsList2.add({
        'day': kegalLevel2.getAt(i)[0].toString(),
        'classic': kegalLevel2.getAt(i)[1].toString(),
        'pulse': kegalLevel2.getAt(i)[2].toString(),
      });
      //levelsList2.add(send);
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
