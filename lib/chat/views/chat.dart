import 'dart:async';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:match_dating/chat/views_models/chat_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/pages/profile/setting_screen.dart';
import 'package:match_dating/pages/screens.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController textEditingController = TextEditingController();

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

      print("here is the init");
      chatViewModel.getChatMessage();

      var keyboardVisibilityController = KeyboardVisibilityController();

      keyboardSubscription =
          keyboardVisibilityController.onChange.listen((bool visible) {
        if (visible == true) {
          print("set visibility to false");
          chatViewModel.setEmojiBoardVisibility(false);
        }
        print('Keyboard visibility update. Is visible: $visible');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool showEmojiBoard = false;
    ChatViewModel chatViewModel = context.watch<ChatViewModel>();
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
              backgroundImage:
                  AssetImage('assets/images/female_placeholder.png'),
            ),
            widthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${chatViewModel.selected_users.prenom} ${chatViewModel.selected_users.nom}",
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
    ChatViewModel chatViewModel = context.watch<ChatViewModel>();
    return chatViewModel.loading
        ? Expanded(
            child: Center(
            child: CupertinoActivityIndicator(),
          ))
        : Expanded(
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(fixPadding),
              shrinkWrap: true,
              itemCount: chatViewModel.chat_messages.length,
              itemBuilder: (context, index) {
                int reverseindex =
                    chatViewModel.chat_messages.length - 1 - index;

                return messageContainer(reverseindex);
              },
            ),
          );
  }

  messageContainer(int reverseindex) {
    ChatViewModel chatViewModel = context.watch<ChatViewModel>();
    return Container(
      width: double.maxFinite,
      margin: languageValue == "عربي"
          ? chatViewModel.chat_messages[reverseindex].self!
              ? const EdgeInsets.only(top: 10, bottom: 10, right: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, left: 70)
          : chatViewModel.chat_messages[reverseindex].self!
              ? const EdgeInsets.only(top: 10, bottom: 10, left: 70)
              : const EdgeInsets.only(top: 10, bottom: 10, right: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          chatViewModel.chat_messages[reverseindex].self!
              ? Container()
              : const CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('assets/images/female_placeholder.png'),
                ),
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment:
                  chatViewModel.chat_messages[reverseindex].self!
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                      chatViewModel.chat_messages[reverseindex].self
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    if (chatViewModel.chat_messages[reverseindex].id == "null")
                      Icon(
                        FeatherIcons.alertCircle,
                        color: Colors.red,
                      ),
                    if (chatViewModel.chat_messages[reverseindex].id == "null")
                      Gap(5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding, vertical: fixPadding * 1.5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: languageValue == "عربي"
                            ? chatViewModel.chat_messages[reverseindex].self!
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
                            : chatViewModel.chat_messages[reverseindex].self!
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
                        chatViewModel.chat_messages[reverseindex].text
                            .toString(),
                        style: semibold14blackStyle.copyWith(
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    )
                  ],
                ),
                height5Space,
                Text(
                  chatViewModel.chat_messages[reverseindex].sentTime,
                  style: semibold12greyStyle,
                ),
              ],
            ),
          ),
          Gap(5),
          chatViewModel.chat_messages[reverseindex].self!
              ? const CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('assets/images/female_placeholder.png'),
                )
              : Container(),
        ],
      ),
    );
  }

  /*

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
  */

  _buildsenField() {
    bool _showEmojiBoard = false;
    ChatViewModel chatViewModel = context.watch<ChatViewModel>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(
                    left: fixPadding - 4, right: 0, bottom: fixPadding),
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
                    prefixIcon: GestureDetector(
                      child: Icon(
                        FeatherIcons.smile,
                        color: Colors.black87,
                      ),
                      onTap: () {
                        if (WidgetsBinding.instance.window.viewInsets.bottom >
                            0.0) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          chatViewModel.setEmojiBoardVisibility(true);
                        } else {
                          // Keyboard is not visible.
                          chatViewModel.setEmojiBoardVisibility(true);
                        }
                        print("tap");
                      },
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.rotate(
                            angle: 0.8,
                            child: const Icon(Icons.attach_file,
                                color: blackColor)),
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
                  left: fixPadding - 5, right: fixPadding, bottom: fixPadding),
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
                      chatViewModel.sendNewMessage(textEditingController.text);
                    }
                  });
                  textEditingController.clear();
                },
                icon: const Icon(
                  Icons.send_rounded,
                  color: redColor,
                ),
              ),
            )
          ],
        ),
        chatViewModel.isEmojiBoardVisible
            ? SizedBox(
                height: 350,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    // Do something when emoji is tapped (optional)
                  },
                  onBackspacePressed: () {
                    // Do something when the user taps the backspace button (optional)
                  },
                  textEditingController: textEditingController,
                  // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                  config: Config(
                    columns: 7,
                    emojiSizeMax: 30 * (Platform.isIOS ? 1.30 : 1.0),
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: Colors.white,
                    indicatorColor: Colors.red,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.red,
                    backspaceColor: Colors.red,
                    skinToneDialogBgColor: Colors.red,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    noRecents: const Text(
                      'Pas de récent',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    // Needs to be const Widget
                    loadingIndicator: const SizedBox.shrink(),
                    // Needs to be const Widget
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
