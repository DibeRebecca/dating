import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:match_dating/endpoints.dart';
import 'package:match_dating/home/models/users.dart';
import 'package:match_dating/mixins/global.dart';

class CrushesService extends GlobalMixin{

  Future<List<Users>> getMyCrushes() async{

    try{
      Dio dio_instance = await dio();
      final response = await dio_instance.get(
        EndPoints.myCrushes,
      );

      List<Users> crushes = Users.usersFromJson(jsonEncode(response.data["my_crushes"]));
      print("success getting friends");

      return crushes;
    }
    catch(e){
      print("error when getting friends");
      print(e);
      return [];
    }
  }
}