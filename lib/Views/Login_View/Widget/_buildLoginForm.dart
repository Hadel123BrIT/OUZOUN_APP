import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Core/Services/mediaQuery.dart';
import '../login_controller.dart';
import 'LoginHelpers.dart';

class buildLogin{
  static Widget buildLoginForm(BuildContext context, MediaQueryHelper media) {
    final LoginController _controller = Get.put(LoginController());
    return Container(
      padding: EdgeInsets.all(media.width * 0.05),
      child: ListView(
        children: [
          Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginHelpers.buildHeader(context, media),
                LoginHelpers.buildEmailField(media, _controller.emailController),
                SizedBox(height: media.height * 0.05),
                LoginHelpers.buildPasswordField(media, _controller.passwordController),
                LoginHelpers.buildForgotPasswordLink(media),
                SizedBox(height: media.height * 0.08),
                LoginHelpers.buildLoginButton(),
                SizedBox(height: media.height * 0.15),
                LoginHelpers.buildRegisterLink(context, media),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
