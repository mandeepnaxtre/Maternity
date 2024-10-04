import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pregnacyv1/authentication/login_page.dart';
import 'package:pregnacyv1/authentication/profile_page.dart';
import 'package:pregnacyv1/authentication/register_page.dart';
import 'package:pregnacyv1/authentication/resetpass_page.dart';
import 'package:pregnacyv1/calaneder/calander_page.dart';
import 'package:pregnacyv1/calaneder/timeline_page.dart';
import 'package:pregnacyv1/gallery/bump_page.dart';
import 'package:pregnacyv1/home/BarChartSample1.dart';
import 'package:pregnacyv1/home/contraction_page.dart';
import 'package:pregnacyv1/home/home_controller.dart';
import 'package:pregnacyv1/home/home_page.dart';
import 'package:pregnacyv1/kegal/kegal_page.dart';
import 'package:pregnacyv1/kegal/kegaltracker_page.dart';
import 'package:pregnacyv1/kegal/klevel2_page.dart';
import 'package:pregnacyv1/kegal/klevel_page.dart';
import 'package:pregnacyv1/kickcounter/kickcounter_page.dart';
import 'package:pregnacyv1/marketplace/pitems_page.dart';
import 'package:pregnacyv1/onboarding/onboarding_page.dart';
import 'package:pregnacyv1/others/mealplan_page.dart';
import 'package:pregnacyv1/register/register_page.dart';
import 'package:pregnacyv1/splash/splash_page.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';
import 'package:pregnacyv1/weight/weight_page.dart';
import 'package:pregnacyv1/weight/wtracker_page.dart';
import 'package:pregnacyv1/welcome/welcome_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        brightness: Brightness.light,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(
          name: Routes.splash.path,
          page: () => SplashPage(),
        ),
        GetPage(
          name: Routes.welcome.path,
          page: () => WelcomePage(),
        ),
        GetPage(
          name: Routes.register.path,
          page: () => RegisterPage(),
        ),
        GetPage(
          name: Routes.home.path,
          page: () => HomePage(),
        ),
        GetPage(
          name: Routes.kickcounter.path,
          page: () => KickCounterPage(),
        ),
        GetPage(
          name: Routes.weight.path,
          page: () => WeightPage(),
        ),
        GetPage(
          name: Routes.mealplan.path,
          page: () => MealPlanPage(),
        ),
        GetPage(
          name: Routes.contraction.path,
          page: () => ContractionPage(),
        ),
        GetPage(
          name: Routes.barchart.path,
          page: () => BarChartSample1(),
        ),
        GetPage(
          name: Routes.wtracker.path,
          page: () => WeightTracker(),
        ),
        GetPage(
          name: Routes.kegal.path,
          page: () => KegalPage(),
        ),
        GetPage(
          name: Routes.kegaltracker.path,
          page: () => KegalTracker(),
        ),
        GetPage(
          name: Routes.pitem.path,
          page: () => PregnancyItem(),
        ),
        GetPage(
          name: Routes.klevel.path,
          page: () => KegalLevels(),
        ),
        GetPage(
          name: Routes.klevel2.path,
          page: () => KegalLevel2(),
        ),
        GetPage(
          name: Routes.login.path,
          page: () => LoginPage(),
        ),
        GetPage(
          name: Routes.register1.path,
          page: () => Register1Page(),
        ),
        GetPage(
          name: Routes.resetpass.path,
          page: () => ResetPassPage(),
        ),
        GetPage(
          name: Routes.onboarding.path,
          page: () => OnBoardingPage(),
        ),
        GetPage(
          name: Routes.calander.path,
          page: () => CalanderPage(),
        ),
        GetPage(
          name: Routes.bump.path,
          page: () => BumpPage(),
        ),
        GetPage(
          name: Routes.profile.path,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: Routes.timeline.path,
          page: () => TimelinePage(),
        ),
      ],
      initialRoute: Routes.splash.path,
    );
  }
}

enum Routes {
  splash,
  welcome,
  register,
  home,
  kickcounter,
  weight,
  mealplan,
  contraction,
  barchart,
  wtracker,
  kegal,
  kegaltracker,
  pitem,
  pitemtracker,
  calander,
  klevel,
  klevel2,
  login,
  register1,
  resetpass,
  onboarding,
  bump,
  profile,
  timeline
}
