// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  var selectedIndex = 3;

  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _buildStar(int starcount) {
      return InkWell(
        child: Icon(
          Icons.star,
          size: 40,
          color: selectedIndex >= starcount
              ? const Color(0xffFF9F0F)
              : const Color(0xffE7E6E6),
        ),
        onTap: () {
          setState(() {
            selectedIndex = starcount;
          });
        },
      );
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      scrollable: true,
      titlePadding: const EdgeInsets.all(20),
      title: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              getTranslated(context, 'rate.like_app'),
              textAlign: TextAlign.center,
              style: black18Style,
            ),
            Text(
              getTranslated(context, 'rate.what_you_think'),
              style: semibold16greyStyle,
            ),
            heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStar(0),
                width5Space,
                _buildStar(1),
                width5Space,
                _buildStar(2),
                width5Space,
                _buildStar(3),
                width5Space,
                _buildStar(4),
              ],
            ),
            heightSpace,
            Container(
              height: 150,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: greyColorb7.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ],
              ),
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: reviewController,
                cursorColor: blackColor,
                cursorHeight: 25,
                cursorWidth: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: getTranslated(context, 'rate.write_mesaage'),
                  hintStyle: medium16whiteStyle.copyWith(
                    color: const Color(0xff8D8D8D),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Text(getTranslated(context, 'rate.cancel'), style: red318Style),
        ),
        widthSizeBox(20),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Text(getTranslated(context, 'rate.submit'), style: red318Style),
        ),
      ],
    );
  }
}
