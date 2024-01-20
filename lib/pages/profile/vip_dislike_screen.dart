import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import '../../theme/theme.dart';

class VIPDisLikeScreen extends StatelessWidget {
  VIPDisLikeScreen({Key? key}) : super(key: key);

  final List disimageList = [
    "assets/match/m1.jpg",
    "assets/match/m2.jpg",
    "assets/match/m1.jpg",
    "assets/match/m2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: whiteColor,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslated(context, 'vip_dislike.who_dislike'),
          style: white18Style,
        ),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: disimageList.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  disimageList[index],
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Container(
              height: size.height * 0.08,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/vip');
                    },
                    child: Image.asset(
                      "assets/profile/vip_icon.png",
                      height: size.height * 0.2,
                      width: size.width * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
