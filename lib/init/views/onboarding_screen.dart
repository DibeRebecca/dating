import 'dart:io';

import 'package:flutter/material.dart';
import 'package:match_dating/init/views_models/init_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/onboarding/onboarding screen.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                findPartnerText(),
                circleIconImages(size),
                heightSizeBox(20),
                getStartedButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getStartedButton(Size size) {
    InitViewModel initViewModel = context.watch<InitViewModel>();
    return GestureDetector(
      onTap: () {
        initViewModel.setFirstTimeOpenAppFalse();
        Navigator.pushNamed(
          context,
          '/signin',
        );
      },
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF6BDC0),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.7),
              gridentColor.withOpacity(0.75),
            ],
          ),
        ),
        child: Text(
          getTranslated(context, 'onborading.get_started'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  circleIconImages(Size size) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.48,
          width: size.width * 0.70,
          child: Container(
            height: size.width * 0.70,
            width: size.height * 0.70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  redColor.withOpacity(0.15),
                  red2Color.withOpacity(0.15),
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(fixPadding * 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    redColor.withOpacity(0.20),
                    red2Color.withOpacity(0.20),
                  ],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      redColor.withOpacity(0.30),
                      red2Color.withOpacity(0.30),
                    ],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(35),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                      "assets/onboarding/ant-design_heart-filled.png"),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          child: circleImages(
              size.height * 0.13, 10, "assets/onboarding/splash_roud_1.jpg"),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: circleImages(
              size.height * 0.065, 5, "assets/onboarding/splash_roud_2.jpg"),
        ),
        Positioned(
          right: 10,
          top: 150,
          child: circleImages(
              size.height * 0.065, 5, "assets/onboarding/splash_roud_3.jpg"),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: circleImages(
              size.height * 0.13, 10, "assets/onboarding/splash_roud_1.jpg"),
        ),
        Positioned(
          bottom: 25,
          right: 80,
          child: circleImages(
              size.height * 0.065, 5, "assets/onboarding/splash_roud_1.jpg"),
        ),
      ],
    );
  }

  findPartnerText() {
    return Column(
      children: [
        Text(getTranslated(context, 'onborading.find_best'),
            style: black24Style),
        Text(
          getTranslated(context, 'onborading.partner'),
          style: red324Style,
        )
      ],
    );
  }

  circleImages(double size, double margin, String image) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: const Color(0xffFEE3E3),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: redColor.withOpacity(0.6),
            blurRadius: 2,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image.toString()),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: redColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (backpressTime == null ||
        now.difference(backpressTime!) > const Duration(seconds: 2)) {
      backpressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: blackColor,
          content: Text(
            getTranslated(context, 'app_exit.exit_text'),
            style: white16Style.copyWith(fontSize: 14),
          ),
          duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating));
      return false;
    } else {
      return true;
    }
  }
}
