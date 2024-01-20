import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import '../../theme/theme.dart';

class LikeScreen extends StatelessWidget {
  LikeScreen({Key? key}) : super(key: key);

  final likelist = [
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m1.jpg"
    },
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m2.jpg"
    },
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m3.jpg"
    },
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m4.jpg"
    },
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m5.jpg"
    },
    {
      "name": "Aliya shah",
      "icon": "assets/detail/akar-icons_location.png",
      "palce": "Mumbai ,India",
      "image": "assets/match/m6.jpg"
    },
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
          getTranslated(context, 'like.who_like'),
          style: white18Style,
        ),
      ),
      body: GridView.builder(
        itemCount: likelist.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/viplike');
            },
            child: Container(
              height: size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    likelist[index]["image"].toString(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.8),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(likelist[index]['name'].toString(),
                            style: white14Style),
                        height5Space,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              likelist[index]['icon'].toString(),
                              width: 14,
                              height: 14,
                              color: whiteColor,
                            ),
                            width5Space,
                            Text(likelist[index]['palce'].toString(),
                                style: semibold12gwhiteStyle),
                          ],
                        )
                      ],
                    ),
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
