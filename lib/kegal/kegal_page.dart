import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/welcome/welcome_controller.dart';

class KegalPage extends StatelessWidget {
  final _controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Classic Kegel',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        shadowColor: Colors.black,
        surfaceTintColor: const Color(ColorConstants.DARK_PINK_COLOR),
        foregroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
        backgroundColor: const Color(ColorConstants.DARK_PINK_COLOR),
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
      body: Container(
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      '3 sec sequeeze, 3 sec relax \n9 times',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 5, bottom: 5, right: 30),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      border: Border.all(width: 0, color: Colors.white),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(600)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          'Relax',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 90),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(width: 0, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 30, top: 5, bottom: 5, right: 30),
                        child: Text(
                          'Exit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    // var todaysDate =
                    //     DateFormat('MMM dd,yyyy').format(DateTime.now());
                    //
                    // var box = await Hive.openBox(Constants.WEIGHT_DATA);
                    // box.put(todaysDate, [6, 64.6, 2.7]);
                    // print(box.length);
                    //Get.toNamed(Routes.wtracker.path);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 90),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: const Color(ColorConstants.DARK_PINK_COLOR),
                        border: Border.all(width: 0, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 30, top: 5, bottom: 5, right: 30),
                        child: Text(
                          'Resume',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
