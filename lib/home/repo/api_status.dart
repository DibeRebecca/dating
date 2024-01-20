import 'package:match_dating/home/models/users.dart';

class SuccessGeetingUsersForMatch{
  int code;
  List<Users> usersForMatch;
  SuccessGeetingUsersForMatch({required this.code, required this.usersForMatch});
}

class ErrorGeetingUsersForMatch{
  int code;
  Object errorResponse;
  ErrorGeetingUsersForMatch({required this.code, required this.errorResponse});
}