import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:match_dating/endpoints.dart';
import 'package:match_dating/home/models/users.dart';
import 'package:match_dating/home/repo/api_status.dart';
import 'package:match_dating/mixins/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService extends GlobalMixin{


  Future<dynamic> getUsersForMatch() async {
    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.get(
        EndPoints.userForMatch,
      );

      if(response.statusCode == 201 || response.statusCode == 200){
        return SuccessGeetingUsersForMatch(code: 200, usersForMatch: Users.usersFromJson(jsonEncode(response.data)));
      }
      else{
        return ErrorGeetingUsersForMatch(code: 500, errorResponse: "Une erreur s'es produite");
       // return ErrorLogin(code: 500, response: "Une erreur s'est produite", trace: response.data);
      }
    }
    catch(e){
      if(e is DioError){
        print("dio response data");
        print(e.response!.statusCode.toString());
        print(e.response);
        return ErrorGeetingUsersForMatch(code: 500, errorResponse: "Une erreur s'es produite");
      }

      print("not dio error");
      print(e.toString());

      //return ErrorLogin(code: 500, response: "Une erreur s'est produite", trace: e.toString());
    }
  }

  Future<List<Users>> getMyFriends() async {
    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.get(
        EndPoints.myFriends,
      );

      List<Users> friends = Users.usersFromJson(jsonEncode(response.data["users"]));
      print("success getting friends");

      return friends;
    }
    catch(e){
      print("error when getting friends");
      print(e);
      return [];
    }
  }
}