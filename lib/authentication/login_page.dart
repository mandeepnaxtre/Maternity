import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pregnacyv1/authentication/login_controller.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/splash/splash_controller.dart';
import 'package:pregnacyv1/utils/app_color.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

class LoginPage extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SIGN IN',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.0),
        ),
        shadowColor: Colors.black,
        surfaceTintColor: Color(ColorConstants.DARK_PINK_COLOR),
        foregroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        backgroundColor: Color(ColorConstants.DARK_PINK_COLOR),
        toolbarHeight: 40,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          color: Color(ColorConstants.APP_SPLASH_COLOR),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Container(
                  child: Text(
                    "SIGN IN YOUR ACCOUNT TO",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
                child: Container(
                  child: Text(
                    "GET STARTED!",
                    style: TextStyle(
                        color: Color(ColorConstants.DARK_PINK_COLOR),
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    //label: const Text('Name'),
                    filled: true,
                    hintStyle: TextStyle(
                        letterSpacing: 1, fontSize: 14.0, color: Colors.grey),
                    fillColor: Colors.white,
                    hintText: 'smantha@gmail.com',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  onTap: () async {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    //label: const Text('Name'),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        letterSpacing: 5, fontSize: 14.0, color: Colors.grey),

                    hintText: '********',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  onTap: () async {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 13.0),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.resetpass.path);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Color(ColorConstants.DARK_PINK_COLOR),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 50, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.home.path);
                  },
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Color(ColorConstants.DARK_PINK_COLOR),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.register1.path);
                },
                child: Text(
                  "Dont have account? Sign up here",
                  style: TextStyle(
                      color: Color(0xffFC78A7),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset(
                  'icons/bgmother.png',
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
