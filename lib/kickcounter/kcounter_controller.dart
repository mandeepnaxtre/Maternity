import 'dart:async';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class KickCounterController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  var check1 = true.obs;
  var check2 = true.obs;
  var check3 = true.obs;
  var weightInKgs = 60.0.obs;
  var heightInMeter = 1.60.obs;
  var weightAddedByPatientList = <FlSpot>[].obs;

  //weight tracker parameters
  var patientStartWeight = 0.0.obs;
  var patientCurrentWeight = 0.0.obs;
  var patientExpWeight = 0.0.obs;
  var patientHeight = 0.0.obs;
  late DateTime periodStartDate;

  late SharedPreferences prefs;

  late Box kickCounterBox;

  var dateForDialog = "".obs;
  var weekCalculatedByDialog = 0.obs;

  var currentWeek = 0.0.obs;
  var weightGain = 0.0.obs;
  var weightDifference = 0.0.obs;
  var weightForCircularBar = 0.0.obs;
  var kickCounterList = [].obs;

  var kickCountForCircularBar = 0.0.obs;
  var footClickCounter = 0.0.obs;
  var firstTime = "".obs;
  var lastTime = "".obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    kickCounterBox = await Hive.openBox(Constants.KICK_COUNTER);
    //kickCounterBox.clear();
    DateFormat format = new DateFormat('MMM dd,yyyy');
    periodStartDate =
        format.parse(prefs.getString(Constants.PERIOD_START_DATE)!);

    currentWeek.value = prefs.getDouble(Constants.CURRENT_WEEK)!;
    getSavedData();
  }

  void saveSharedPrefData() async {
    await prefs.setDouble(Constants.KICK, footClickCounter.value);
    await prefs.setString(Constants.FIRST_TIME, firstTime.value);
    await prefs.setString(Constants.LAST_TIME, lastTime.value);
  }

  void addDataToDB() async {
    String formatter = DateFormat('MMM dd').format(new DateTime.now());

    var format = DateFormat("HH:mm");
    var one = format.parse(firstTime.value);
    var two = format.parse(lastTime.value);

    kickCounterBox.put(kickCounterBox.length, {
      'date': formatter.toString(),
      'start': firstTime.value,
      'duration': two
          .difference(one)
          .toString()
          .substring(0, two.difference(one).toString().lastIndexOf(":")),
      'kicks': footClickCounter.value
          .toString()
          .substring(0, footClickCounter.value.toString().lastIndexOf(".")),
    });
    print('data changes');
    getSavedData();
  }

  void getSavedData() async {
    kickCounterList.clear();
    if (kickCounterBox.length > 0) {
      for (int i = 0; i < kickCounterBox.length; i++) {
        kickCounterList.add(kickCounterBox.getAt(i));
      }
    }
  }
}
