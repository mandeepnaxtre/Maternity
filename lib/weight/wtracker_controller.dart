import 'dart:async';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class WeightTrackerController extends GetxController {
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

  late Box weightBox;

  var dateForDialog = "".obs;
  var weekCalculatedByDialog = 0.obs;

  var currentWeek = 0.0.obs;
  var weightGain = 0.0.obs;
  var weightDifference = 0.0.obs;
  var weightForCircularBar = 0.0.obs;
  var changeInWeightList = [].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    weightBox = await Hive.openBox(Constants.WEIGHT_DATA);
    //weightBox.clear();

    prefs = await SharedPreferences.getInstance();
    patientStartWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientCurrentWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientExpWeight.value = prefs.getDouble(Constants.EXP_WEIGHT_DATA)!;
    patientHeight.value = prefs.getDouble(Constants.HEIGHT)!;

    weightDifference.value = patientExpWeight.value - patientStartWeight.value;

    DateFormat format = new DateFormat('MMM dd,yyyy');
    periodStartDate =
        format.parse(prefs.getString(Constants.PERIOD_START_DATE)!);

    currentWeek.value = prefs.getDouble(Constants.CURRENT_WEEK)!;
    getSavedData();
  }

  void addDataToDB(int val) async {
    String formatter = DateFormat('MMM dd').format(new DateTime.now());
    print(formatter);

    double diff = 0.0;
    if (weightBox.length > 0) {
      diff = weightInKgs.value - weightBox.getAt(weightBox.length - 1)['weight'];
    } else {
      diff =
          weightInKgs.value - double.parse(patientStartWeight.value.toString());
    }

    weightBox.put(weightBox.length, {
      'date': formatter.toString(),
      'week': currentWeek.value,
      'weight': weightInKgs.value,
      'change': diff.toPrecision(2)
    });

    //weightBox.add(val);

    /*weightBox.put(val,
      WeightParamter(
          date: formatter.toString(),
          week: currentWeek.value,
          weight: weightInKgs.value,
          change: diff.toPrecision(2))
    );*/

    print('data changes');
    getSavedData();
    //if (weightAddedByPatientList.isNotEmpty) {
    //for (int i = 0; i < weightAddedByPatientList.length; i++) {
    /*weightAddedByPatientList.add(FlSpot(
        double.parse(weekCalculatedByDialog.value.toString()),
        weightInKgs.value));*/
    //}
    //}

    //print("hello");
  }

  void getSavedData() async {
    changeInWeightList.clear();
    if (weightBox.length > 0) {
      for (int i = 0; i < weightBox.length; i++) {
        //weightAddedByPatientList.add(FlSpot(weightBox.getAt(i)[0], weightBox.getAt(i)[1]));

        changeInWeightList.add(weightBox.getAt(i));
      }
      weightGain.value =
          changeInWeightList[changeInWeightList.length - 1]['change'];

      patientCurrentWeight.value =
          changeInWeightList[changeInWeightList.length - 1]['weight'];
    }
    weightForCircularBar.value =
        (patientCurrentWeight.value - patientStartWeight.value) /
            weightDifference.value;
  }
}

class WeightParamter {
  String date;
  double week;
  double weight;
  double change;

  WeightParamter({
    required this.date,
    required this.week,
    required this.weight,
    required this.change,
  });
}
