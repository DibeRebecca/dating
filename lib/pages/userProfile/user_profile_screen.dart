import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool islike = false;
  bool isdislike = false;

  List detailImages = [
    "assets/home/h1.jpg",
    "assets/home/d3.jpg",
    "assets/home/h3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: whiteColor,
              ),
            ),
            expandedHeight: size.height * 0.45,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    "assets/home/detailImage.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                namePlace(),
                heightSizeBox(20),
                aboutDetail(),
                heightSizeBox(20),
                basicInformation(),
                heightSizeBox(20),
                otherPhotos(size),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.083,
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700.withOpacity(0.5),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              likeunlike(
                size,
                () {
                  setState(() {
                    islike = !islike;
                    isdislike = false;
                  });
                },
                islike == true ? const Color(0xff5675E7) : blackColor2,
                Icons.thumb_up,
              ),
              likeunlike(
                size,
                () {
                  Navigator.pushNamed(context, '/itsmatch');
                },
                red3Color,
                Icons.favorite,
              ),
              likeunlike(
                size,
                () {
                  setState(() {
                    isdislike = !isdislike;
                    islike = false;
                  });
                },
                isdislike == true ? const Color(0xff5675E7) : blackColor2,
                Icons.thumb_down,
              ),
            ],
          ),
        ),
      ),
    );
  }

  basicInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslated(context, 'detail.basic_info'),
            style: semibold18blackStyle,
          ),
          Column(
            children: [
              basicInfo(getTranslated(context, 'detail.height'),
                  getTranslated(context, 'detail.height_num')),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.weight'),
                getTranslated(context, 'detail.weight_kg'),
              ),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.birth_date'),
                getTranslated(context, 'detail.date'),
              ),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.relationship'),
                getTranslated(context, 'detail.re_status'),
              ),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.occupation'),
                getTranslated(context, 'detail.occupation_name'),
              ),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.company'),
                getTranslated(context, 'detail.company_name'),
              ),
              height5Space,
              basicInfo(
                getTranslated(context, 'detail.nation'),
                getTranslated(context, 'detail.nation_name'),
              ),
              height5Space,
              basicInfo(getTranslated(context, 'detail.intrest'),
                  getTranslated(context, 'detail.intrest_name')),
            ],
          ),
        ],
      ),
    );
  }

  aboutDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslated(context, 'detail.about'),
            style: semibold18blackStyle,
          ),
          heightSpace,
          ReadMoreText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: medium14GreyStyle.copyWith(height: 1.0),
            colorClickableText: const Color(0xffEF1717),
            trimLines: 6,
            trimMode: TrimMode.Line,
          ),
        ],
      ),
    );
  }

  namePlace() {
    return Padding(
      padding: const EdgeInsets.only(
          left: fixPadding * 2, right: fixPadding * 2, top: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslated(context, 'detail.name'),
            style: semibold18blackStyle,
          ),
          height5Space,
          Row(
            children: [
              Image.asset(
                "assets/detail/akar-icons_location.png",
                height: 20,
                width: 20,
                color: greyColor94,
                fit: BoxFit.fill,
              ),
              widthSpace,
              Text(getTranslated(context, 'detail.location'),
                  style: semibold14greyStyle)
            ],
          ),
        ],
      ),
    );
  }

  otherPhotos(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Text(
            getTranslated(context, 'detail.photo'),
            style: semibold18blackStyle,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: detailImages
                .map((e) => Container(
                      height: size.height * 0.12,
                      width: size.width * 0.28,
                      margin: const EdgeInsets.symmetric(
                          vertical: fixPadding, horizontal: fixPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(e.toString()),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  basicInfo(String title, String info) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title.toString(),
              style: medium14GreyStyle,
              overflow: TextOverflow.visible,
            )),
        Expanded(
          flex: 3,
          child: Text.rich(
            overflow: TextOverflow.visible,
            TextSpan(
              text: ": ",
              children: [
                TextSpan(
                  text: info.toString(),
                  style: medium14GreyStyle,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  likeunlike(Size size, Function() onTap, Color color, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.068,
        width: size.height * 0.068,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(fixPadding),
        child: Icon(
          icon,
          color: whiteColor,
        ),
      ),
    );
  }
}
