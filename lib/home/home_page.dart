import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/calaneder/calander_page.dart';
import 'package:pregnacyv1/home/home_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/splash/splash_page.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/utils/horizontal_week_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pregnacyv1/home/home_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';

class HomePage extends StatelessWidget {
  HomeController _controller = Get.put(HomeController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime todaysDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        bottomNavigationBar: menu(_controller),
        /*Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (_controller.currentWeek.value < 41) {
                      _controller.currentWeek.value =
                          _controller.currentWeek.value - 1.0;

                      print(_controller.currentWeek.value);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  flex: 9,
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            'CURRENT WEEK',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Slider(
                            min: 0.0,
                            max: 40.0,
                            divisions: 40,
                            value: _controller.currentWeek.value,
                            activeColor: Colors.green,
                            thumbColor: Colors.green,
                            inactiveColor: Colors.orange,
                            onChanged: (val) {
                              //_controller.currentWeek.value = val;
                              print(val);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _controller.currentWeek.value =
                          _controller.currentWeek.value - 1.0;

                      print(_controller.currentWeek.value);
                    },
                    child: Text(
                      _controller.currentWeek.value.toString().substring(
                          0,
                          _controller.currentWeek.value
                              .toString()
                              .indexOf('.')),
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (_controller.currentWeek.value < 41) {
                      _controller.currentWeek.value =
                          _controller.currentWeek.value + 1.0;

                      print(_controller.currentWeek.value);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),*/
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "HELLO SAMANTHA",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
          /*title: Obx(
            () => _controller.currentWeek.value == 0.0
                ? const Text(
                    "You're - week pregnant",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                : Text(
                    "You're ${_controller.currentWeekAppBarValue} week pregnant",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
          ),*/
          shadowColor: Colors.black,
          surfaceTintColor: Color(ColorConstants.DARK_PINK_COLOR),
          foregroundColor: Color(ColorConstants.DARK_PINK_COLOR),
          backgroundColor: Color(ColorConstants.DARK_PINK_COLOR),
          toolbarHeight: 195,
          elevation: 0,
          leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
              child: InkWell(
                onTap: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: Image.asset('icons/hamburger.png',
                      width: 5, height: 5, fit: BoxFit.scaleDown),
                ),
              )),
          /*bottom:  const TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'HOME',
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
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'MOM',
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
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'BABY',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),*/

          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                color: const Color(ColorConstants.APP_SPLASH_COLOR),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 3, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              "Week ${_controller.currentWeek.value.toString().substring(0, _controller.currentWeek.value.toString().indexOf("."))}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0),
                            ),
                          ),
                          /*Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  carouselController.nextPage();
                                  if (_controller.currentWeek.value < 41) {
                                    _controller.currentWeek.value =
                                        _controller.currentWeek.value - 1.0;

                                    print(_controller.currentWeek.value);

                                    if (_controller.currentWeek.value > 7) {
                                      _controller.initialDay.value =
                                          _controller.initialDay.value - 7;
                                    }
                                  }
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _controller.changeListData();
                                  carouselController.previousPage();
                                  _controller.loading.value = true;
                                  if (_controller.currentWeek.value < 41) {
                                    _controller.currentWeek.value =
                                        _controller.currentWeek.value + 1.0;

                                    print(_controller.currentWeek.value);
                                  }
                                  if (_controller.currentWeek.value < 35) {
                                    _controller.initialDay.value =
                                        _controller.initialDay.value + 7;
                                  }
                                  _controller.loading.value = false;
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(
                        () => _controller.loading.value
                            ? const SizedBox(
                                height: 20,
                              )
                            : HorizontalWeekCalendar(
                                weekStartFrom: WeekStartFrom.Monday,
                                activeBackgroundColor:
                                    const Color(ColorConstants.DARK_PINK_COLOR),
                                activeTextColor: Colors.white,
                                inactiveBackgroundColor: Colors.white,
                                inactiveTextColor: Colors.black,
                                disabledTextColor: Colors.grey,
                                disabledBackgroundColor:
                                    Colors.grey.withOpacity(.3),
                                activeNavigatorColor: Colors.deepPurple,
                                inactiveNavigatorColor: Colors.grey,
                                monthColor: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(5),
                                showNavigationButtons: true,
                                monthFormat: "MMMM yyyy",
                                minDate: DateTime(2024, 04, 11),
                                maxDate: DateTime(2030, 01, 16),

                                initialDate: DateTime(
                                    _controller.initialYear.value,
                                    _controller.initialMonth.value,
                                    _controller.initialDay.value),
                                //initialDate: DateTime(2024, 5, 31),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor:
                                Color(ColorConstants.APP_SPLASH_COLOR),
                            labelColor: Color(ColorConstants.DARK_PINK_COLOR),
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              TabItem(title: 'Home', iconn: Icons.home),
                              TabItem(title: 'Mom', iconn: Icons.star),
                              TabItem(title: 'Baby', iconn: Icons.favorite),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        body: Obx(
          () => _controller.loading.value
              ? const Center(
                  child: Text("Loading.."),
                )
              : TabBarView(
                  children: <Widget>[Tab1(), Tab2(), Tab3()],
                ),
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
                        onTap: () async {
                          if (_controller.prefs
                                  .getDouble(Constants.START_WEIGHT_DATA) ==
                              0.0) {
                            Get.toNamed(Routes.weight.path);
                          } else {
                            Get.toNamed(Routes.wtracker.path);
                          }
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
  Tab1({super.key});

  final List<String> items = List<String>.generate(1000, (i) => "Item $i");
  HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
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
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          _controller.dailyUpdateData
                              .getAt(_controller.currentWeek.value.toInt())[1],
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Obx(
                          () => Text(
                            "${_controller.currentWeek.value.toString().substring(0, _controller.currentWeek.value.toString().indexOf("."))} WEEKS PREGNANT",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                          child: Text(
                            'Your baby is as big as lime',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top: 20, bottom: 30),
                        child: Text(
                          'Baby dimension',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Length',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '5-6 cm',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '14 g',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Trimester',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '1/3',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Image.asset(
                              'icons/baby.png',
                              height: 55,
                              width: 55,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top: 0),
                                  child: Text(
                                    'DUE DATE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => Text(
                                  _controller.dueDate.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      height: 1.1,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 6),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                          child: Text(
                            'YOU MAY FEEL',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Container(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                          ),
                          itemCount: _controller.symptomsStrings.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color:
                                        Color(ColorConstants.APP_SPLASH_COLOR),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    _controller.symptomsStrings[index]
                                        .toString()
                                        .substring(
                                            _controller.symptomsStrings[index]
                                                    .toString()
                                                    .indexOf("+") +
                                                1,
                                            _controller.symptomsStrings[index]
                                                .toString()
                                                .length),
                                  ),
                                ),
                                Text(
                                  _controller.symptomsStrings[index]
                                      .toString()
                                      .substring(
                                          0,
                                          _controller.symptomsStrings[index]
                                              .toString()
                                              .indexOf("+")),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(ColorConstants.DARK_PINK_COLOR),
                  border: Border.all(width: 0, color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                          child: Text(
                            'WEEKLY UPDATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0),
                            child: Text(
                              _controller.dailyUpdateData.getAt(
                                  _controller.currentWeek.value.toInt())[0],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                  fontSize: 15.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                          child: Text(
                            'Pregnancy Tool',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (_controller.prefs
                                    .getDouble(Constants.START_WEIGHT_DATA) ==
                                    null) {
                                  Get.toNamed(Routes.weight.path);
                                } else {
                                  Get.toNamed(Routes.wtracker.path);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/weightnew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'WEIGHT\nTRACKER',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.kegaltracker.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/kegalnew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'KEGAL\nEXCERCISES',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.kickcounter.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/kickcounternew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'KICK\nCOUNTER',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.contraction.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/contractionnew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'CONTRACTION\nCOUNTERS',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.calander.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/calandernew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'CALANDER\nAND NOTES',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.pitem.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/pregitemnew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'PREGNANCY\nITEMS',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.pitem.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/medicinenew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'MEDICINE AND\nVACCINATION',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.mealplan.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/mealnew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'MEAL\nPLAN',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.bump.path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0, color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                          'icons/gallerynew.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'BUMP\nGALLERY',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
  Tab2({super.key});

  HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        /* child: Image.asset(
                          'icons/pregnancy1.png',
                          height: 200,
                          width: double.infinity,
                        ),*/
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Html(
                              data: _controller.momData.getAt(
                                  _controller.currentWeek.value.toInt())[0]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  Tab3({super.key});

  HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        /*child: Image.asset(
                          'icons/home2.png',
                          height: 200,
                          width: double.infinity,
                        ),*/
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Html(
                              data: _controller.babyData.getAt(
                                  _controller.currentWeek.value.toInt())[0]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final IconData iconn;

  const TabItem({
    super.key,
    required this.title,
    required this.iconn,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              /*SizedBox(
                width: 20,
                height: 20,
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),*/
              Icon(
                iconn,
                size: 17,
              ),
              SizedBox(width: 5),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          /*count > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      count > 9 ? "9+" : count.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 0, height: 0),*/
        ],
      ),
    );
  }
}

