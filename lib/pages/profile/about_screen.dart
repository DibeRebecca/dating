import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          getTranslated(context, 'about.about_title'),
          style: white18Style,
        ),
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding * 2, vertical: fixPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, 'about.about_app'),
                              style: semibold16blackStyle),
                          height5Space,
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sem maecenas proin nec, turpis iaculis viverra massa malesuada lacus.",
                            style: medium14GreyStyle.copyWith(height: 1.0),
                          )
                        ],
                      ),
                      heightSizeBox(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, 'about.term_of_use'),
                              style: semibold16blackStyle),
                          height5Space,
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sem maecenas proin nec, turpis iaculis viverra massa malesuada lacus.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sem maecenas proin nec, turpis iaculis viverra massa malesuada lacus.",
                            style: medium14GreyStyle.copyWith(height: 1.0),
                          )
                        ],
                      ),
                      heightSizeBox(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, 'about.source_libaries'),
                              style: semibold16blackStyle),
                          height5Space,
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sem maecenas proin nec, turpis iaculis viverra massa malesuada lacus.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sem maecenas proin nec, turpis iaculis viverra massa malesuada lacus.",
                            style: medium14GreyStyle.copyWith(height: 1.0),
                          )
                        ],
                      ),
                      heightSizeBox(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, 'about.app_version'),
                              style: semibold16blackStyle),
                          height5Space,
                          Text(
                            "V10.1",
                            style: medium14GreyStyle.copyWith(height: 1.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                heightSpace,
                const Divider(
                  color: Color(0xffF0F0F0),
                  thickness: 2,
                ),
                heightSizeBox(25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getTranslated(context, 'about.question'),
                      style: semibold18blackStyle,
                    ),
                    Text(getTranslated(context, 'about.send_message'),
                        textAlign: TextAlign.center, style: medium16blackStyle),
                    const Text("example@gmail.com", style: semibold16red3Style)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
