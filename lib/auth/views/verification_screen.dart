import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:match_dating/localization/localization_const.dart';

import '../../theme/theme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/onboarding/onboarding screen.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: otpBox(size),
              )),
        ),
      ),
    );
  }

  otpBox(Size size) {
    return Container(
      height: size.height * 0.42,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF1959B).withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          heightSizeBox(fixPadding * 2),
          Text(getTranslated(context, 'verification.verify'),
              style: black24Style),
          heightSizeBox(fixPadding * 3),
          verificationTextFields(),
          heightSizeBox(fixPadding * 4),
          continueButton(size),
          heightSpace,
          GestureDetector(
            onTap: () {},
            child: Text(
              getTranslated(context, 'verification.resend'),
              style:
                  semibold16blackStyle.copyWith(color: const Color(0xffF46969)),
            ),
          )
        ],
      ),
    );
  }

  continueButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/gender');
      },
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.67,
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
          getTranslated(context, 'verification.continue'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  verificationTextFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: firstController,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
              else
                FocusScope.of(context).previousFocus();
            },
            cursorHeight: 25,
            cursorColor: blackColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        widthSizeBox(fixPadding * 2),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: secondController,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
              else
                FocusScope.of(context).previousFocus();
            },
            cursorHeight: 25,
            cursorColor: blackColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        widthSizeBox(fixPadding * 2),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: thirdController,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
              else
                FocusScope.of(context).previousFocus();
            },
            cursorHeight: 25,
            cursorColor: blackColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        widthSizeBox(fixPadding * 2),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: fourController,
            onChanged: (value) {
              if (value.length == 1) {
                //Navigator.pushNamed(context, '/gender');
                // verify otp
              }
              else
                FocusScope.of(context).previousFocus();
            },
            cursorHeight: 25,
            cursorColor: blackColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  onWillPop() {
    Navigator.popAndPushNamed(context, '/signin');
  }
}
