import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pregnacyv1/calaneder/calander_controller.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalanderPage extends StatelessWidget {
  final _controller = Get.put(CalanderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
          tooltip: 'Increment',
          onPressed: () {
            Get.dialog(AddRemindertimeDialog());
          },
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        appBar: AppBar(
          title: const Text(
            'Calendar',
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
        body: Obx(() => EventCalendar(
              calendarType: CalendarType.GREGORIAN,
              calendarLanguage: 'en',
             calendarOptions: CalendarOptions(headerMonthElevation: 0.0,headerMonthBackColor: Colors.white),
              headerOptions:
                  HeaderOptions(weekDayStringType: WeekDayStringTypes.SHORT),
              events: _controller.eventArray.value,
            )));
  }

  /*SfCalendar(
  view: CalendarView.month,
  dataSource: MeetingDataSource(_getDataSource()),
  // by default the month appointment display mode set as Indicator, we can
  // change the display mode as appointment using the appointment display
  // mode property
  allowAppointmentResize: true,
  monthViewSettings: const MonthViewSettings(
  showAgenda: true,
  agendaViewHeight: 400,
  ),
  */ /*monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),*/ /*
  )*/

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    //final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    //final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'USG Scanning USG Scanning v USG \nScanning USG Scanning USG Scanning',
        const Color(0xFF0F8644),
        false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  /*@override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }*/

  /*@override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }*/

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  //Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  Meeting(this.eventName, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  //DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  //DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

class AddReminderDateDialog extends StatelessWidget {
  var initialDate = DateTime.now();
  var lastDate = DateTime.now().add(const Duration(days: 300));
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
                    const SizedBox(height: 30),
                    const Text(
                      "Add your weight:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    const SizedBox(height: 20),
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

class AddRemindertimeDialog extends StatelessWidget {
  var initialDate = DateTime.now();
  var lastDate = DateTime.now().add(const Duration(days: 300));
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Notes:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 5, right: 0),
                            child: TextField(
                              controller: TextEditingController(text: ''),
                              textInputAction: TextInputAction.search,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              maxLines: 12,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Color.fromRGBO(0, 0, 0, 0.6))),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Color.fromRGBO(0, 0, 0, 0.6))),
                                focusedBorder: OutlineInputBorder(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                            'SAVE',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
                          onTap: () async {
                            /*_controller1.weightAddedByPatientList.add(
                                FlSpot(10, _controller1.weightInKgs.value));*/

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
