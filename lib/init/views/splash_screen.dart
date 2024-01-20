import 'dart:async';

import 'package:flutter/material.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        if (sharedPreferences.getBool("first_open") == null || sharedPreferences.getBool("first_open") == true) {
          Navigator.pushNamed(context, '/onboarding');
        } else {
          if(sharedPreferences.getBool("is_logged_in") == true)
            Navigator.pushNamed(context, '/bottom');
          else
          Navigator.pushNamed(context, '/signin');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash/splesh screen.png".toString()),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash/splashLogo.png",
                height: 135,
                width: 135,
                fit: BoxFit.cover,
              ),
              Text(
                "Soe Dating",
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: "Montserrat",
                  foreground: Paint()..shader = linearGradient,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
