import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:match_dating/crushes/views/crushes.dart';
import 'package:match_dating/friends/views/my_friends.dart';

import '../../localization/localization_const.dart';
import '../../theme/theme.dart';
import '../screens.dart';

class BottomNaviScreen extends StatefulWidget {
  const BottomNaviScreen({Key? key}) : super(key: key);

  @override
  State<BottomNaviScreen> createState() => _BottomNaviScreenState();
}

class _BottomNaviScreenState extends State<BottomNaviScreen> {
  int selectedIndex = 0;
  List screens = [
    const HomeScreen(),
    const MyFriends(),
    const NotificationScreen(),
    const ProfileScreen(),
    Crushes(),
  ];

  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 100,
              child: Image.asset("assets/home/Emoji.png"),
            ),
            screens.elementAt(selectedIndex)
          ],
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            Icons.home_outlined,
            Icons.messenger_outline,
            Icons.notifications_none_outlined,
            Icons.person_outline_rounded,
          ],
          iconSize: 28,
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          activeColor: red3Color,
          inactiveColor: greyColorb7,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            backgroundColor: red3Color,
            elevation: 0,
            onPressed: () {
              setState(() {
                selectedIndex = 4;
              });
            },
            child: const Icon(
              Icons.favorite_border,
              color: whiteColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
