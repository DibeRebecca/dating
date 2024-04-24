import 'package:flutter/material.dart';
import 'package:match_dating/home/models/users.dart';
import 'package:match_dating/home/repo/api_status.dart';
import 'package:match_dating/home/repo/home_services.dart';
import 'package:match_dating/models/user_match.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeViewModel extends ChangeNotifier {
  List<UserMatch> _users_for_match = [];
  List<Users> _friends = [];
  HomeService homeService = new HomeService();
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  bool _loading = true;
  bool _loadingFriends = false;

  List<UserMatch> get users_for_match => _users_for_match;
  List<Users> get friends => _friends;

  MatchEngine get matchEngine => _matchEngine;

  List<SwipeItem> get swipeItems => _swipeItems;

  bool get loading => _loading;
  bool get loadingFriends => _loadingFriends;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<dynamic> getUsersForMatch() async {
    setLoading(true);
    final response = await this.homeService.getUsersForMatch();

    if (response is SuccessGeetingUsersForMatch) {
      _users_for_match = response.usersForMatch;
      notifyListeners();

      _swipeItems = [];
      for (int i = 0; i < _users_for_match.length; i++) {
        _swipeItems.add(
          SwipeItem(
            content: Content(
                prenom: _users_for_match[i].prenom ?? "",
                nom: _users_for_match[i].nom ?? "",
                avatar: _users_for_match[i].avatar,
              color: Colors.white,
              text: "${_users_for_match[i].prenom} ${_users_for_match[i].nom}"
            ),
            likeAction: () {},
            nopeAction: () {},
            superlikeAction: () {},
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            },
          ),
        );
      }

      _matchEngine = MatchEngine(swipeItems: _swipeItems);
      setLoading(false);
    }
  }

  Future<dynamic> getMyFriends() async {
    final response = await this.homeService.getMyFriends();
    _friends = response;
    notifyListeners();
  }
}

class Content {
  final String prenom;
  final String nom;
  final String? avatar;
  final String text;
  final Color color;

  Content({required this.prenom, required this.nom, required this.text, required this.avatar, required this.color});
}
