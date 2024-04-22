import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match_dating/auth/repo/api_status.dart';
import 'package:match_dating/auth/repo/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_dating/models/user_login_response.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  String _phone_number = "";
  String _password = "";
  String _first_name = "";
  String _last_name = "";
  bool _nextPageLoading = false;
  bool _otp_sending = false;
  UserLoginResponse? _connectedUser;
  late String _otpCode;
  late String _verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthService authService = new AuthService();

  bool get loading => _loading;
  bool get nextPageLoading => _nextPageLoading;
  bool get otp_sending => _otp_sending;
  String get verificationId => _verificationId;
  String get otpCode => _otpCode;
  String get firstname => _first_name;
  String get lastname => _last_name;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phone_number = "+228${phoneNumber}";
    notifyListeners();
  }

  void setFirstName(String firstname) {
    _first_name = firstname;
    notifyListeners();
  }

  void setConnectedUser(UserLoginResponse user) {
    _connectedUser = user;
    notifyListeners();

    setFirstName(_connectedUser?.nom ?? "");
    setLastName(_connectedUser?.prenom ?? "");
  }

  void setLastName(String lastname) {
    _last_name = lastname;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<dynamic> loginUser() async {
    print('Phone number: $_phone_number');
    print('Password: $_password');
    setLoading(true);
    final response = await authService.loginUser({
      "phone": {"e164": _phone_number},
      "password": _password
    });

    if (response is SuccessLogin) {
      setLoading(false);
      Fluttertoast.showToast(
          msg: response.response.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      if (response.data != null) {
        setConnectedUser(response.data!);
      }
    } else {
      setLoading(false);
      Fluttertoast.showToast(
          msg: response.response.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return response;
  }

  void setOtpCode(code) {
    _otpCode = code;
  }

  void setNextPageLoading(bool loading) {
    _nextPageLoading = loading;
    notifyListeners();
  }

  void setOtpSendind(bool bool) {
    _otp_sending = bool;
    notifyListeners();
  }

  void setVerificationId(verificationId) {
    _verificationId = verificationId;
  }

  void gotoOtpPage(BuildContext context) {}

  Future<void> sendOtpMessage(
      {required BuildContext context, bool goToNextScreen = false}) async {
    print("send mes now");
    print(_phone_number);
    try {
      setOtpSendind(true);
      await auth.verifyPhoneNumber(
        phoneNumber: _phone_number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          if (goToNextScreen) {
            gotoOtpPage(context);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          setOtpSendind(false);
          Fluttertoast.showToast(
              msg: "Echec lors de l'envoi du code",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          setNextPageLoading(false);
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) {
          setOtpSendind(false);
          setLoading(false);
          setVerificationId(verificationId);
          Navigator.pushNamed(context, '/verification');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setOtpSendind(false);
          notifyListeners();
        },
      );
    } catch ($e) {
      setOtpSendind(false);
    }
  }
}
