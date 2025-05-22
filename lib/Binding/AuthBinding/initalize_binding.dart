import 'package:get/get.dart';
import 'package:ouzoun/Core/Localization/changlang.dart';
import 'package:ouzoun/Views/ForgetPassword/checkemailcontroller.dart';
import 'package:ouzoun/Views/ForgetPassword/resetpagecontroller.dart';

import '../../Views/ForgetPassword/resetpasswordpage.dart';
import '../../Views/ForgetPassword/verfiycodecontroller.dart';
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