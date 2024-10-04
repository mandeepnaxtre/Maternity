import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/home/home_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/utils/app_color.dart';

class ContractionPage extends StatelessWidget {
  final _controller = Get.put(HomeController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Contractions info',
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
        body:Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset(
                        'icons/contraction.png',
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Text(
                            'Recognizing Contraction',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                          child: Text(
                            'The process of ovulation begins when your hypothalamus (a part of your brain) '
                                'releases gonadotropin-releasing hormone (GnRH). GnRH causes your'
                                ' pituitary gland (a gland in your brain) to secrete follicle-stimulating '
                                'hormone (FSH) and luteinizing hormone (LH)Between days six and 14 of your '
                                'menstrual cycle, FSH causes follicles (small sacs of fluid in your ovaries '
                                'that contain a developing egg) in one ovary to begin to mature. During days '
                                '10 to 14 of the cycle, only one of the developing follicles forms a fully '
                                'mature egg. Around day 14 in the menstrual cycle, a sudden surge in LH causes '
                                'the ovary to release this egg. \n \nThis is ovulation. After ovulation, the '
                                'hormone progesterone rises which helps prepare your uterus '
                                'for pregnancy.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              alignment: Alignment.topCenter,
              child: const Padding(
                  padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    'Good job 7 kicks in 0 minutes for today',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Image.asset(
                        'icons/foot.png',
                        height: 200,
                        width: 200,
                      ),
                    ),


                    Container(
                      alignment: Alignment.topCenter,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Kick',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'First',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Last',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset(
                        'icons/dummy.png',
                        height: 200,
                        width: double.infinity,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset(
                        'icons/home2.png',
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                          child: Text(
                            'What is happening in 4th week',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                          child: Text(
                            'In weeks 4 to 5 of early pregnancy, the embryo grows and develops'
                                ' within the lining of your womb. The outer cells reach out to '
                                'form links with your blood supply. The inner cells '
                                'form into 2, and then later into 3 layers. Each of these'
                                ' layers will grow to be different parts of your babys body: '
                                'the inner layer becomes the breathing and digestive systems, '
                                'including the lungs, stomach, gut and bladder the middle '
                                'layer becomes the heart, blood vessels, muscles and bones '
                                'the outer layer becomes the brain and nervous system,'
                                ' the eye lenses, tooth enamel, skin and nails In these early'
                                ' weeks of pregnancy, the embryo is attached to a tiny yolk '
                                'sac that provides nourishment. \n \nA few weeks later, '
                                'the placenta will be fully formed and take over the transfer '
                                'of nutrients to the embryo.'
                                ' \n \nA few weeks later, '
                                'the placenta will be fully formed and take over the transfer '
                                'of nutrients to the embryo.'
                                ' \n \nA few weeks later, '
                                'the placenta will be fully formed and take over the transfer '
                                'of nutrients to the embryo.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
