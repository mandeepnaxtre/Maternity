import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/kegal/klevel2_controller.dart';
import 'package:pregnacyv1/kegal/klevel_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/others/mealplan_controller.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class KegalLevel2 extends StatelessWidget {
  final _controller = Get.put(KegalLevel2Controller());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Level 1',
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
                                    Get.toNamed(Routes.weight.path);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0, top: 0),
                                            child: Text(
                                              _controller.levelsList2[position]['day'].toString(),
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
                                              'Classic:${_controller.levelsList2[position]['classic']}',

                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0),
                                            )),
                                      ),

                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 0, top: 0),
                                            child: Text(
                                              'Pulses:${_controller.levelsList2[position]['pulse']}',

                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _controller.levelsList2.length,
                ),
              ),
            ),
          ],
        ));
  }
}
