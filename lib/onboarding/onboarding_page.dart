import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/authentication/login_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/onboarding/onboarding_controller.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  final _controller = Get.put(OnBoardingController());
  final Color kDarkBlueColor = const Color(0xFF053149);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      _controller.tabObxcount.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    if (index == 5) {
      Get.toNamed(Routes.welcome.path);
    }
    _controller.tabObxcount.value = index;
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.welcome.path);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.tabObxcount.value == 0
                              ? const Color(ColorConstants.DARK_PINK_COLOR)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.tabObxcount.value == 1
                              ? const Color(ColorConstants.DARK_PINK_COLOR)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.tabObxcount.value == 2
                              ? const Color(ColorConstants.DARK_PINK_COLOR)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.tabObxcount.value == 3
                              ? const Color(ColorConstants.DARK_PINK_COLOR)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.tabObxcount.value == 4
                              ? const Color(ColorConstants.DARK_PINK_COLOR)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _changePage(_tabController.index + 1);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[Tab1(), Tab2(), Tab3(), Tab4(), Tab5()],
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
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'icons/eclippe_top.png',
                      width: double.infinity,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SAFE',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        'BUMP',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/ob1.png',
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME  TO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        ' PREGNANCY',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Welcome to Pregnancy, your trusted partner for a safe and healthy pregnancy journey.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'icons/eclippe_top.png',
                      width: double.infinity,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TRACKING',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        'TOOLS',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/ob2.png',
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME  TO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        ' PREGNANCY',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'The app will provide tracking tools to help users monitor their pregnancy & postpartum progress, including weight tracking, contraction timing, & breastfeeding tracker.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'icons/eclippe_top.png',
                      width: double.infinity,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EDUCATIONAL',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        'RESOURCES',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/ob3.png',
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME  TO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        ' PREGNANCY',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'The app will provide educational resources to help users learn about maternal health, including articles, videos, and podcasts.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class Tab4 extends StatelessWidget {
  const Tab4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'icons/eclippe_top.png',
                      width: double.infinity,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PAIR WITH YOUR',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        'HUSBAND',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/ob4.png',
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME  TO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        ' PREGNANCY',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'The app will provide a community support feature to help users connect with other users, share experiences, and receive support.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class Tab5 extends StatelessWidget {
  const Tab5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorConstants.APP_SPLASH_COLOR),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'icons/eclippe_top.png',
                      width: double.infinity,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'APPOINTMENT',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        'SCHEDULAR',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/ob5.png',
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME  TO',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                      Text(
                        ' PREGNANCY',
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'The app will allow users to schedule and manage their appointments with healthcare providers, such as doctors and midwives.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
