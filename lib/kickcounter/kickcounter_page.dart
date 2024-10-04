import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/home/home_controller.dart';
import 'package:pregnacyv1/kickcounter/kcounter_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/utils/app_color.dart';

class KickCounterPage extends StatelessWidget {
  final _controller = Get.put(KickCounterController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Kick Counter',
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
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'COUNTER',
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
                      'RECORDS',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
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
  Tab1({super.key});

  final _controller = Get.put(KickCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    'Click on Foot icon on first kick',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0),
                  )),
            ),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: InkWell(
                        onTap: () {
                          String formatter =
                              DateFormat('HH:mm').format(new DateTime.now());
                          print(formatter);
                          if (_controller.firstTime.value == "") {
                            _controller.firstTime.value =
                                DateFormat('HH:mm').format(new DateTime.now());
                          }
                          _controller.lastTime.value =
                              DateFormat('HH:mm').format(new DateTime.now());

                          _controller.footClickCounter.value =
                              _controller.footClickCounter.value + 1.0;
                          print("hello");

                          _controller.kickCountForCircularBar.value =
                              _controller.footClickCounter.value / 10;
                        },
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print("hello");
                                        print(
                                            _controller.footClickCounter.value);
                                      },
                                      child: Image.asset(
                                        'icons/footprint.png',
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => SizedBox(
                                height: 130,
                                width: 130,
                                child: CircularProgressIndicator(
                                  value:
                                      _controller.kickCountForCircularBar.value,
                                  backgroundColor:
                                      Color.fromRGBO(224, 224, 224, 1),
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.green),
                                  strokeWidth: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Kick',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      _controller.footClickCounter.value
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      'First',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      _controller.firstTime.value,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      'Last',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      _controller.lastTime.value,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 30, right: 30, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color:
                                        Color(ColorConstants.DARK_PINK_COLOR),
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Rounded corners
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(KickCounterDialogWidget(
                                        title: 'Reset session?',
                                      ));
                                    },
                                    child: Text(
                                      'RESET',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    color:
                                        Color(ColorConstants.DARK_PINK_COLOR),
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Rounded corners
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(KickCounterDialogWidget(
                                        title: 'Complete session?',
                                      ));
                                    },
                                    child: Text(
                                      'COMPLETE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
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

  final wController = Get.put(KickCounterController());

  @override
  Widget build(BuildContext context) {
    List<BarChartRodStackItem> images = [
      BarChartRodStackItem(0, 2, Colors.amber),
      BarChartRodStackItem(2, 4, Colors.yellow)
    ];

    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        body: Column(
          children: [
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
                        "Date",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Duration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Kicks",
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
                                wController.kickCounterList[position]['date']
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.kickCounterList[position]['start']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.kickCounterList[position]
                                        ['duration']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                wController.kickCounterList[position]['kicks']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: wController.kickCounterList.length,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget chartToRun() {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  // Example shows how to create ChartOptions instance
  //   which will request to start Y axis at data minimum.
  // Even though startYAxisAtDataMinRequested is set to true, this will not be granted on bar chart,
  //   as it does not make sense there.
  chartOptions = const ChartOptions(
    dataContainerOptions: DataContainerOptions(
      startYAxisAtDataMinRequested: true,
    ),
  );
  chartData = ChartData(
    dataRows: const [
      [20.0, 25.0, 30.0, 35.0, 40.0, 20.0],
      [35.0, 40.0, 20.0, 25.0, 30.0, 20.0],
    ],
    xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
    dataRowsLegends: const [
      'Off zero 1',
      'Off zero 2',
    ],
    chartOptions: chartOptions,
  );
  var verticalBarChartContainer = VerticalBarChartTopContainer(
    chartData: chartData,
    xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  );

  var verticalBarChart = VerticalBarChart(
    painter: VerticalBarChartPainter(
      verticalBarChartContainer: verticalBarChartContainer,
    ),
  );
  return verticalBarChart;
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
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
                      child: Image.asset(
                        'icons/home2.png',
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Text(
                            'What is happening in 4th week',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                          child: Text(
                            'In weeks 4 to 5 of early pregnancy, the embryo grows and develops'
                            ' within the lining of your womb. The outer cells reach out to '
                            'form links with your blood supply. The inner cells '
                            'form into 2, and then later into 3 layers. Each of these'
                            ' layers will grow to be different parts of your babys body: '
                            'the inner layer becomes the breathing and digestive systems, '
                            'including the lungs, stomach, gut and bladder the middle '
                            'layer becomes the heart, blood vessels, muscles and bones '
                            'the outer layer becomes the brain and nervous system,'
                            ' the eye lenses, tooth enamel, skin and nails In these early'
                            ' weeks of pregnancy, the embryo is attached to a tiny yolk '
                            'sac that provides nourishment. \n \nA few weeks later, '
                            'the placenta will be fully formed and take over the transfer '
                            'of nutrients to the embryo.'
                            ' \n \nA few weeks later, '
                            'the placenta will be fully formed and take over the transfer '
                            'of nutrients to the embryo.'
                            ' \n \nA few weeks later, '
                            'the placenta will be fully formed and take over the transfer '
                            'of nutrients to the embryo.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          )),
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

class KickCounterDialogWidget extends StatelessWidget {
  final _controller1 = Get.put(KickCounterController());

  final String title; // Define the data to be passed

  // Constructor to accept data
  KickCounterDialogWidget({required this.title});

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
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
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
                            Get.back();

                            if (title == "Complete session?") {

                              _controller1.addDataToDB();
                            }
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
