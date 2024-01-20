import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:match_dating/chat/views_models/chat_view_model.dart';
import 'package:match_dating/home/views_models/home_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';

class MyFriends extends StatefulWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  State<MyFriends> createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {

  @override
  void initState(){
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

      print("here is the init");
      homeViewModel.getMyFriends();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    ChatViewModel chatViewModel = context.watch<ChatViewModel>();


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
      body: homeViewModel.loadingFriends? Center(
        child: CupertinoActivityIndicator(),
      )
      :ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: homeViewModel.friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              chatViewModel.resetChatMessagesToEmpty();
              chatViewModel.setCurrentUser(homeViewModel.friends[index]);
              Navigator.pushNamed(context, '/chat');
            },
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: homeViewModel.friends[index].avatar.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => CircleAvatar(
                      backgroundImage: AssetImage('assets/images/female_placeholder.png'),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundImage: AssetImage('assets/images/female_placeholder.png'),
                    ),
                    width: 100,
                    height: 100,
                  ),
                  /*
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
                  */
                ],
              ),
            ),
            title: Row(
              children: [
                Text(
                  "${homeViewModel.friends[index].prenom} ${homeViewModel.friends[index].prenom}",
                  style: semibold18blackStyle,
                ),
                Gap(3),
                Text(
                  ", ${homeViewModel.friends[index].profession}",
                  style: medium16blackStyle,
                )
              ],
            ),
            subtitle: Text(
              "${homeViewModel.friends[index].phone!.e164}",
              style: medium14GreyStyle.copyWith(
                height: 1.0,
              ),
            ),
            trailing: Column(
              children: const [
                height5Space,
                Text(
                  "14h00",
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
