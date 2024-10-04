import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

//changes
class CalanderController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  var eventArray = <Event>[].obs;
  late Box calanderBox;

  @override
  void onInit() async {
    super.onInit();
    calanderBox = await Hive.openBox(Constants.CALANDER_DATA);

    eventArray.add(
      Event(
        child: const Text(
          ' Laravel Event Laravel Event Laravel Event Laravel Event Laravel Event Laravel Event',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        dateTime: CalendarDateTime(
          year: 2024,
          month: 10,
          day: 13,
          calendarType: CalendarType.GREGORIAN,
        ),
      ),
    );
    eventArray.add(
      Event(
        child: const Text('Laravel Event'),
        dateTime: CalendarDateTime(
          year: 2024,
          month: 10,
          day: 10,
          calendarType: CalendarType.GREGORIAN,
        ),
      ),
    );
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
