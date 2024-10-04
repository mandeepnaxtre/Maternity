import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/kegal/klevel_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/others/mealplan_controller.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class KegalLevels extends StatelessWidget {
  final _controller = Get.put(KegalLevelsController());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Levels',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          shadowColor: Colors.black,
          surfaceTintColor: Colors.green,
          foregroundColor: Colors.green,
          backgroundColor: Colors.green,
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
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 0, right: 0, bottom: 5),
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green.shade100,
                                size: 40.0,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.klevel2.path);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0, top: 0),
                                            child: Text(
                                              _controller.levelsList[position]
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      _controller
                                                          .levelsList[position]
                                                          .toString()
                                                          .indexOf(',')),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17.0),
                                            )),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0, top: 0),
                                            child: Text(
                                              _controller.levelsList[position]
                                                  .toString()
                                                  .substring(
                                                      _controller.levelsList[
                                                                  position]
                                                              .toString()
                                                              .indexOf(',') +
                                                          2,
                                                      _controller
                                                          .levelsList[position]
                                                          .toString()
                                                          .length),
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text(
                                'Not started',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black54,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _controller.levelsList.length,
                ),
              ),
            ),
          ],
        ));
  }
}
