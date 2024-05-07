import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:match_dating/auth/views_models/auth_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
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
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              logo(size),
              const Gap(10),
              signupBox(size),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  signupBox(Size size) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return Container(
      height: size.height * 0.45,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Gap(5),
          Text(getTranslated(context, 'sign_up.signup'), style: black24Style),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: size.width * 0.4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 0),
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
                      child: Stack(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ce champ est requis';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              authViewModel.setFirstName(value);
                            },
                            cursorColor: primaryColor,
                            controller: firstnameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: greyColor94,
                                  size: 17,
                                ),
                                hintText: getTranslated(
                                    context, 'sign_up.enter_firstname'),
                                hintStyle: medium14GreyStyle),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Container(
                      height: 50,
                      width: size.width * 0.4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 0),
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
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ce champ est recquis';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          authViewModel.setLastName(value);
                        },
                        cursorColor: primaryColor,
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: greyColor94,
                              size: 17,
                            ),
                            hintText: getTranslated(
                                context, 'sign_up.enter_lastname'),
                            hintStyle: medium14GreyStyle),
                      ),
                    )
                  ],
                ),
                const Gap(12),
                phoneTextField(),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  // onTap: authViewModel.otp_sending
                  onTap: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        await authViewModel.sendOtpMessage(context: context);
                      }
                    } catch (e) {}
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: authViewModel.otp_sending
                          ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                greyColor.withOpacity(0.7),
                                greyColor.withOpacity(0.75),
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                primaryColor.withOpacity(0.7),
                                gridentColor.withOpacity(0.75),
                              ],
                            ),
                    ),
                    child: Text(
                      authViewModel.otp_sending
                          ? "..."
                          : getTranslated(context, 'sign_up.signup'),
                      style: extraboldTextStyle.copyWith(
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  phoneTextField() {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
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
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ce champ est requis';
          }
          return null;
        },
        onChanged: (value) {
          authViewModel.setPhoneNumber(value);
        },
        cursorColor: primaryColor,
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.phone_android,
              color: greyColor94,
              size: 17,
            ),
            hintText: getTranslated(context, 'sign_up.enter_moile'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  logo(Size size) {
    return Stack(
      children: [
        IconButton(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.5, vertical: 8),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackColor,
            size: 22,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash/splashLogo.png",
                height: size.height * 0.16,
                width: size.height * 0.16,
                fit: BoxFit.fill,
              ),
              Text(
                "Match",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Montserrat",
                  foreground: Paint()..shader = linearGradient,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
