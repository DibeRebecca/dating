// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/main.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? languageValue;

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SharedPreferences? prefs;
  final _key = "value";

  double distanceValue = 50.0;

  var rangeValues = const RangeValues(1.0, 100.0);

  bool notificationValue = true;
  bool accountValue = true;

  void _changeLanguges(Languages languages) async {
    print("languages");
    print(languages);
    Locale temp = await setLocales(languages.languageCode!);

    MyApp.setLocale(context, temp);
  }

  @override
  void initState() {
    super.initState();
    _read();
  }

  _read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      languageValue = prefs!.getString(_key) ?? "English";
    });
  }

  var genderValue =
      DemoLocalizations.instance.getTranslateValues('setting.male');

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
          getTranslated(context, 'setting.settings'),
          style: white18Style,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2, vertical: fixPadding),
        children: [
          currentLocation(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: fixPadding),
            child: dividerContainer(),
          ),
          languages(context),
          Padding(
            padding: const EdgeInsets.only(bottom: fixPadding),
            child: dividerContainer(),
          ),
          gender(context),
          Padding(
            padding: const EdgeInsets.only(bottom: fixPadding),
            child: dividerContainer(),
          ),
          maxDistance(context),
          ageRange(context),
          appNotification(context, size),
          heightSpace,
          hideAccount(context, size),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: fixPadding),
            child: dividerContainer(),
          ),
          deleteAccount(context)
        ],
      ),
    );
  }

  gender(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingText(getTranslated(context, 'setting.show_me')),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              genderValue,
              style: medium14GreyStyle.copyWith(height: 0.1),
            ),
            DropdownButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 28,
                color: blackColor,
              ),
              underline: const SizedBox(),
              items: [
                DropdownMenuItem(
                  value: getTranslated(context, 'setting.male'),
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          border: genderValue ==
                                  getTranslated(context, 'setting.male')
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
                      widthSpace,
                      Text(
                        getTranslated(context, 'setting.male'),
                        style: medium162blackStyle,
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: getTranslated(context, 'setting.female'),
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          border: genderValue ==
                                  getTranslated(context, 'setting.female')
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
                      widthSpace,
                      Text(
                        getTranslated(context, 'setting.female'),
                        style: medium162blackStyle,
                      ),
                    ],
                  ),
                )
              ],
              onChanged: (String? value) {
                setState(() {
                  genderValue = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  languages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingText(getTranslated(context, 'setting.languages')),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              languageValue.toString(),
              style: medium14GreyStyle.copyWith(height: 0.1),
            ),
            DropdownButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 28,
                color: blackColor,
              ),
              underline: const SizedBox(),
              items: Languages.languageList
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              border: languageValue == lang.name
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
                          widthSpace,
                          Text(
                            lang.name.toString(),
                            style: medium162blackStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (Languages? language) {
                _changeLanguges(language!);

                setState(() {
                  languageValue = language.name;
                });
                prefs?.setString(_key, languageValue!);
                genderValue = (languageValue == 'English')
                    ? 'Male'
                    : (languageValue == 'हिन्दी')
                        ? 'पुरुष'
                        : (languageValue == 'bahasa Indonesia')
                            ? 'Pria'
                            : (languageValue == '中国人')
                                ? '男性'
                                : (languageValue == 'عربي')
                                    ? 'ذكر'
                                    : 'Male';
              },
            ),
          ],
        ),
      ],
    );
  }

  settingText(String text) {
    return Text(
      text.toString(),
      style: semibold16blackStylew500,
    );
  }

  deleteAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                titlePadding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 2, vertical: fixPadding * 2),
                title: Text(getTranslated(context, 'setting.delete_account'),
                    style: black16Style),
                contentPadding: const EdgeInsets.only(
                    bottom: fixPadding * 2,
                    left: fixPadding * 2,
                    right: fixPadding * 2),
                content: Text(getTranslated(context, 'setting.delete_alert'),
                    style: semibold16blackStylew500),
                actionsPadding: const EdgeInsets.only(
                    bottom: fixPadding * 2,
                    left: fixPadding * 2,
                    right: fixPadding * 2),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(getTranslated(context, 'setting.no'),
                        style: semibold16red3Stylew500),
                  ),
                  widthSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/signin');
                    },
                    child: Text(getTranslated(context, 'setting.yes'),
                        style: semibold16red3Stylew500),
                  ),
                ],
              );
            });
      },
      child: Text(getTranslated(context, 'setting.delete_account'),
          style: semibold16red3Stylew500),
    );
  }

  hideAccount(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        settingText(getTranslated(context, 'setting.hide_account')),
        SizedBox(
          height: size.height * 0.04,
          width: size.height * 0.09,
          child: Transform.scale(
            scaleX: 1.0,
            scaleY: 0.8,
            child: CupertinoSwitch(
                activeColor: red3Color,
                thumbColor: whiteColor,
                value: accountValue,
                onChanged: (newValue) {
                  setState(() {
                    accountValue = newValue;
                  });
                }),
          ),
        )
      ],
    );
  }

  appNotification(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        settingText(getTranslated(context, 'setting.app_notification')),
        SizedBox(
          height: size.height * 0.04,
          width: size.height * 0.09,
          child: Transform.scale(
            scaleX: 1.0,
            scaleY: 0.8,
            child: CupertinoSwitch(
                activeColor: red3Color,
                thumbColor: whiteColor,
                value: notificationValue,
                onChanged: (newValue) {
                  setState(() {
                    notificationValue = newValue;
                  });
                }),
          ),
        )
      ],
    );
  }

  ageRange(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            settingText(getTranslated(context, 'setting.age_range')),
            Text.rich(
              TextSpan(
                  text: rangeValues.start.toInt().toString(),
                  style: semibold16blackStylew500,
                  children: [
                    TextSpan(
                      text: getTranslated(context, 'setting.range_num'),
                      style: semibold16blackStylew500,
                    ),
                    TextSpan(
                      text: rangeValues.end.toInt().toString(),
                      style: semibold16blackStylew500,
                    ),
                  ]),
            ),
          ],
        ),
        Text(getTranslated(context, 'setting.age_dis'),
            style: medium12greyStyle),
        RangeSlider(
          activeColor: red3Color,
          inactiveColor: Colors.transparent,
          values: rangeValues,
          min: 1.0,
          max: 100.0,
          onChanged: (RangeValues newValues) {
            setState(() {
              rangeValues = newValues;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: fixPadding),
          child: dividerContainer(),
        ),
      ],
    );
  }

  maxDistance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            settingText(getTranslated(context, 'setting.maximum_distance')),
            Text.rich(TextSpan(
                text: distanceValue.toInt().toString(),
                style: semibold16blackStylew500,
                children: [
                  TextSpan(
                    text: getTranslated(context, 'setting.distance_num'),
                    style: semibold16blackStylew500,
                  ),
                ]))
          ],
        ),
        Text(getTranslated(context, 'setting.people_radius'),
            style: medium12greyStyle),
        Slider(
          activeColor: red3Color,
          inactiveColor: Colors.transparent,
          min: 1.0,
          max: 100.0,
          value: distanceValue,
          onChanged: (newvlaue) {
            setState(() {
              distanceValue = newvlaue;
            });
          },
        ),
        Text(getTranslated(context, 'setting.radius_dis'),
            style: semibold12red3Style),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: fixPadding),
          child: dividerContainer(),
        ),
      ],
    );
  }

  currentLocation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            settingText(getTranslated(context, "setting.current_location")),
            Row(
              children: [
                Image.asset(
                  "assets/detail/akar-icons_location.png",
                  height: 20,
                  width: 20,
                  color: greyColor94,
                ),
                widthSpace,
                Text(
                  getTranslated(context, "setting.name_location"),
                  style: medium14GreyStyle,
                )
              ],
            )
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            getTranslated(context, 'setting.update'),
            style: semibold16blackStyle.copyWith(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  dividerContainer() {
    return Container(
      height: 2,
      width: double.infinity,
      color: greyColorb7.withOpacity(0.2),
    );
  }
}

class Languages {
  final int? id;
  final String? name;
  final String? languageCode;

  Languages({this.id, this.languageCode, this.name});

  static List<Languages> languageList = [
    Languages(id: 1, name: "English", languageCode: 'en'),
    Languages(id: 2, name: "हिन्दी", languageCode: 'hi'),
    Languages(id: 3, name: "bahasa Indonesia", languageCode: 'id'),
    Languages(id: 4, name: "中国人", languageCode: 'zh'),
    Languages(id: 5, name: "عربي", languageCode: 'ar'),
  ];
}
