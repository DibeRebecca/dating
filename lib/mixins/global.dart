import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:match_dating/auth/repo/api_status.dart';
import 'package:match_dating/auth/repo/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:match_dating/main.dart';

class GlobalMixin {
  //Dio dio = createDioInstance();
  Future<Dio> dio() async {
    String? tokenContent = await token();
    if (kDebugMode) {
      print(tokenContent);
    }
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://soe-dating.onrender.com/api/",
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenContent',
        },
      ),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('send request url: ${options.baseUrl}${options.path}');
          }

          return handler.next(options);
        },
        onError: ((e, handler) async {
          if (kDebugMode) {
            print("interceptor error handler");
          }
          if (kDebugMode) {
            print(e.toString());
          }

          if(e.response!.statusCode == 400){
            if (kDebugMode) {
              print("interceptor status code 400");
            }
            SharedPreferences sp = await SharedPreferences.getInstance();

            if((sp.getString("userphone") != null && sp.getString("userphone")!.isNotEmpty) && (sp.getString("user_password") != null && sp.getString("user_password")!.isNotEmpty)){
              AuthService authService = AuthService();
              final response = await authService.loginUser({
                "phone": { "e164": sp.getString("userphone") },
                "password": sp.getString("user_password")
              });

              if(response is SuccessLogin){
                _retry(e.requestOptions, dio);
              }
            }
            else{
              navigatorKey.currentState!.pushNamed('/signin');
            }
          }
          else{
            return handler.next(e);
          }
        })
      ),
    );


    return dio;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions, Dio dio) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<String?> token() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString("token");
  }

  String baseUrl({String env = "local"}) {
    return env == "local"
        ? "http://192.168.1.65:9000/api/"
        : "https://easydatechat.herokuapp.com/api/";
  }
}
