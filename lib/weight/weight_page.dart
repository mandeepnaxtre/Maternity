import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/weight/weight_controller.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class WeightPage extends StatelessWidget {
  final _controller = Get.put(WeightController());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weight Tracker',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        shadowColor: Colors.black,
        surfaceTintColor: const Color(ColorConstants.DARK_PINK_COLOR),
        foregroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
        backgroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
        toolbarHeight: 40,
        elevation: 5,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'icons/weight12.png',
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'No data\nAdd your weight and height',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                  )),
            ),
            InkWell(
              onTap: () async {
                //throw "Crash";
                Get.dialog(WeightDialogWidget());
                // var todaysDate =
                //     DateFormat('MMM dd,yyyy').format(DateTime.now());
                //
                // var box = await Hive.openBox(Constants.WEIGHT_DATA);
                // box.put(todaysDate, [6, 64.6, 2.7]);
                // print(box.length);
                //Get.toNamed(Routes.path);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topCenter,
                  color: const Color(ColorConstants.DARK_PINK_COLOR),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightDialogWidget extends StatelessWidget {
  final _controller1 = Get.put(WeightController());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weight before pregnancy:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => DecimalNumberPicker(
                            value: _controller1.weightInKgs.value,
                            minValue: 1,
                            maxValue: 100,
                            decimalPlaces: 1,
                            onChanged: (value) {
                              _controller1.weightInKgs.value = value;
                            },
                          ),
                        ),
                        const Text(
                          "kg",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.0),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                    const Text(
                      "Height:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => DecimalNumberPicker(
                            value: _controller1.heightInMeter.value,
                            minValue: 4,
                            maxValue: 7,
                            decimalPlaces: 2,
                            onChanged: (value) {
                              if (int.parse(value.toString().substring(
                                      value.toString().indexOf(".") + 1,
                                      value.toString().length)) >
                                  11) {
                                print("indesxxxxx");
                                _controller1.heightInMeter.value = double.parse("${value.toString().substring(0,value.toString().indexOf("."))}.11");
                              } else {
                                _controller1.heightInMeter.value = value;
                              }
                              print("indesx->" +
                                  value.toString().substring(
                                      value.toString().indexOf(".") + 1,
                                      value.toString().length));
                            },
                          ),
                        ),
                        const Text(
                          "ft",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    //Buttons
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        const SizedBox(width: 50),
                        InkWell(
                          child: const Text(
                            'OK',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
                          onTap: () async {
                            await _controller1.prefs.setDouble(
                                Constants.START_WEIGHT_DATA,
                                double.parse(
                                    _controller1.weightInKgs.value.toString()));

                            await _controller1.prefs.setDouble(
                                Constants.EXP_WEIGHT_DATA,
                                double.parse(
                                    (_controller1.weightInKgs.value + 13.6)
                                        .toString()));

                            await _controller1.prefs.setDouble(
                                Constants.HEIGHT,
                                double.parse(_controller1.heightInMeter.value
                                    .toString()));

                            Get.back();
                            //_controller1.getSavedData(4);
                            Get.toNamed(Routes.wtracker.path);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
