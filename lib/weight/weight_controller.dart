import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class WeightController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  var check1 = true.obs;
  var check2 = true.obs;
  var check3 = true.obs;
  var weightInKgs = 60.0.obs;
  var heightInMeter = 5.06.obs;
  var weightAddedByPatientList = <FlSpot>[].obs;
  late SharedPreferences prefs;

  //weight tracker parameters
  var patientStartWeight = 0.0.obs;
  var patientCurrentWeight = 0.0.obs;
  var patientExpWeight = 0.0.obs;

  var patientHeight = 0.0.obs;
  late Box weightBox;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    patientStartWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientCurrentWeight.value = prefs.getDouble(Constants.START_WEIGHT_DATA)!;
    patientExpWeight.value = prefs.getDouble(Constants.EXP_WEIGHT_DATA)!;

    weightAddedByPatientList.add(FlSpot(0, 60));
    weightAddedByPatientList.add(FlSpot(12, 69));
    weightAddedByPatientList.add(FlSpot(28, 70));
  }

  void getSavedData(int data) async {
    print(weightBox.length);
    print(weightBox.length);

    weightBox
        .put(weightBox.length, {'date': "Sep 26", 'week': 1.0, 'weight': 67, 'change': 2.0});
  }

  @override
  void onReady() async {
    super.onReady();
  }
}

class WeightParamter1 {
  String date;
  double week;
  double weight;
  double change;

  WeightParamter1({
    required this.date,
    required this.week,
    required this.weight,
    required this.change,
  });
}
