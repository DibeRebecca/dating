import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:match_dating/auth/repo/api_status.dart';
import 'package:match_dating/auth/views_models/auth_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';

import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey <FormState> ();

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
            child: SafeArea(
              child: Form(
                key: formGlobalKey,
                child: ListView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()
                  ),
                  children: [
                    logoImageText(size),
                    const Gap(10),
                    signinBox(size),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signinBox(Size size) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return Container(
      height: size.height * 0.55,
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
          heightSizeBox(30),
          Text(getTranslated(context, 'sign_in.signin'), style: black24Style),
          heightSizeBox(50),
          Stack(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: fixPadding*2),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ce champ ne peut etre vide";
                    }
                    return null;
                  },

                  controller: phonecontroller,
                  onChanged: (value){
                    authViewModel.setPhoneNumber(value);
                  },
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        color: greyColor94,
                        size: 17,
                      ),
                      hintText: getTranslated(context, 'sign_in.enter_no'),
                      hintStyle: medium14GreyStyle
                  ),
                ),
              ),
            ],
          ),
          heightSizeBox(20),
          Stack(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding*2),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ce champ ne peut etre vide";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    authViewModel.setPassword(value);
                  },
                  controller: passwordController,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                          Icons.visibility,
                        color: greyColor94,
                        size: 17,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: greyColor94,
                        size: 17,
                      ),
                      hintText: getTranslated(context, 'sign_in.enter_password'),
                      hintStyle: medium14GreyStyle
                  ),
                ),
              ),
            ],
          ),
          heightSizeBox(50),
          signInButton(size),
          heightSizeBox(50),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "/signup");
          }, child: Text(getTranslated(context, 'sign_in.create_new_account'), style: semibold20greenStyle,)),
        ],
      ),
    );
  }

  logoImageText(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/splash/splashLogo.png",
          height: size.height * 0.16,
          width: size.height * 0.16,
          fit: BoxFit.cover,
        ),
        Text(
          "Soe Dating",
          style: TextStyle(
            fontSize: 40,
            fontFamily: "Montserrat",
            foreground: Paint()..shader = linearGradient,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  signInButton(Size size) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return GestureDetector(
      onTap: authViewModel.loading?null: () async {
        if(formGlobalKey.currentState!.validate()){
          final resp = await authViewModel.loginUser();
          
          if(resp is SuccessLogin){
            Navigator.pushReplacementNamed(context, "/bottom");
          }
        }
        //Navigator.pushNamed(context, '/signup');
      },
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.72,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: authViewModel.loading? Color(0xffF6BDC0).withOpacity(0.5): const Color(0xffF6BDC0),
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
        child: authViewModel.loading? CupertinoActivityIndicator(): Text(
          getTranslated(context, 'sign_in.signin'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  signInTextFeild() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
          )
        ],
      ),
      child: TextField(
        controller: phonecontroller,
        cursorColor: primaryColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.phone_android,
              color: greyColor94,
              size: 17,
            ),
            hintText: getTranslated(context, 'sign_in.enter_no'),
            hintStyle: medium14GreyStyle),
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
