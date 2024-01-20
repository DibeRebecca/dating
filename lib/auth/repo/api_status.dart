class SuccessLogin{
  int code;
  Object response;
  SuccessLogin({required this.code, required this.response});
}

class ErrorLogin{
  int code;
  Object response;
  dynamic trace;
  ErrorLogin({required this.code, required this.response, required this.trace});
}