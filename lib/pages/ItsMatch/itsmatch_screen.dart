import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';

import 'package:match_dating/theme/theme.dart';

import '../screens.dart';

class ItsMatch extends StatelessWidget {
  const ItsMatch({Key? key}) : super(key: key);

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
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: languageValue == 'عربي'
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: IconButton(
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
              ),
              Center(
                child: Text(
                  getTranslated(context, 'it_match.cong_match'),
                  textAlign: TextAlign.center,
                  style: black22Style,
                ),
              ),
              heightSizeBox(40),
              matchImages(size),
              heightSizeBox(50),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(getTranslated(context, 'it_match.match_desc'),
                      style: medium16blackStyle),
                ),
              ),
              heightSizeBox(50),
              sendMessageButton(context, size)
            ],
          ),
        ),
      ),
    );
  }

  matchImages(Size size) {
    return Center(
      child: SizedBox(
        height: size.height * 0.43,
        width: size.width * 0.75,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: size.height * 0.24,
                width: size.width * 0.39,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: greyColor.withOpacity(0.4),
                        blurRadius: 4,
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/itsmatch/m1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: size.height * 0.24,
                width: size.width * 0.39,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: greyColor.withOpacity(0.4),
                        blurRadius: 4,
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/itsmatch/m2jpg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _buildFavotirCircle(size),
          ],
        ),
      ),
    );
  }

  sendMessageButton(BuildContext context, Size size) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/chat');
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
            getTranslated(context, 'it_match.send_msg'),
            style: extraboldTextStyle.copyWith(
              fontSize: 21,
            ),
          ),
        ),
      ),
    );
  }

  _buildFavotirCircle(Size size) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * 0.16,
        width: size.width * 0.16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.3),
              gridentColor.withOpacity(0.5),
              const Color(0xffF6BDC0).withOpacity(0.3),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomRight,
              colors: [
                primaryColor.withOpacity(0.5),
                const Color(0xffF6BDC0).withOpacity(0.5),
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [60, 70, 80],
                colors: [
                  primaryColor,
                  Color.fromARGB(255, 240, 101, 97),
                  Color(0xffF6BDC0),
                ],
              ),
            ),
            child: Image.asset("assets/itsmatch/heart.png"),
          ),
        ),
      ),
    );
  }
}
