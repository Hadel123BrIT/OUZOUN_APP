import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ouzoun/core/services/api_services.dart';

import '../../Routes/app_routes.dart';

class LoginController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  ApiServices apiServices=ApiServices();

Future<void> login()async {
  if(formKey.currentState!.validate()){
    isLoading(true);
    try{
      final response=await apiServices.loginUser(
          email: emailController.text,
          password: passwordController.text,
      );
      if(response.statusCode==200|| response.statusCode==201){
        Get.snackbar('Success', 'Login successful');
        Get.offAllNamed(AppRoutes.firstchoice);
      }
    }
    catch(e){
      Get.snackbar('Error', 'An error occurred: $e');
    }
    finally {
      isLoading(false);
    }

  }
  else {
    Get.snackbar('Error', 'Please fill all fields ');
  }
}
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}