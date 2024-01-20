import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitViewModel extends ChangeNotifier{

  void setFirstTimeOpenAppFalse() async {
    print("set first time");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool("first_open", false);
  }

  Future<bool?> isFirstTimeOpenApp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool("first_open");
  }
}