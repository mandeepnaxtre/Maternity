import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pregnacyv1/kegal/kegaltracker_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/weight/weight_controller.dart';
import 'package:pregnacyv1/weight/wtracker_controller.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';

class KegalTracker extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(KegalTrackerController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
          tooltip: 'Increment',
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Kegal excerises',
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
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.pets_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'EXCERCISE',
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
                      Icons.line_axis_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'STATISTICS',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[Tab1(), Tab2()],
        ),
        drawer: Drawer(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.weight.path);
                        },
                        child: const Text(
                          'Weight Tracker',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.no_meals,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.mealplan.path);
                          },
                          child: const Text(
                            'Meal Plan',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level 1, Day 1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.klevel.path);
                          },
                          child: Text(
                            "Edit",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'icons/kegal1.png',
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Classic Kegel:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0),
                    ),
                    const Text(
                      '3s x 3s, 11 repeats',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Pulses Kegel:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0),
                    ),
                    const Text(
                      'quick pulse 10s,10s,10s',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 10),
                      child: InkWell(
                        onTap: () async {
                          Get.toNamed(Routes.kegal.path);
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: const Color(ColorConstants.DARK_PINK_COLOR),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Start Training',
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
            ),
            SizedBox(
              height: 2,
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

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0, color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lifetime Duration',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0),
                      ),
                      Text(
                        "0s",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 28.0),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Training days',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0),
                      ),
                      Text(
                        "0s",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 28.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Container(
              height: 300,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0, color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TRAINING BY DAYS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "no data for the last 14 days",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
