import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/horizontal_week_calendar.dart';

class SplashPage extends StatelessWidget {
  final _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(ColorConstants.APP_SPLASH_COLOR),
          image: DecorationImage(
            image: AssetImage(
              'icons/splashbg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child:

        Center(
          child: SizedBox(
            height: 250,
            child: Image.asset(
              'icons/newlogosplash.png',
            ),
          ),
        ),
      ),
    );
  }
}
