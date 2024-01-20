import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final messageList = [
      {
        "image": "assets/message/u1.jpg",
        "title": "jeklin Shah",
        "subtitle": "Oww! so sweet of you",
        "isActive": true,
      },
      {
        "image": "assets/message/u2.jpg",
        "title": "Ameliya wilson",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
      {
        "image": "assets/message/u3.jpg",
        "title": "Aliya patel",
        "subtitle": "Oww! so sweet of you",
        "isActive": true,
      },
      {
        "image": "assets/message/u4.jpg",
        "title": "karina parekh",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
      {
        "image": "assets/message/u5.jpg",
        "title": "jeklin Shah",
        "subtitle": "Oww! so sweet of you",
        "isActive": false,
      },
      {
        "image": "assets/message/u1.jpg",
        "title": "Ameliya wilson",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
      {
        "image": "assets/message/u7.jpg",
        "title": "Nita maheta",
        "subtitle": "Oww! so sweet of you",
        "isActive": false,
      },
      {
        "image": "assets/message/u8.jpg",
        "title": "Ameliya wilson",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
      {
        "image": "assets/message/u9.jpg",
        "title": "jeklin Shah",
        "subtitle": "Oww! so sweet of you",
        "isActive": false,
      },
      {
        "image": "assets/message/u10.jpg",
        'title': "Ameliya wilson",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
      {
        "image": "assets/message/u11.jpg",
        "title": "Ameliya wilson",
        "subtitle": "Oww! so sweet of you",
        "isActive": false,
      },
      {
        "image": "assets/message/u12.jpg",
        "title": "Ameliya wilson",
        "subtitle": "Nice! Get well soon",
        "isActive": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: size.height * 0.14,
        backgroundColor: primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getTranslated(context, 'message.msg_title'),
              style: white18Style,
            ),
            heightSpace,
            Container(
              height: size.height * 0.06,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: greyColorb7,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/chat');
            },
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        AssetImage(messageList[index]["image"].toString()),
                  ),
                  messageList[index]["isActive"] == true
                      ? Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: red3Color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            title: Text(
              messageList[index]['title'].toString(),
              style: semibold18blackStyle,
            ),
            subtitle: Text(
              messageList[index]['subtitle'].toString(),
              style: medium14GreyStyle.copyWith(
                height: 1.0,
              ),
            ),
            trailing: Column(
              children: const [
                height5Space,
                Text(
                  "2.00am",
                  style: regularTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
