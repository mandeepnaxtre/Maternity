import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/weight/weight_controller.dart';
import 'package:pregnacyv1/weight/wtracker_controller.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class WeightTracker extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(WeightTrackerController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
          tooltip: 'Increment',
          onPressed: () {
            Get.dialog(WeightTrackerDialogWidget());
          },
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        key: scaffoldKey,
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
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              )),
          /*bottom: const TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'WEIGHT',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.menu_open,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'CHART',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),*/
        ),
        body: const TabBarView(
          children: <Widget>[Tab1(), Tab2()],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    final wController = Get.put(WeightTrackerController());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CURRENT WEIGHT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Obx(
                              () => Text(
                                "${wController.patientCurrentWeight.value} kg",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'EXP FINAL WEIGHT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Obx(
                              () => Text(
                                "${wController.patientExpWeight.value} kg",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(
                      () => Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${wController.patientCurrentWeight.value -
                                                wController
                                                    .patientStartWeight.value} KG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.0),
                                  ),
                                  Text(
                                    'GAIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: CircularProgressIndicator(
                              value: wController.weightForCircularBar.value,
                              backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                              strokeWidth: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'START WEIGHT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Obx(
                              () => Text(
                                "${wController.patientStartWeight.value} kg",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'HEIGHT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Obx(
                              () => Text(
                                "${wController.patientHeight.value} ft",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "DATE",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "WEEK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "WEIGHT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "CHANGE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Obx(
              () => Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                //height: 500,
                child: Flexible(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                wController.changeInWeightList[position]['date']
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.changeInWeightList[position]['week']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.changeInWeightList[position]
                                        ['weight']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.changeInWeightList[position]
                                        ['change']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: wController.changeInWeightList.length,
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

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeightTrackerController());
    List<BarChartRodStackItem> images = [
      BarChartRodStackItem(0, 2, Colors.amber),
      BarChartRodStackItem(2, 4, Colors.yellow)
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 20, top: 50, bottom: 10),
        child: SizedBox(
          height: 500,
          child: LineChart(
            LineChartData(
                minX: 0,
                maxX: 40,
                minY: 58,
                maxY: 76,
                betweenBarsData: [
                  BetweenBarsData(
                    fromIndex: 0,
                    toIndex: 1,
                    color: Colors.grey.shade300,
                  )
                ],
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true, interval: 4, reservedSize: 36
                        //getTitlesWidget: bottomTitleWidgets,
                        ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      //getTitlesWidget: leftTitleWidgets,
                      interval: 2,
                      reservedSize: 36,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      barWidth: 1,
                      color: Colors.grey.shade50,
                      spots: [
                        FlSpot(2, 60),
                        FlSpot(13, 62),
                        FlSpot(40, 75),
                      ]),
                  LineChartBarData(
                      barWidth: 1,
                      color: Colors.grey.shade50,
                      spots: [
                        FlSpot(2, 60),
                        FlSpot(13, 60.5),
                        FlSpot(40, 70),
                      ]),
                  LineChartBarData(
                      barWidth: 2,
                      color: Colors.green,
                      spots: controller.weightAddedByPatientList.value),
                ]),
          ),
        ),
      ),
    );
  }
}

class WeightTrackerDialogWidget extends StatelessWidget {
  final _controller1 = Get.put(WeightTrackerController());
  var initialDate = DateTime.now().subtract(const Duration(days: 7));
  var firstDate = DateTime.now().subtract(const Duration(days: 300));

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
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            _controller1.dateForDialog.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            _controller1.dateForDialog.value =
                                initialDate.toString();
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: initialDate,
                                firstDate: firstDate,
                                lastDate: initialDate);

                            if (pickedDate != null) {
                              final difference = (pickedDate
                                      .difference(_controller1.periodStartDate)
                                      .inDays) *
                                  0.142857;

                              _controller1.weekCalculatedByDialog.value =
                                  difference.toInt();

                              _controller1.dateForDialog.value =
                                  DateFormat('MMM dd,yyyy').format(pickedDate);
                            } else {}
                          },
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),*/
                    const Text(
                      "Add your weight:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    const SizedBox(height: 20),
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
                            /*_controller1.weightAddedByPatientList.add(
                                FlSpot(10, _controller1.weightInKgs.value));*/

                            _controller1.patientCurrentWeight.value =
                                _controller1.weightInKgs.value;

                            _controller1.addDataToDB(2);
                            Get.back();
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
