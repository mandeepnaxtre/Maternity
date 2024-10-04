import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class KegalController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  var check1 = true.obs;
  var check2 = true.obs;
  var check3 = true.obs;
  var weightInKgs = 60.0.obs;
  var heightInMeter = 1.60.obs;
  var weightAddedByPatientList = <FlSpot>[].obs;
  late SharedPreferences prefs;

  //weight tracker parameters
  var patientStartWeight = 0.0.obs;
  var patientCurrentWeight = 0.0.obs;
  var patientExpWeight = 0.0.obs;

  var patientHeight = 0.0.obs;

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

  @override
  void onReady() async {
    super.onReady();
  }
}
