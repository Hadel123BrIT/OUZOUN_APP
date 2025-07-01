import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Core/Services/media_query_service.dart';
import '../login_controller.dart';
import 'loginHelpers.dart';

class buildLogin{
  static Widget buildLoginForm(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Container(
      padding: EdgeInsets.all(context.width * 0.05),
      child: ListView(
        children: [
          Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginHelpers.buildHeader(context),
                LoginHelpers.buildEmailField( controller.emailController),
                SizedBox(height: context.height * 0.05),
                LoginHelpers.buildPasswordField( controller.passwordController),
                LoginHelpers.buildForgotPasswordLink(context),
                SizedBox(height: context.height * 0.08),
                LoginHelpers.buildLoginButton(controller),
                SizedBox(height: context.height * 0.15),
                LoginHelpers.buildRegisterLink(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
