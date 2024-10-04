import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/others/mealplan_controller.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';

class MealPlanPage extends StatelessWidget {
  final _controller = Get.put(MealPlanController());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Healthy Meal Plan',
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
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Today',
                          ),
                        ),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'icons/food1.png',
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, top: 0),
                                      child: Text(
                                        'Breakfast',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0),
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, top: 0),
                                      child: Text(
                                        'Single Scrambled Egg',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0),
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 10, bottom: 0),
                                    child: Text(
                                      'Prep time: 2 min',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black54,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 9,
              ),
            ),
          ],
        ));
  }
}
