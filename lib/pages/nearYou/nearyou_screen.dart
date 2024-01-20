import 'package:flutter/material.dart';
import 'package:match_dating/pages/profile/setting_screen.dart';

import '../../localization/localization_const.dart';
import '../../theme/theme.dart';

class NearYouScreen extends StatelessWidget {
  NearYouScreen({Key? key}) : super(key: key);

  final allNearYouList = [
    {
      "image": "assets/nearyou/n1.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
    {
      "image": "assets/nearyou/n2.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
    {
      "image": "assets/nearyou/n3.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
    {
      "image": "assets/nearyou/n4.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
    {
      "image": "assets/nearyou/n5.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
    {
      "image": "assets/nearyou/n6.png",
      "nameAge": "Galina Fishar,24",
      "away": "5.2 km away",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: whiteColor,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslated(context, 'near_you.near_you'),
          style: white18Style,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail');
            },
            child: Container(
              height: size.height * 0.2,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2, vertical: fixPadding),
              padding: const EdgeInsets.only(
                  left: fixPadding, bottom: fixPadding / 2, right: fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    allNearYouList[index]['image'].toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              alignment: languageValue == "عربي"
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    allNearYouList[index]['nameAge'].toString(),
                    style: extraboldTextStyle,
                  ),
                  Text(
                    allNearYouList[index]['away'].toString(),
                    style: medium16whiteStyle,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
