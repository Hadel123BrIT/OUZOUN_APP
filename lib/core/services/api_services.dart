import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as dio;

class ApiServices  {
final Dio dio=Dio();
static const String baseUrl="{{baseUrl}}/api/";

// RegisterUser
 Future<Response> registerUser(
{required String userName,required String email,required String phoneNumber,required String password,required double longitude,required double latitude,}) async {
try{
  final response=await dio.post("$baseUrl/User/RegisterUser",
    data:{
      "userName":userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'longtitude': longitude,
      'latitude': latitude,
    },
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  return response;
}
on DioException catch (e) {
  if (e.response != null) {
    return e.response!;
  } else {
    throw Exception('Failed to connect to the server: ${e.message}');
  }
}
}

//LoginUser
Future<Response> loginUser({required String email,required String password}) async {
  try{
    final response=await dio.post("$baseUrl/User/LoginUser",
    data: {
        'email': email,
        'password': password,
        },
      options: Options(
      headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      },
    ),
    );
    return response;
  }
  on DioException catch(e){
    if (e.response != null) {
      return e.response!;
    } else {
      throw Exception('Failed to connect to the server: ${e.message}');
    }
  }
}



}