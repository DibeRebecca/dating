import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import '../../theme/theme.dart';

class ShowMeScreen extends StatefulWidget {
  const ShowMeScreen({Key? key}) : super(key: key);

  @override
  State<ShowMeScreen> createState() => _ShowMeScreenState();
}

class _ShowMeScreenState extends State<ShowMeScreen> {
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
              backButton(context),
              heightSizeBox(fixPadding * 12),
              showMeContainer(size)
            ],
          ),
        ),
      ),
    );
  }

  showMeContainer(Size size) {
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
          Text(getTranslated(context, 'show_me.show_me'), style: black24Style),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 0;
              });
              Navigator.pushNamed(context, '/locationenable');
            },
            selectedIndex == 0
                ? [
                    primaryColor.withOpacity(0.7),
                    gridentColor.withOpacity(0.7),
                  ]
                : [Colors.white, Colors.white],
            getTranslated(context, 'show_me.man'),
            selectedIndex == 0 ? Colors.white : Colors.black,
          ),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 1;
              });
              Navigator.pushNamed(context, '/locationenable');
            },
            selectedIndex == 1
                ? [
                    primaryColor.withOpacity(0.7),
                    gridentColor.withOpacity(0.7),
                  ]
                : [Colors.white, Colors.white],
            getTranslated(context, 'show_me.woman'),
            selectedIndex == 1 ? Colors.white : Colors.black,
          ),
          optionContainer(
            () {
              setState(() {
                selectedIndex = 2;
              });
              Navigator.pushNamed(context, '/locationenable');
            },
            selectedIndex == 2
                ? [
                    primaryColor.withOpacity(0.7),
                    gridentColor.withOpacity(0.7),
                  ]
                : [Colors.white, Colors.white],
            getTranslated(context, 'show_me.Other'),
            selectedIndex == 2 ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }

  backButton(BuildContext context) {
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
