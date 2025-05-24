import 'package:get/get.dart';
import 'package:ouzoun/Core/Localization/changlang.dart';
import '../../Views/ForgetPassword_View/ForgetPassword_Controller/checkemailcontroller.dart';
import '../../Views/ForgetPassword_View/ForgetPassword_Controller/resetpagecontroller.dart';
import '../../Views/ForgetPassword_View/ForgetPassword_Controller/verfiycodecontroller.dart';
import '../../Views/Login_View/login_controller.dart';
import '../../Views/Register_View/register_controller.dart';

class InitalizeBindingAuth implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
    Get.put(LoginController());
    Get.put(Checkemailcontroller());
    Get.put(Verfiycodecontroller());
    Get.put(resetpagecontroller());
  }


}