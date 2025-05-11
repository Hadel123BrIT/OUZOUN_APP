
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class RegisterController extends GetxController {


  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;


}