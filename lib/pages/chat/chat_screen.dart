import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/pages/profile/setting_screen.dart';
import 'package:match_dating/pages/screens.dart';

import '../../theme/theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                "assets/itsmatch/m1.jpg",
              ),
            ),
            widthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getTranslated(context, 'chat.name'),
                    style: semibold16whiteStylew500),
                Text(
                  getTranslated(context, 'chat.online'),
                  style: regularTextStyle.copyWith(
                    color: whiteColor,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/call');
            },
            icon: const Icon(
              Icons.call,
              size: 22,
              color: whiteColor,
            ),
          ),
          popupButton()
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/chat/chat.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            messages(size),
            _buildsenField(),
          ],
        ),
      ),
    );
  }

  popupButton() {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: whiteColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (ctx) {
        return [
          PopupMenuItem(
            onTap: () {
              Future.delayed(
                const Duration(seconds: 0),
                () => showDialog(
                  context: context,
                  barrierColor: blackColor.withOpacity(0.3),
                  builder: (ctx) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 6),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: fixPadding,
                        horizontal: fixPadding * 2.4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(getTranslated(context, 'chat.block'),
                          style: black16Style),
                      content: Text(
                        getTranslated(context, 'chat.block_text'),
                        style: semibold16blackStylew500,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(getTranslated(context, 'chat.no'),
                              style: semibold16priStylew500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(getTranslated(context, 'chat.yes'),
                              style: semibold16priStylew500),
                        )
                      ],
                    );
                  },
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    color: blackColor,
                    shape: BoxShape.circle,
                  ),
                ),
                widthSpace,
                Text(getTranslated(context, 'chat.block_account'),
                    style: medium16blackStyle),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    color: blackColor,
                    shape: BoxShape.circle,
                  ),
                ),
                widthSpace,
                Text(getTranslated(context, 'chat.report'),
                    style: medium16blackStyle),
              ],
            ),
          )
        ];
      },
    );
  }

  messages(Size size) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding),
        shrinkWrap: true,
        itemCount: chatMessageList.length,
        itemBuilder: (context, index) {
          int reverseindex = chatMessageList.length - 1 - index;
          return chatMessageList[reverseindex].isimage
              ? imageContainer(reverseindex, size)
              : messageContainer(reverseindex);
        },
      ),
    );
  }

  messageContainer(int reverseindex) {
    return Container(
      width: double.maxFinite,
      margin: languageValue == "عربي"
          ? chatMessageList[reverseindex].isMe!
              ? const EdgeInsets.only(top: 10, bottom: 10, right: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, left: 70)
          : chatMessageList[reverseindex].isMe!
              ? const EdgeInsets.only(top: 10, bottom: 10, left: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, right: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatMessageList[reverseindex].isMe!
              ? Container()
              : const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage("assets/itsmatch/m2jpg.jpg"),
                ),
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment: chatMessageList[reverseindex].isMe!
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding, vertical: fixPadding * 1.5),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: languageValue == "عربي"
                        ? chatMessageList[reverseindex].isMe!
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                        : chatMessageList[reverseindex].isMe!
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                    boxShadow: [
                      BoxShadow(
                        color: greyColor.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text(
                    chatMessageList[reverseindex].text.toString(),
                    style: semibold14blackStyle.copyWith(
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
                height5Space,
                const Text(
                  "1.30 pm",
                  style: semibold12greyStyle,
                ),
              ],
            ),
          ),
          chatMessageList[reverseindex].isMe!
              ? const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage("assets/itsmatch/m1.jpg"),
                )
              : Container(),
        ],
      ),
    );
  }

  imageContainer(int reverseindex, Size size) {
    return Container(
      width: double.maxFinite,
      margin: languageValue == "عربي"
          ? chatMessageList[reverseindex].isMe!
              ? const EdgeInsets.only(top: 10, bottom: 10, right: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, left: 70)
          : chatMessageList[reverseindex].isMe!
              ? const EdgeInsets.only(top: 10, bottom: 10, left: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, right: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatMessageList[reverseindex].isMe!
              ? Container()
              : const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage("assets/itsmatch/m2jpg.jpg"),
                ),
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment: chatMessageList[reverseindex].isMe!
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.22,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding, vertical: fixPadding * 1.5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        image: DecorationImage(
                          image: AssetImage(
                            chatMessageList[reverseindex].image.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: languageValue == "عربي"
                            ? chatMessageList[reverseindex].isMe!
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  )
                            : chatMessageList[reverseindex].isMe!
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  )
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    widthSpace,
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.22,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding, vertical: fixPadding * 1.5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        image: DecorationImage(
                          image: AssetImage(
                            chatMessageList[reverseindex].image2.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                height5Space,
                const Text(
                  "1.30 pm",
                  style: semibold12greyStyle,
                ),
              ],
            ),
          ),
          chatMessageList[reverseindex].isMe!
              ? const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(
                    "assets/itsmatch/m1.jpg",
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  _buildsenField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(
                left: fixPadding * 2, right: fixPadding, bottom: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon:
                    const Icon(Icons.emoji_emotions_outlined, color: redColor),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Transform.rotate(
                        angle: 0.8,
                        child:
                            const Icon(Icons.attach_file, color: blackColor)),
                    const Icon(Icons.mic, color: blackColor),
                  ],
                ),
                suffixIconConstraints: const BoxConstraints(
                  maxWidth: 60,
                ),
                hintText: getTranslated(context, 'chat.type_text'),
                hintStyle: regularTextStyle.copyWith(color: redColor),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(
              left: fixPadding, right: fixPadding, bottom: fixPadding),
          padding: const EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: primaryColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (textEditingController.text.isEmpty) {
                  null;
                } else {
                  chatMessageList.add(ChatModel(
                    text: textEditingController.text,
                    isMe: true,
                  ));
                }
              });
              chatMessageList;
              textEditingController.clear();
            },
            icon: const Icon(
              Icons.send_rounded,
              color: redColor,
            ),
          ),
        )
      ],
    );
  }
}

class ChatModel {
  final dynamic text;
  final bool? isMe;
  final String? image;
  final String? image2;
  final bool isimage;

  ChatModel(
      {this.image2, this.image, this.isMe, this.text, this.isimage = false});
}

List<ChatModel> chatMessageList = [
  ChatModel(
    text: "Hii Galina",
    isMe: false,
  ),
  ChatModel(
    text: "Hii, how are you ? ",
    isMe: true,
  ),
  ChatModel(
    text: "I am fine. can i follow you?",
    isMe: false,
  ),
  ChatModel(
    text: "lol... why why would you want to follow me. ",
    isMe: true,
  ),
  ChatModel(
    text: "Because my parents told me always follow my dreams.",
    isMe: false,
    image: "assets/chat/c1.jpg",
    image2: "assets/chat/c2.jpg",
    isimage: true,
  ),
  ChatModel(
    text: "😍",
    isMe: true,
  ),
];
