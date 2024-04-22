import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:match_dating/home/views_models/home_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:gap/gap.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:swipable_stack/swipable_stack.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

      homeViewModel.getUsersForMatch();
    });


    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Material(
          elevation: 0.3,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Icon(
                  FeatherIcons.image,
                  color: Colors.black87,
                ),
                Text(
                  "photos",
                  style: medium16blackStyle,
                )
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            FeatherIcons.search,
            color: Colors.redAccent,
          ),
          Gap(15),
          Icon(
            FeatherIcons.bell,
            color: Colors.redAccent,
          ),
          Gap(20)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            height5Space,
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 160, 69, 69)),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 211, 210, 210).withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                margin:
                    EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
                padding:
                    EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.0),
                      width: 60.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 184, 183, 183)),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/female_placeholder.png'),
                          ),
                          Icon(
                            FeatherIcons.plusCircle,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for (int i = 0; i < 3; i++)
                            Container(
                              padding: EdgeInsets.all(2),
                              width: 70,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    padding:
                                        const EdgeInsets.all(fixPadding / 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          redColor,
                                          red2Color.withOpacity(0.4),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      padding:
                                          const EdgeInsets.all(fixPadding / 6),
                                      decoration: const BoxDecoration(
                                        color: whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/home/near1.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Rebecca')
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                )),
            //heightSpace,
            //otherProfile(size),
            Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.61,
                    width: size.width * 0.94,
                    child: homeViewModel.loading? CupertinoActivityIndicator()
                        :
                    SwipeCards(
                      matchEngine: homeViewModel.matchEngine,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          elevation: 3,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(homeViewModel.swipeItems[index].content.avatar),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                width: size.width*0.94,
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Gap(5),

                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          homeViewModel.swipeItems[index].content.text,
                                          style: TextStyle(fontSize: 25, overflow: TextOverflow.ellipsis),
                                        ),),
                                        Gap(10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Material(
                                              elevation: 3,
                                              borderRadius: BorderRadius.circular(100),
                                              child: Container(
                                                child: Icon(FeatherIcons.thumbsDown),
                                                padding: EdgeInsets.all(25),
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    shape: BoxShape.circle
                                                ),
                                              ),
                                            ),
                                            Material(
                                              elevation: 3,
                                              borderRadius: BorderRadius.circular(100),
                                              child: Container(
                                                child: Icon(FeatherIcons.zap, color: Colors.white,),
                                                padding: EdgeInsets.all(30),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle
                                                ),
                                              ),
                                            ),
                                            Material(
                                              elevation: 3,
                                              borderRadius: BorderRadius.circular(100),
                                              child: Container(
                                                child: Icon(FeatherIcons.thumbsUp),
                                                padding: EdgeInsets.all(25),
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    shape: BoxShape.circle
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        );
                      },
                      onStackFinished: () {},
                      itemChanged: (SwipeItem item, int index) {
                        print("item: ${item.content.text}, index: $index");
                      },
                      upSwipeAllowed: true,
                      fillSpace: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  seeAllText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding / 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTranslated(context, 'home.near_you'),
            style: semibold18blackStyle,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/nearyou');
            },
            child: Text(getTranslated(context, 'home.see_all'),
                style: semibold14red3Stylew500),
          ),
        ],
      ),
    );
  }
}
