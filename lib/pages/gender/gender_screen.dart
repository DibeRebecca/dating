import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';

import 'package:match_dating/theme/theme.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              heightSizeBox(fixPadding * 12),
              genderChooseBox(size)
            ],
          ),
        ),
      ),
    );
  }

  genderChooseBox(Size size) {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(getTranslated(context, 'gender.i_am'), style: black24Style),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 0;
              });
              Navigator.pushNamed(context, '/showme');
            },
            selectedIndex == 0
                ? [
                    primaryColor.withOpacity(0.7),
                    const Color(0xffEA4C46).withOpacity(0.7),
                  ]
                : [whiteColor, whiteColor],
            getTranslated(context, 'gender.man'),
            selectedIndex == 0 ? Colors.white : Colors.black,
          ),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 1;
              });
              Navigator.pushNamed(context, '/showme');
            },
            selectedIndex == 1
                ? [
                    primaryColor.withOpacity(0.7),
                    const Color(0xffEA4C46).withOpacity(0.7),
                  ]
                : [whiteColor, whiteColor],
            getTranslated(context, 'gender.woman'),
            selectedIndex == 1 ? Colors.white : Colors.black,
          ),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 2;
              });
              Navigator.pushNamed(context, '/showme');
            },
            selectedIndex == 2
                ? [
                    primaryColor.withOpacity(0.7),
                    const Color(0xffEA4C46).withOpacity(0.7),
                  ]
                : [whiteColor, whiteColor],
            getTranslated(context, 'gender.other'),
            selectedIndex == 2 ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }

  backButton() {
    return IconButton(
      padding:
          const EdgeInsets.symmetric(horizontal: fixPadding * 1.5, vertical: 8),
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: blackColor,
        size: 22,
      ),
    );
  }

  optionContainer(
      Function() onTap, List<Color> gradient, String text, Color textColor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fixPadding),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradient,
          ),
        ),
        child: Text(
          text.toString(),
          style: white18Style.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
