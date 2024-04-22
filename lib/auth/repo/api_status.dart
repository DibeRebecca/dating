import 'package:match_dating/models/user_login_response.dart';

class SuccessLogin{
  int code;
  Object response;
  UserLoginResponse? data;
  SuccessLogin({required this.code, required this.response, this.data});
}

class ErrorLogin{
  int code;
  Object response;
  dynamic trace;
  ErrorLogin({required this.code, required this.response, required this.trace});
}