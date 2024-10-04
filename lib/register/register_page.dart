import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/register/register_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  final _controller = Get.put(RegisterController());
  var initialDate = DateTime.now().subtract(const Duration(days: 7));
  var firstDate = DateTime.now().subtract(const Duration(days: 300));

// Obtain shared preferences.

// Save an integer value to 'counter' key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'DUE DATE CALCULATOR',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        shadowColor: Colors.black,
        surfaceTintColor: Color(ColorConstants.DARK_PINK_COLOR),
        foregroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        backgroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        toolbarHeight: 60,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Enter the first day of your last period to calculate your due date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0),
                  )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'First date on my last period',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                    Obx(
                      () => Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 10, right: 20),
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: _controller.periodStartDate.value),
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            hintText: '',
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                          style: const TextStyle(color: Colors.black),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: initialDate,
                                firstDate: firstDate,
                                lastDate: initialDate);

                            if (pickedDate != null) {
                              var dueDate =
                                  pickedDate.add(const Duration(days: 280));
                              _controller.dueDate.value =
                                  DateFormat('MMM dd,yyyy').format(dueDate);
                              _controller.periodStartDate.value =
                                  DateFormat('MMM dd,yyyy').format(pickedDate);

                              final difference = (DateTime.now()
                                      .difference(pickedDate)
                                      .inDays) *
                                  0.142857;

                              _controller.congratsMsg.value =
                                  "You're ${difference.toString().substring(0, difference.toString().indexOf('.'))} weeks pregnant";

                              await _controller.prefs.setDouble(
                                  Constants.CURRENT_WEEK,
                                  double.parse(difference.toString().substring(
                                      0, difference.toString().indexOf('.'))));

                              await _controller.prefs.setString(
                                  Constants.PERIOD_START_DATE,
                                  _controller.periodStartDate.value);

                              await _controller.prefs.setString(
                                  Constants.DUE_DATE,
                                  _controller.dueDate.value);
                            } else {}
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Due Date                ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    ),
                    Obx(
                      () => Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 5, right: 20),
                        child: TextField(
                          controller: TextEditingController(
                              text: _controller.dueDate.value),
                          readOnly: true,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(0, 0, 0, 0.6))),
                            hintText: '',
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                          style: const TextStyle(color: Colors.black),
                          onTap: () async {},
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.register.path);
                  },
                  child: Container(
                    /*decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("icons/bgmother.png"),
                      ),
                    ),*/
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => _controller.congratsMsg.value == ""
                              ? const SizedBox(
                                  height: 0,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 50),
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Congratulations!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            _controller.congratsMsg.value,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 40,
                          ),
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 0, bottom: 50),
                              child: InkWell(
                                onTap: () async {
                                  if (_controller.congratsMsg.value == "") {
                                  } else {
                                    Get.toNamed(Routes.home.path);
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    color: _controller.congratsMsg.value == ""
                                        ? Colors.grey
                                        : Color(ColorConstants.DARK_PINK_COLOR),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
    );
  }
}
