import 'dart:async';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class KegalTrackerController extends GetxController {
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

  var changeInWeightList = [].obs;

  @override
  void onInit() async {
    super.onInit();

    weightBox = await Hive.openBox(Constants.WEIGHT_DATA);
    prefs = await SharedPreferences.getInstance();

    patientStartWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientCurrentWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientExpWeight.value = prefs.getDouble(Constants.EXP_WEIGHT_DATA)!;
    patientHeight.value = prefs.getDouble(Constants.HEIGHT)!;

    DateFormat format = new DateFormat('MMM dd,yyyy');
    periodStartDate =
        format.parse(prefs.getString(Constants.PERIOD_START_DATE)!);

    if (weightBox.length > 0) {
      for (int i = 0; i < weightBox.length; i++) {
        weightAddedByPatientList
            .add(FlSpot(weightBox.getAt(i)[0], weightBox.getAt(i)[1]));

        if (weightBox.keyAt(i) != "") {
          //String objText = '{"date": ${weightBox.keyAt(i).toString()}, "week": ${weightBox.getAt(i)[0]},"weight":  ${weightBox.getAt(i)[1]},"change":  ${weightBox.getAt(i)[2]}}';
          changeInWeightList.add(
              "${weightBox.keyAt(i)},${weightBox.getAt(i)[0]},${weightBox.getAt(i)[1]},${weightBox.getAt(i)[2]}");
        }
      }

      patientCurrentWeight.value = weightBox.getAt(weightBox.length - 1)[1];
    }
  }

  void addDataToDB(String date) {
    double diff = 0.0;
    if (weightBox.length > 0) {
      diff = weightInKgs.value - weightBox.getAt(weightBox.length - 1)[2];
    } else {
      diff =
          weightInKgs.value - double.parse(patientStartWeight.value.toString());
    }

    weightBox.put(date, [
      double.parse(weekCalculatedByDialog.value.toString()),
      weightInKgs.value,
      diff.toPrecision(2)
    ]);

    //if (weightAddedByPatientList.isNotEmpty) {
    //for (int i = 0; i < weightAddedByPatientList.length; i++) {
    weightAddedByPatientList.add(FlSpot(
        double.parse(weekCalculatedByDialog.value.toString()),
        weightInKgs.value));
    //}
    //}

    //print("hello");
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
