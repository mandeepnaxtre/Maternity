import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/resources/app_colors.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  final _controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.7;
    bool? isChecked = true;
    return Scaffold(
      backgroundColor: const Color(ColorConstants.APP_SPLASH_COLOR),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset(
              'icons/welcomeep.png',
              width: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Row(
                children: [
                  Image.asset(
                    'icons/newlogosplash.png',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'WELCOME TO \nPREGNANCY!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 28.0),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text(
                  'To be compliant with Data protection regulations we have to ask your consent for the following:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                )),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Row(
                children: [
                  Container(
                    //color: Colors.amber,
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => Checkbox(
                        checkColor: Colors.white,
                        value: _controller.check1.value,
                        onChanged: (value) {
                          _controller.check1.value = value!;
                        },
                      ),
                    ), //Checkbox
                  ),
                  SizedBox(
                    width: c_width,
                    child: const Text(
                      'To complaint with data protection regulations we have to ask your consent for the following.',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => Checkbox(
                        checkColor: Colors.white,
                        value: _controller.check2.value,
                        onChanged: (value) {
                          _controller.check2.value = value!;
                        },
                      ),
                    ), //Checkbox
                  ),
                  SizedBox(
                    width: c_width,
                    child: const Text(
                      'I agree to processing with data protection regulations we have to ask your consent for the following.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      checkColor: Colors.white,
                      value: _controller.check3.value,
                      onChanged: (value) {
                        _controller.check3.value = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    width: c_width,
                    child: const Text(
                      'I agree with sending my app usage data to Google Analytics, Firebase for analytics and improving app quality.**',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0),
                    ),
                  ) //Checkbox
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("icons/bgmother.png"),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.register.path);
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
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
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
        ],
      ),
    );
  }
}
