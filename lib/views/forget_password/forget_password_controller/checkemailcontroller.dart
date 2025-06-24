import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Routes/app_routes.dart';

class CheckEmailController extends GetxController
{
  late TextEditingController checkemail;
 late GlobalKey<FormState>keyForm;
 void CheckEmail(){

 }
 void GoToVrefiy(){
   Get.toNamed(AppRoutes.code);
 }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkemail=TextEditingController();
    keyForm=GlobalKey<FormState>();
  }
}