Widget menu(HomeController controller) {
  return Container(
    height: 70,
    color: Colors.white,
    child: TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'icons/homebt.png',
                    height: 25,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'HOME',
                  style: TextStyle(
                    color: Color(ColorConstants.DARK_PINK_COLOR),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          //icon: Icon(Icons.euro_symbol),
        ),
        Tab(
          child: InkWell(
            onTap: () {
              print('hello');
              Get.toNamed(Routes.calander.path);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'icons/calanderbt.png',
                    height: 25,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'CALANDER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          //icon: Icon(Icons.euro_symbol),
        ),
        Tab(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.timeline.path);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'icons/timerbt.png',
                    height: 25,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'TIMELINE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          //icon: Icon(Icons.euro_symbol),
        ),
        Tab(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.profile.path);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'icons/profilebt.png',
                    height: 25,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'PROFILE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          //icon: Icon(Icons.euro_symbol),
        ),
        /*Tab(
          text: "Options",
          icon: Icon(Icons.settings),
        ),*/
      ],
    ),
  );
}

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from Monday or Sunday
  ///
  /// default value is
  /// ```dart
  /// [WeekStartFrom.Monday]
  /// ```
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  ///
  /// ```dart
  /// onDateChange: (DateTime date){
  ///    print(date);
  /// }
  /// ```
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  ///
  /// ```dart
  /// onWeekChange: (List<DateTime> list){
  ///    print("First date: ${list.first}");
  ///    print("Last date: ${list.last}");
  /// }
  /// ```
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor
  /// ```
  final Color? activeBackgroundColor;

  /// In-Active background color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor.withOpacity(.2)
  /// ```
  final Color? inactiveBackgroundColor;

  /// Disable background color
  ///
  /// Default value is
  /// ```dart
  /// Colors.grey
  /// ```
  final Color? disabledBackgroundColor;

  /// Active text color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor
  /// ```
  final Color? activeTextColor;

  /// In-Active text color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor.withOpacity(.2)
  /// ```
  final Color? inactiveTextColor;

  /// Disable text color
  ///
  /// Default value is
  /// ```dart
  /// Colors.grey
  /// ```
  final Color? disabledTextColor;

  /// Active Navigator color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor
  /// ```
  final Color? activeNavigatorColor;

  /// In-Active Navigator color
  ///
  /// Default value is
  /// ```dart
  /// Colors.grey
  /// ```
  final Color? inactiveNavigatorColor;

  /// Month Color
  ///
  /// Default value is
  /// ```dart
  /// Theme.of(context).primaryColor.withOpacity(.2)
  /// ```
  final Color? monthColor;

  /// border radius of date card
  ///
  /// Default value is `null`
  final BorderRadiusGeometry? borderRadius;

  /// scroll physics
  ///
  /// Default value is
  /// ```
  /// scrollPhysics: const ClampingScrollPhysics(),
  /// ```
  final ScrollPhysics? scrollPhysics;

  /// showNavigationButtons
  ///
  /// Default value is `true`
  final bool? showNavigationButtons;

  /// monthFormat
  ///
  /// If it's current year then
  /// Default value will be ```MMMM```
  ///
  /// Otherwise
  /// Default value will be `MMMM yyyy`
  final String? monthFormat;

  final DateTime? minDate;

  final DateTime? maxDate;

  final DateTime? initialDate;

  HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
    this.borderRadius,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.showNavigationButtons = true,
    this.monthFormat,
    this.minDate,
    this.maxDate,
    this.initialDate,
  })  : assert(minDate != null && maxDate != null),
        assert(minDate!.isBefore(maxDate!)),
        assert(minDate!.isBefore(initialDate ?? DateTime.now()) &&
            (initialDate ?? DateTime.now()).isBefore(maxDate!)),
        super();

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();
  HomeController _controller = Get.put(HomeController());
  final int _initialPage = 1;

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initCalender();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalender() {
    final date = widget.initialDate ?? today;
    selectedDate = widget.initialDate ?? today;

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);

    _getMorePreviousWeeks();

    _getMoreNextWeeks();
  }

  _getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks[currentWeekIndex].first;

    bool canAdd = false;
    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
      if (widget.minDate != null) {
        if (minusDate.add(const Duration(days: 1)).isAfter(widget.minDate!)) {
          canAdd = true;
        }
      } else {
        canAdd = true;
      }
    }
    if (canAdd == true) {
      listOfWeeks.add(minus7Days.reversed.toList());
    }
    setState(() {});
  }

  _getMoreNextWeeks() {
    List<DateTime> plus7Days = [];
    // DateTime startFrom = currentWeek.last;
    DateTime startFrom = listOfWeeks[currentWeekIndex].last;

    // bool canAdd = false;
    // int newCurrentWeekIndex = 1;
    for (int index = 0; index < 7; index++) {
      DateTime addDate = startFrom.add(Duration(days: (index + 1)));
      plus7Days.add(addDate);
      // if (widget.maxDate != null) {
      //   if (addDate.isBefore(widget.maxDate!)) {
      //     canAdd = true;
      //     newCurrentWeekIndex = 1;
      //   } else {
      //     newCurrentWeekIndex = 0;
      //   }
      // } else {
      //   canAdd = true;
      //   newCurrentWeekIndex = 1;
      // }
    }
    // print("canAdd: $canAdd");
    // print("newCurrentWeekIndex: $newCurrentWeekIndex");

    // if (canAdd == true) {
    listOfWeeks.insert(0, plus7Days);
    // }
    currentWeekIndex = 1;
    setState(() {});
  }

  _onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
    print(date);
  }

  _onResetClick() async {
    setState(() {
      selectedDate = DateTime.now();
    });

    if (_controller.nextPreviousCount.value > 0) {
      for (int i = 0; i < _controller.nextPreviousCount.value; i++) {
        await carouselController.nextPage();
      }
    } else {
      for (int i = 0; i < _controller.nextPreviousCount.value.abs(); i++) {
        await carouselController.previousPage();
      }
    }

    _controller.currentWeek.value = 9.0;
    _controller.nextPreviousCount.value = 0;
  }

  _onBackClick() async {
    if (_controller.currentWeek.value > 1) {
      _controller.nextPreviousCount.value =
          _controller.nextPreviousCount.value - 1;

      _controller.currentWeek.value = _controller.currentWeek.value - 1.0;

      _controller.changeListData();
      print(_controller.currentWeek.value);

      if (_controller.currentWeek.value > 7) {
        _controller.initialDay.value = _controller.initialDay.value - 7;
      }

      await _onDateSelect(selectedDate.subtract(Duration(days: 7)));
      await carouselController.nextPage();
      //carouselController.animateToPage(4);
    }
  }

  _onNextClick() async {
    _controller.nextPreviousCount.value =
        _controller.nextPreviousCount.value + 1;

    if (_controller.currentWeek.value < 42) {
      _controller.currentWeek.value = _controller.currentWeek.value + 1.0;

      print(_controller.currentWeek.value);
    }
    if (_controller.currentWeek.value < 35) {
      _controller.initialDay.value = _controller.initialDay.value + 7;
    }
    _controller.changeListData();
    await _onDateSelect(selectedDate.add(Duration(days: 7)));
    await carouselController.previousPage();
  }

  onWeekChange(index) {
    if (currentWeekIndex < index) {
      // on back
    }
    if (currentWeekIndex > index) {
      // on next
    }

    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      _getMorePreviousWeeks();
    }

    if (index == 0) {
      _getMoreNextWeeks();
      carouselController.nextPage();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  // =================

  bool _isReachMinimum(DateTime dateTime) {
    return widget.minDate?.add(const Duration(days: -1)).isBefore(dateTime) ??
        false;
  }

  bool _isReachMaximum(DateTime dateTime) {
    return widget.maxDate?.add(const Duration(days: 1)).isAfter(dateTime) ??
        false;
  }

  bool _isNextDisabled() {
    DateTime lastDate = listOfWeeks[currentWeekIndex].last;
    if (widget.maxDate != null) {
      String lastDateFormatted = DateFormat('yyyy/MM/dd').format(lastDate);
      String maxDateFormatted =
          DateFormat('yyyy/MM/dd').format(widget.maxDate!);
      if (lastDateFormatted == maxDateFormatted) return true;
    }

    bool isAfter =
        widget.maxDate == null ? false : lastDate.isAfter(widget.maxDate!);

    return isAfter;
    // return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  bool isBackDisabled() {
    DateTime firstDate = listOfWeeks[currentWeekIndex].first;
    if (widget.minDate != null) {
      String firstDateFormatted = DateFormat('yyyy/MM/dd').format(firstDate);
      String minDateFormatted =
          DateFormat('yyyy/MM/dd').format(widget.minDate!);
      if (firstDateFormatted == minDateFormatted) return true;
    }

    bool isBefore =
        widget.minDate == null ? false : firstDate.isBefore(widget.minDate!);

    return isBefore;
    // return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek.first) ==
        DateFormat('yyyy').format(today);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var withOfScreen = MediaQuery.of(context).size.width;

    // double boxHeight = withOfScreen / 7;

    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        _onResetClick();
                      },
                      child: Image.asset(
                        'icons/refresh.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.showNavigationButtons == true
                      ? GestureDetector(
                          onTap: isBackDisabled()
                              ? null
                              : () {
                                  _onBackClick();
                                },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                size: 13,
                                color: isBackDisabled()
                                    ? (widget.inactiveNavigatorColor ??
                                        Colors.grey)
                                    : Colors.black,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Back",
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: isBackDisabled()
                                      ? (widget.inactiveNavigatorColor ??
                                          Colors.grey)
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Text(
                    widget.monthFormat?.isEmpty ?? true
                        ? (isCurrentYear()
                            ? DateFormat('MMMM').format(
                                currentWeek.first,
                              )
                            : DateFormat('MMMM yyyy').format(
                                currentWeek.first,
                              ))
                        : DateFormat(widget.monthFormat).format(
                            currentWeek.first,
                          ),
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.monthColor ?? theme.primaryColor,
                    ),
                  ),
                  widget.showNavigationButtons == true
                      ? GestureDetector(
                          onTap: _isNextDisabled()
                              ? null
                              : () {
                                  _onNextClick();
                                },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: _isNextDisabled()
                                      ? (widget.inactiveNavigatorColor ??
                                          Colors.grey)
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                                color: _isNextDisabled()
                                    ? (widget.inactiveNavigatorColor ??
                                        Colors.grey)
                                    : Colors.black,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  if (listOfWeeks.isNotEmpty)
                    for (int ind = 0; ind < listOfWeeks.length; ind++)
                      SizedBox(
                        // height: boxHeight,

                        //width: double.infinity,
                        // color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int weekIndex = 0;
                                weekIndex < listOfWeeks[ind].length;
                                weekIndex++)
                              Builder(builder: (_) {
                                DateTime currentDate =
                                    listOfWeeks[ind][weekIndex];
                                return Expanded(
                                  child: GestureDetector(
                                    // onTap: () {
                                    //   _onDateSelect(currentDate);
                                    // },
                                    // TODO: disabled
                                    onTap: _isReachMaximum(currentDate) &&
                                            _isReachMinimum(currentDate)
                                        ? () {
                                            _onDateSelect(
                                              listOfWeeks[ind][weekIndex],
                                            );
                                          }
                                        : null,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: widget.borderRadius,
                                        // color: DateFormat('dd-MM-yyyy').format(
                                        //             listOfWeeks[ind]
                                        //                 [weekIndex]) ==
                                        //         DateFormat('dd-MM-yyyy')
                                        //             .format(selectedDate)
                                        //     ? widget.activeBackgroundColor ??
                                        //         theme.primaryColor
                                        //     : widget.inactiveBackgroundColor ??
                                        //         theme.primaryColor
                                        //             .withOpacity(.2),
                                        // TODO: disabled
                                        color: DateFormat('dd-MM-yyyy')
                                                    .format(currentDate) ==
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate)
                                            ? widget.activeBackgroundColor ??
                                                theme.primaryColor
                                            : _isReachMaximum(currentDate) &&
                                                    _isReachMinimum(currentDate)
                                                ? widget.inactiveBackgroundColor ??
                                                    theme.primaryColor
                                                        .withOpacity(.2)
                                                : widget.disabledBackgroundColor ??
                                                    Colors.grey,
                                        border: Border.all(
                                          color: const Color(
                                              ColorConstants.APP_SPLASH_COLOR),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat(
                                              'EEE',
                                            ).format(
                                              listOfWeeks[ind][weekIndex],
                                            ),
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                              // color: DateFormat('dd-MM-yyyy')
                                              //             .format(listOfWeeks[
                                              //                     ind]
                                              //                 [weekIndex]) ==
                                              //         DateFormat('dd-MM-yyyy')
                                              //             .format(selectedDate)
                                              //     ? widget.activeTextColor ??
                                              //         Colors.white
                                              //     : widget.inactiveTextColor ??
                                              //         Colors.white
                                              //             .withOpacity(.2),
                                              // TODO: disabled
                                              color: DateFormat('dd-MM-yyyy')
                                                          .format(
                                                              currentDate) ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(selectedDate)
                                                  ? widget.activeTextColor ??
                                                      Colors.white
                                                  : _isReachMaximum(
                                                              currentDate) &&
                                                          _isReachMinimum(
                                                              currentDate)
                                                      ? widget.inactiveTextColor ??
                                                          Colors.white
                                                              .withOpacity(.2)
                                                      : widget.disabledTextColor ??
                                                          Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Text(
                                            // "$weekIndex: ${listOfWeeks[ind][weekIndex] == DateTime.now()}",
                                            "${currentDate.day}",
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.titleSmall!
                                                .copyWith(
                                              // color: DateFormat('dd-MM-yyyy')
                                              //             .format(listOfWeeks[
                                              //                     ind]
                                              //                 [weekIndex]) ==
                                              //         DateFormat('dd-MM-yyyy')
                                              //             .format(selectedDate)
                                              //     ? widget.activeTextColor ??
                                              //         Colors.white
                                              //     : widget.inactiveTextColor ??
                                              //         Colors.white
                                              //             .withOpacity(.2),
                                              // TODO: disabled
                                              color: DateFormat('dd-MM-yyyy')
                                                          .format(
                                                              currentDate) ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(selectedDate)
                                                  ? widget.activeTextColor ??
                                                      Colors.white
                                                  : _isReachMaximum(
                                                              currentDate) &&
                                                          _isReachMinimum(
                                                              currentDate)
                                                      ? widget.inactiveTextColor ??
                                                          Colors.white
                                                              .withOpacity(.2)
                                                      : widget.disabledTextColor ??
                                                          Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          ],
                        ),
                      ),
                ],
                options: CarouselOptions(
                  initialPage: _initialPage,
                  scrollPhysics:
                      widget.scrollPhysics ?? const ClampingScrollPhysics(),
                  height: 55,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    onWeekChange(index);
                  },
                ),
              ),
            ],
          );
  }
}

/*
const TabBar(
indicatorSize: TabBarIndicatorSize.tab,
dividerColor: Colors.black45,
indicator: BoxDecoration(
color: Colors.green,
borderRadius: BorderRadius.all(Radius.circular(10)),
),
labelColor: Colors.white,
unselectedLabelColor: Colors.black54,
tabs: [
TabItem(title: 'Home', iconn: Icons.home),
TabItem(title: 'Mom', iconn: Icons.star),
TabItem(title: 'Baby', iconn: Icons.favorite),
],
),*/
class HomeScreen23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}
