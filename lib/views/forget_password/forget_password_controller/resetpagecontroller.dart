import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPageController extends GetxController{
  late TextEditingController resetPassword;
  late TextEditingController confirmresetPassword;
  late  GlobalKey<FormState>key;
  void Sucesspage(){

  }
  void goToChoosingpage(){

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    resetPassword=TextEditingController();
    confirmresetPassword=TextEditingController();
    key=GlobalKey<FormState>();
  }
}