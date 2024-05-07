import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:match_dating/home/views_models/home_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/mixins/global.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
            padding: const EdgeInsets.all(5),
            child: const Column(
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
        actions: const [
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
                  border:
                      Border.all(color: const Color.fromARGB(255, 160, 69, 69)),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 211, 210, 210)
                          .withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(
                    left: 10, top: 0, right: 10, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 10, top: 5, right: 10, bottom: 5),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      width: 60.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 184, 183, 183)),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/female_placeholder.png'),
                          ),
                          Icon(
                            FeatherIcons.plusCircle,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: GlobalMixin().dio().then(
                          (dio) {
                            return dio.get("/get-stories").then(
                              (value) {
                                if (value.statusCode == 200) {
                                  return [];
                                }

                                return [];
                              },
                            );
                          },
                        ),
                        builder: (context, snapshot) {
                          debugPrint(snapshot.data.toString());
                          if (snapshot.hasData) {
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                for (int i = 0; i < 3; i++)
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    width: 70,
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.all(
                                              fixPadding / 4),
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
                                            padding: const EdgeInsets.all(
                                                fixPadding / 6),
                                            decoration: const BoxDecoration(
                                              color: whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/home/near1.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text('Rebecca')
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    )
                  ],
                )),
            //heightSpace,
            //otherProfile(size),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.61,
                    width: size.width * 0.94,
                    child: homeViewModel.loading
                        ? const CupertinoActivityIndicator()
                        : SwipeCards(
                            matchEngine: homeViewModel.matchEngine,
                            itemBuilder: (BuildContext context, int index) {
                              return Material(
                                elevation: 3,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: SvgPicture.network(homeViewModel
                                          .swipeItems[index].content.avatar),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        width: size.width * 0.94,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.4)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Gap(5),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    homeViewModel
                                                        .swipeItems[index]
                                                        .content
                                                        .text,
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                                const Gap(10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        GlobalMixin()
                                                            .dio()
                                                            .then(
                                                          (dio) {
                                                            dio
                                                                .post(
                                                              "/match-user/${homeViewModel.swipeItems[index].content.id}",
                                                            )
                                                                .then(
                                                              (value) {
                                                                if (value
                                                                        .statusCode ==
                                                                    200) {
                                                                  homeViewModel
                                                                      .match(
                                                                    homeViewModel
                                                                        .swipeItems[
                                                                            index]
                                                                        .content
                                                                        .id,
                                                                  );
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Material(
                                                        elevation: 3,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .white70,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Icon(
                                                              FeatherIcons
                                                                  .thumbsDown),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Material(
                                                        elevation: 3,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(30),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Icon(
                                                            FeatherIcons.zap,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        GlobalMixin()
                                                            .dio()
                                                            .then(
                                                          (dio) {
                                                            dio
                                                                .post(
                                                              "/unmatch-user/${homeViewModel.swipeItems[index].content.id}",
                                                            )
                                                                .then(
                                                              (value) {
                                                                if (value
                                                                        .statusCode ==
                                                                    200) {
                                                                  homeViewModel
                                                                      .match(
                                                                    homeViewModel
                                                                        .swipeItems[
                                                                            index]
                                                                        .content
                                                                        .id,
                                                                  );
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Material(
                                                        elevation: 3,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .white70,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Icon(
                                                              FeatherIcons
                                                                  .thumbsUp),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            },
                            onStackFinished: () {},
                            itemChanged: (SwipeItem item, int index) {
                              print(
                                  "item: ${item.content.text}, index: $index");
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
