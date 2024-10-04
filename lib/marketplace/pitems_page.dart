import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pregnacyv1/kegal/kegaltracker_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/marketplace/pitems_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/weight/weight_controller.dart';
import 'package:pregnacyv1/weight/wtracker_controller.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class PregnancyItem extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(PregnancyItemController());

  _launchURL(String URL) async {
    final Uri url = Uri.parse(URL);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pregnancy Items',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        shadowColor: Colors.black,
        surfaceTintColor: Color(ColorConstants.DARK_PINK_COLOR),
        foregroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        backgroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        toolbarHeight: 50,
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(ColorConstants.APP_SPLASH_COLOR),
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
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                            child: Text(
                              'Welcome Box',
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
                            const Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi et ornare nisl.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1,
                                    fontSize: 14.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Image.asset(
                                'icons/gift1.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "First Trimester",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return InkWell(
                          onTap: () async{
                            _launchURL(_controller.al_firstTrimester[position]['link'].toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 0),
                            child: Card(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () async{
                                    _launchURL(_controller.al_firstTrimester[position]['link'].toString());
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 160,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            _controller
                                                .al_firstTrimester[position]
                                            ['image']
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Text(
                                          _controller
                                              .al_firstTrimester[position]
                                          ['name']
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    itemCount: _controller.al_firstTrimester.length,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Second Trimester",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 0, top: 0),
                          child: Card(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                            ),
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _launchURL(_controller.al_secondTrimester[position]['link'].toString());

                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 160,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          _controller
                                              .al_secondTrimester[position]
                                          ['image']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        _controller.al_secondTrimester[position]
                                        ['name']
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                    itemCount: _controller.al_secondTrimester.length,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Third Trimester",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 0, top: 0),
                          child: Card(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                            ),
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _launchURL(_controller.al_thirdTrimester[position]['link'].toString());
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 160,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          _controller
                                              .al_thirdTrimester[position]
                                          ['image']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        _controller.al_thirdTrimester[position]
                                        ['name']
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                    itemCount: _controller.al_thirdTrimester.length,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "After Delivery",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 0, top: 0),
                          child: Card(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                            ),
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _launchURL(_controller.al_afterPregnancy[position]['link'].toString());
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 160,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          _controller
                                              .al_afterPregnancy[position]
                                          ['image']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        _controller.al_afterPregnancy[position]
                                        ['name']
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                    itemCount: _controller.al_afterPregnancy.length,
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