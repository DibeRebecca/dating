import 'package:match_dating/home/models/users.dart';
import 'package:match_dating/models/user_match.dart';

class SuccessGeetingUsersForMatch{
  int code;
  List<UserMatch> usersForMatch;
  SuccessGeetingUsersForMatch({required this.code, required this.usersForMatch});
}

class ErrorGeetingUsersForMatch{
  int code;
  Object errorResponse;
  ErrorGeetingUsersForMatch({required this.code, required this.errorResponse});
}