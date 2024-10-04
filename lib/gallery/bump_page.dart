import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/calaneder/calander_controller.dart';
import 'package:pregnacyv1/gallery/bump_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class BumpPage extends StatelessWidget {
  final _controller = Get.put(BumpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorConstants.APP_SPLASH_COLOR),
      appBar: AppBar(
        title: const Text(
          'Bump Gallery',
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
      ),
      body: Obx(
        () => _controller.loading.value
            ? const Center(
                child: Text("Loading.."),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: _controller.bumpGallery.length,
                itemBuilder: (context, index) {
                  return _controller.bumpGallery.getAt(index)[0] ==
                          "No data available"
                      ? InkWell(
                          onTap: () async {
                            _controller.onImageButtonPressed(index);
                          },
                          child: Expanded(
                              child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(2.0),
                            //padding: const EdgeInsets.all(3.0),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Image.asset(
                                  'icons/round_plus.png',
                                ),

                                const SizedBox(
                                  height: 50,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    //SizedBox(child: Image.file(new File(_controller.bumpGallery.getAt(index)[0])),height: 150,),

                                    Container(
                                      height: 30,
                                      color: Colors.white38,
                                    ),
                                    Text(
                                      "${index + 1} WEEKS",
                                      //_controller.bumpGallery.getAt(index)[0],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                )
                                // Your elements here
                              ],
                            ),
                          )),
                        )
                      : Expanded(
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(2.0),
                            //padding: const EdgeInsets.all(3.0),

                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SizedBox(
                                  child: Image.file(
                                    File(_controller.bumpGallery
                                        .getAt(index)[0]),
                                    height: double.infinity,
                                    // Width of image selected
                                    // fit image in its width and height
                                    fit: BoxFit.fill,
                                    // set the alignment of image
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  color: Colors.white38,
                                  child: Center(
                                    child: Text(
                                      "${index + 1} WEEKS",
                                      //_controller.bumpGallery.getAt(index)[0],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
      ),
    );
  }
}
