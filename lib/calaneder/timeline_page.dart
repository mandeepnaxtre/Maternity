import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/calaneder/calander_controller.dart';
import 'package:pregnacyv1/calaneder/timeline_controller.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class TimelinePage extends StatelessWidget {
  final _controller = Get.put(TimelineController());
  final List<Map<String, String>> timelineData = [
    {
      'week': 'Week 4',
      'milestone': 'Positive pregnancy test.',
      'description':
          'You might have confirmed your pregnancy with a home pregnancy test.',
    },
    {
      'week': 'Week 8',
      'milestone': 'First ultrasound.',
      'description':
          'The first ultrasound is often done around this time to check the baby’s development.',
    },
    {
      'week': 'Week 12',
      'milestone': 'End of the first trimester.',
      'description':
          'The risk of miscarriage drops significantly after the first trimester.',
    },
    {
      'week': 'Week 20',
      'milestone': 'Halfway mark.',
      'description':
          'You’re halfway through your pregnancy! You might have the anatomy scan now.',
    },
    {
      'week': 'Week 28',
      'milestone': 'Third trimester begins.',
      'description':
          'The third trimester starts, and the baby continues to grow rapidly.',
    },
    {
      'week': 'Week 40',
      'milestone': 'Estimated due date.',
      'description':
          'This is the estimated due date, though many babies are born before or after this date.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Timeline'),
      ),
      body: ListView.builder(
        itemCount: timelineData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              child: ListTile(
                title: Text(
                  timelineData[index]['week']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      timelineData[index]['milestone']!,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      timelineData[index]['description']!,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
