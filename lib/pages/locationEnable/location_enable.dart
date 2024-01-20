import 'dart:async';
import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import '../../theme/theme.dart';

class LocationEnableScreen extends StatefulWidget {
  const LocationEnableScreen({Key? key}) : super(key: key);

  @override
  State<LocationEnableScreen> createState() => _LocationEnableScreenState();
}

class _LocationEnableScreenState extends State<LocationEnableScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              heightSizeBox(fixPadding * 12),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/location/carbon_location-heart-filled.png",
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        getTranslated(context, 'location_enable.enable_disc'),
                        textAlign: TextAlign.center,
                        style: semibold18blackStyle,
                      ),
                    ),
                    heightSizeBox(10),
                    locationButton(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  locationButton(Size size) {
    return GestureDetector(
      onTap: () {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/bottom'),
        );
        showDialog(
          barrierColor: blackColor.withOpacity(0.3),
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 32,
                    width: 32,
                    child: CircularProgressIndicator(
                      color: red3Color,
                    ),
                  ),
                  heightSizeBox(10),
                  Text(getTranslated(context, 'location_enable.please_wait'),
                      style: black18Style),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.7,
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
          getTranslated(context, 'location_enable.enable_location'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
