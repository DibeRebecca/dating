// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';

import 'package:match_dating/theme/theme.dart';

class VIPScreen extends StatefulWidget {
  const VIPScreen({Key? key}) : super(key: key);

  @override
  State<VIPScreen> createState() => _VIPScreenState();
}

class _VIPScreenState extends State<VIPScreen> {
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
          getTranslated(context, 'vip.vip_account'),
          style: white18Style,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2),
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            "assets/profile/vip_icon.png",
            height: size.height * 0.1,
          ),
          height5Space,
          Text(
            getTranslated(context, 'vip.vip_account'),
            textAlign: TextAlign.center,
            style: black18Style,
          ),
          height5Space,
          Text(
            getTranslated(context, 'vip.vip_desc'),
            textAlign: TextAlign.center,
            style: semibold16blackStylew500,
          ),
          subscribePlan(),
          vipBenifit(),
        ],
      ),
    );
  }

  vipBenifit() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            getTranslated(context, 'vip.vip_benefits'),
            style: semibold18blackStyle,
          ),
          heightSpace,
          Container(
            height: 2,
            width: double.infinity,
            color: greyColorb7.withOpacity(0.2),
          ),
          heightSpace,
          benifitRow(
              Icons.location_on, getTranslated(context, 'vip.discover_people')),
          benifitRow(Icons.thumb_up_alt_rounded,
              getTranslated(context, 'vip.people_like')),
          benifitRow(Icons.thumb_down_alt_rounded,
              getTranslated(context, 'vip.people_dislike')),
          benifitRow(
              Icons.favorite_rounded, getTranslated(context, 'vip.math_fast')),
        ],
      ),
    );
  }

  subscribePlan() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(fixPadding * 1.5),
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            getTranslated(context, 'vip.subscribe_plan'),
            style: semibold18blackStyle,
          ),
          heightSizeBox(15),
          vipPriceContainer(
              getTranslated(context, 'vip.vip_1_month'), "\$3.00"),
          heightSpace,
          vipPriceContainer(
              getTranslated(context, 'vip.vip_6_month'), '\$13.00'),
          heightSpace,
          vipPriceContainer(
              getTranslated(context, 'vip.vip_1_year'), '\$24.00'),
        ],
      ),
    );
  }

  vipPriceContainer(String text, String price) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 1.5, horizontal: fixPadding * 1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/profile/vip_icon.png",
            height: 28,
            width: 28,
          ),
          widthSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text.toString(),
                style: semibold16blackStylew500,
              ),
              height5Space,
              Text(
                price,
                style: semibold16red3Style.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                int selectedindex = 0;
                showModalBottomSheet(
                  barrierColor: blackColor.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 275,
                      width: double.infinity,
                      padding: const EdgeInsets.all(fixPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, 'vip.select_method'),
                            style: semibold18blackStyle,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  selectedindex = 0;
                                });
                                Navigator.pushNamed(context, '/payment')
                                    .then((value) => Navigator.pop(context));
                              },
                              minLeadingWidth: 10,
                              leading: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  border: selectedindex == 0
                                      ? Border.all(
                                          width: 6,
                                          color: primaryColor,
                                        )
                                      : Border.all(
                                          width: 1,
                                          color: greyColorb7,
                                        ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                  getTranslated(context, 'vip.credit_card'),
                                  style: medium162blackStyle),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  selectedindex = 1;
                                });
                                Navigator.pushNamed(context, '/payment')
                                    .then((value) => Navigator.pop(context));
                              },
                              minLeadingWidth: 10,
                              leading: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  border: selectedindex == 1
                                      ? Border.all(
                                          width: 6,
                                          color: primaryColor,
                                        )
                                      : Border.all(
                                          width: 1,
                                          color: greyColorb7,
                                        ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                getTranslated(context, 'vip.net_banking'),
                                style: medium162blackStyle,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  selectedindex = 2;
                                });
                                Navigator.pushNamed(context, '/payment')
                                    .then((value) => Navigator.pop(context));
                              },
                              minLeadingWidth: 10,
                              leading: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  border: selectedindex == 2
                                      ? Border.all(
                                          width: 6,
                                          color: primaryColor,
                                        )
                                      : Border.all(
                                          width: 1,
                                          color: greyColorb7,
                                        ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                getTranslated(context, 'vip.upi_app'),
                                style: medium162blackStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
            },
            child: Text(getTranslated(context, 'vip.subscribe'),
                style: semibold14red3Stylew500),
          )
        ],
      ),
    );
  }

  benifitRow(
    IconData icon,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding, vertical: fixPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: red3Color,
          ),
          widthSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.toString(),
                  style: semibold16blackStylew500,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus vel eu, libero non accumsan dui.",
                  style: regularTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
