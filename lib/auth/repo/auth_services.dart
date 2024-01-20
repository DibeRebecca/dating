import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:match_dating/auth/repo/api_status.dart';
import 'package:match_dating/endpoints.dart';
import 'package:match_dating/mixins/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GlobalMixin {
  Future<dynamic> loginUser(dynamic data) async {
    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.post(
        EndPoints.login,
        data: data,
      );

      if(response.statusCode == 201 || response.statusCode == 200){
        print("success response");
        print(data["phone"]["e164"]);
        print(data["password"]);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool("is_logged_in", true);
        sharedPreferences.setString("token", response.data["body"]["accessToken"]);
        sharedPreferences.setString("refresh_token", response.data["body"]["refreshToken"]);
        sharedPreferences.setString("userphone", data["phone"]["e164"]);
        sharedPreferences.setString("user_password", data["password"]);

        return SuccessLogin(code: 200, response: "compte créé avec succès");
      }
      else{
        return ErrorLogin(code: 500, response: "Une erreur s'est produite", trace: response.data);
      }
    }
    catch(e){
      if(e is DioError){
        print("dio response data");
        print(e.response);
        return ErrorLogin(code: 500, response: e.response!.data["message"], trace: e.response);
      }

      print("not dio error");
      print(e.toString());

      return ErrorLogin(code: 500, response: "Une erreur s'est produite", trace: e.toString());
    }

  }
}
