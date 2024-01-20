import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/widget/column_builder.dart';
import '../../theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationlisttoday = [
    {
      "image": "assets/notification/h1.jpg",
      "title": "You are match with aliya.",
      "time": "5 min ago",
    },
    {
      "image": "assets/notification/m1.jpg",
      "title": "Aelina visit your profile.",
      "time": "3 min ago",
    },
    {
      "image": "assets/notification/Rectangle 17.png",
      "title": "Jeklin visit your profile.",
      "time": "3 min ago",
    },
  ];

  final notificationlistyesterday = [
    {
      "image": "assets/notification/h1.jpg",
      "title": "You are match with aliya.",
      "time": "5 min ago",
    },
    {
      "image": "assets/notification/m1.jpg",
      "title": "Aelina visit your profile.",
      "time": "3 min ago",
    },
    {
      "image": "assets/notification/Rectangle 17.png",
      "title": "Jeklin visit your profile.",
      "time": "3 min ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          getTranslated(context, 'notification.notification'),
          style: white18Style,
        ),
      ),
      body: (notificationlisttoday.isEmpty && notificationlistyesterday.isEmpty)
          ? noNotification(size, context)
          : notifications(context),
    );
  }

  notifications(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      children: [
        notificationlisttoday.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  left: fixPadding * 2,
                  right: fixPadding * 2,
                  bottom: fixPadding,
                ),
                child: Text(
                  getTranslated(context, 'notification.today'),
                  style: semibold18blackStyle,
                ),
              )
            : Container(),
        ColumnBuilder(
          itemCount: notificationlisttoday.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                margin: const EdgeInsets.symmetric(
                  vertical: fixPadding / 2,
                ),
              ),
              key: UniqueKey(),
              onDismissed: (dismissdirection) {
                setState(() {
                  notificationlisttoday.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      getTranslated(context, 'notification.remove_text'),
                    ),
                    duration: const Duration(milliseconds: 1500),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: fixPadding / 2, horizontal: fixPadding * 2),
                padding: const EdgeInsets.all(fixPadding / 2),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.5),
                      blurRadius: 3,
                    ),
                  ],
                ),
                width: double.maxFinite,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      notificationlisttoday[index]['image'].toString(),
                    ),
                  ),
                  title: Text(notificationlisttoday[index]["title"].toString(),
                      style: semibold16blackStyle),
                  subtitle: Text(
                    notificationlisttoday[index]["time"].toString(),
                    style: medium14GreyStyle,
                  ),
                ),
              ),
            );
          },
        ),
        heightSpace,
        notificationlistyesterday.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  left: fixPadding * 2,
                  right: fixPadding * 2,
                  bottom: fixPadding,
                ),
                child: Text(
                  getTranslated(context, 'notification.yesterday'),
                  style: semibold18blackStyle,
                ),
              )
            : Container(),
        ColumnBuilder(
          itemCount: notificationlistyesterday.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                margin: const EdgeInsets.symmetric(
                  vertical: fixPadding / 2,
                ),
              ),
              key: UniqueKey(),
              onDismissed: (dismissdirection) {
                setState(() {
                  notificationlistyesterday.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      getTranslated(context, 'notification.remove_text'),
                    ),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(milliseconds: 1500),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: fixPadding / 2, horizontal: fixPadding * 2),
                padding: const EdgeInsets.all(fixPadding / 2),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.5),
                      blurRadius: 3,
                    ),
                  ],
                ),
                width: double.maxFinite,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      notificationlistyesterday[index]["image"].toString(),
                    ),
                  ),
                  title: Text(
                      notificationlistyesterday[index]["title"].toString(),
                      style: semibold16blackStyle),
                  subtitle: Text(
                    notificationlistyesterday[index]['time'].toString(),
                    style: medium14GreyStyle,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  noNotification(Size size, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/notification/ci_notification-deactivated.png",
            height: size.height * 0.07,
            width: size.height * 0.07,
            fit: BoxFit.fill,
          ),
          heightSpace,
          Text(getTranslated(context, 'notification.no_notification'),
              style: semibold16greyStyle)
        ],
      ),
    );
  }
}
