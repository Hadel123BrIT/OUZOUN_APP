import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as dio;
import 'package:ouzoun/models/procedure_model.dart';

import '../../Routes/app_routes.dart';

class ApiServices  {
final Dio dio=Dio();
static const String baseUrl="https://9774ad506712.ngrok-free.app/api";

// RegisterUser
  Future<Response> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
    required String clinicName,
    required String address,
    required double longitude,
    required double latitude,
    String role = 'User',
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/users/register",
        data: {
          "userName": userName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'clinicName': clinicName,
          'address': address,
          "longtitude": longitude,
          'latitude': latitude,
          "role": role,
        },
        options: Options(
          receiveTimeout: Duration(seconds: 30),
          sendTimeout: Duration(seconds: 30),
        ),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");
      return response;
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      print("Dio Error Type: ${e.type}");
      if (e.response != null) {
        print("Error Response Data: ${e.response?.data}");
        print("Error Status Code: ${e.response?.statusCode}");
        return e.response!;
      }
      throw Exception('Failed to connect to the server: ${e.message}');
    } catch (e) {
      print("General Error: $e");
      throw Exception('An unexpected error occurred: $e');
    }
  }


  //LoginUser
  Future<Response> loginUser({required String email,required String password}) async {
  try{
    final response=await dio.post("$baseUrl/users/login",
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
    print("--------------------------------login");
    print(response.data);
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


  //add procedure
  Future<Response> addProcedure(
      Map<String, dynamic> procedureData, {
        String? token,
      }) async {
    try {
      // إنشاء headers مع التوكن إذا كان موجوداً
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.post(
        "$baseUrl/Procedures",
        data: procedureData,
        options: Options(headers: headers),
      );

      print(response.statusCode);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        throw Exception('Failed to connect to the server: ${e.message}');
      }
    }
  }



  //fetchAllProcedures
  Future<List<Procedure>> getAllProcedures() async {
    try {
      final box = GetStorage();
      final token = box.read('--------------------------user_token');

      if (token == null) {
        throw Exception('No authentication token found');
      }

      final response = await dio.get(
        '$baseUrl/Procedures/GetAllProcedures',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200  || response.statusCode == 201) {
        return List<Procedure>.from(
            response.data.map((x) => Procedure.fromJson(x)));
      } else {
        throw Exception('Failed to load procedures with status ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        Get.offAllNamed(AppRoutes.login);
        throw Exception('Session expired, please login again');
      }
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }


  // fetch one procedure
  Future<Procedure> getProcedureDetails(int procedureId) async {
    try {
      final box = GetStorage();
      final token = box.read('--------------------------user_token');

      if (token == null) {
        throw Exception('No authentication token found');
      }

      final response = await dio.get(
        '$baseUrl/api/Procedures/GetProcedure/$procedureId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Procedure.fromJson(response.data);
      } else {
        throw Exception('Failed to load procedure details');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        Get.offAllNamed(AppRoutes.login);
        throw Exception('Session expired, please login again');
      }
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

}