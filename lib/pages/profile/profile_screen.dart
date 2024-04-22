import 'package:flutter/material.dart';
import 'package:match_dating/auth/views_models/auth_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/models/user_login_response.dart';
import 'package:match_dating/pages/profile/rate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          getTranslated(context, 'profile.profile'),
          style: white18Style,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2),
        children: [
          profileImageText(context),
          heightSpace,
          firstListTiles(context),
          vipContainer(context),
          secondListTiles(context),
        ],
      ),
    );
  }

  secondListTiles(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: fixPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            listTileIcon(
              context,
              () {
                Navigator.pushNamed(context, '/about');
              },
              getTranslated(context, 'profile.about_us'),
              Icons.info,
            ),
            dividerContainer(),
            listTileIcon(
              context,
              () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 230,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: fixPadding, horizontal: fixPadding),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text(getTranslated(context, 'share.share_via'),
                                style: black18Style),
                            heightSizeBox(20),
                            Expanded(
                              child: Wrap(
                                spacing: 45,
                                runAlignment: WrapAlignment.spaceEvenly,
                                children: [
                                  sharewithFriendIcon(
                                    "assets/profile/facebook 1.png",
                                    "Facebook",
                                  ),
                                  sharewithFriendIcon(
                                    "assets/profile/whatsapp 1.png",
                                    "Whatsapp",
                                  ),
                                  sharewithFriendIcon(
                                    "assets/profile/gmail 1.png",
                                    "Email",
                                  ),
                                  sharewithFriendIcon(
                                    "assets/profile/instagram 1.png",
                                    "Instagram",
                                  ),
                                  sharewithFriendIcon(
                                    "assets/profile/drive 1.png",
                                    "Drive",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              getTranslated(context, 'profile.share_with_friends'),
              Icons.share,
            ),
            dividerContainer(),
            listTileIcon(
              context,
              () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Rate();
                    });
              },
              getTranslated(context, 'profile.rate'),
              Icons.star_rounded,
            ),
            dividerContainer(),
            listTileIcon(context, () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return signOut(context);
                  });
            }, getTranslated(context, 'profile.signout'),
                Icons.power_settings_new_rounded,
                color: red3Color),
            dividerContainer(),
          ],
        ));
  }

  sharewithFriendIcon(String icon, String name) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            icon.toString(),
            fit: BoxFit.fill,
          ),
        ),
        heightSpace,
        Text(name.toString(), style: medium16blackStyle),
      ],
    );
  }

  signOut(BuildContext context) {
    return AlertDialog(
      title:
          Text(getTranslated(context, 'signout.Signout'), style: black16Style),
      content: Text(
        getTranslated(context, 'signout.sure_message'),
        style: semibold16blackStyle.copyWith(
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(getTranslated(context, 'signout.no'),
              style: semibold16red3Stylew500),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/signin');
          },
          child: Text(getTranslated(context, 'signout.yes'),
              style: semibold16red3Stylew500),
        )
      ],
    );
  }

  vipContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: listTileImage(context, () {
        Navigator.pushNamed(context, '/vip');
      }, getTranslated(context, 'profile.vip_account'),
          "assets/profile/ri_vip-crown-fill.png", const Color(0xffFF9F0F)),
    );
  }

  firstListTiles(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          listTileImage(context, () {
            Navigator.pushNamed(context, '/editprofile');
          }, getTranslated(context, 'profile.edit_profile'),
              "assets/profile/Shopicons_Filled_Account.png", blackColor),
          dividerContainer(),
          listTileIcon(
            context,
            () {
              Navigator.pushNamed(context, '/settings');
            },
            getTranslated(context, 'profile.title_settings'),
            Icons.settings,
          ),
          dividerContainer(),
          listTileRichText(context, () {
            Navigator.pushNamed(context, '/like');
          }, Icons.thumb_up, getTranslated(context, 'profile.like'), "(125)"),
          dividerContainer(),
          listTileRichText(context, () {
            Navigator.pushNamed(context, '/dislike');
          }, Icons.thumb_down, getTranslated(context, 'profile.dislike'),
              "(25)"),
        ],
      ),
    );
  }

  profileImageText(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false);
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage("assets/itsmatch/m2jpg.jpg"),
        ),
        widthSizeBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${authViewModel.lastname}',
              style: black18Style,
            ),
            heightSizeBox(3),
            Row(
              children: [
                Image.asset(
                  "assets/detail/akar-icons_location.png",
                  color: greyColor94,
                  height: 20,
                  width: 20,
                ),
                width5Space,
                Text(getTranslated(context, 'profile.profile_location'),
                    style: semibold14greyStyle)
              ],
            ),
          ],
        )
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

  listTileRichText(BuildContext context, Function() onTap, IconData icon,
      String text1, String text2) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: blackColor,
        size: 20,
      ),
      minLeadingWidth: 10,
      title: Text.rich(
        TextSpan(
            text: text1,
            style: medium16whiteStyle.copyWith(color: blackColor),
            children: [
              const TextSpan(text: " "),
              TextSpan(
                text: text2,
                style: regularTextStyle.copyWith(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
            ]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: blackColor,
      ),
    );
  }

  listTileIcon(
      BuildContext context, Function() onTap, String name, IconData icon,
      {Color color = blackColor}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 22,
        color: color,
      ),
      minLeadingWidth: 10,
      title: Text(
        name,
        style: medium16whiteStyle.copyWith(color: color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: color,
      ),
    );
  }

  listTileImage(BuildContext context, Function() onTap, String name,
      String icon, Color color) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        icon,
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: color,
      ),
      minLeadingWidth: 10,
      title: Text(
        name,
        style: medium16whiteStyle.copyWith(color: color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: color,
      ),
    );
  }
}
