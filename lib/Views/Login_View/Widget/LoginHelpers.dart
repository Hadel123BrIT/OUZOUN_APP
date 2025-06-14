// utils/login_helpers.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Widgets/CustomButton.dart';
import 'package:ouzoun/Widgets/CustomTextForm.dart';
import 'package:ouzoun/Views/Register_View/register_screen.dart';

class LoginHelpers {
  static Widget buildLoadingIndicator() {
    return Center(
      child: Lottie.asset(
        'assets/animations/Animation - 1740348375718.json',
        fit: BoxFit.cover,
        repeat: true,
        height: 150,
        width: 150,
      ),
    );
  }

  static Widget buildHeader(BuildContext context, MediaQueryHelper media) {
    return Column(
      children: [
        SizedBox(height: media.height * 0.06),
        Text(
          "Log in".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: media.height * 0.04),
        Text(
          "Log in to your account\n and then continue using this app".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: media.height * 0.08),
      ],
    );
  }

  static Widget buildEmailField(
      MediaQueryHelper media, TextEditingController controller) {
    return CustomTextForm(
      prefixIcon: Icon(Icons.email,
          color: Colors.grey[500]
      ),
      validator: (val) => val?.isEmpty ?? true ? "Email must not be empty".tr : null,
      mycontroller: controller,
      hinttext: "Enter your Email".tr,
      obscureText: false,
    );
  }

  static Widget buildPasswordField(
      MediaQueryHelper media, TextEditingController controller) {
    return CustomTextForm(
      prefixIcon: Icon(Icons.lock,
          color: Colors.grey[500]
      ),
      suffixIcon: Icon(
        Icons.remove_red_eye_outlined,
        color: Colors.grey[500],
      ),
      validator: (val) => val?.isEmpty ?? true ? "Password must not be empty".tr : null,
      obscureText: true,
      mycontroller: controller,
      hinttext: 'Enter Your Password'.tr,
    );
  }

  static Widget buildForgotPasswordLink(MediaQueryHelper media) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.chekEmail),
      child: Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(
          top: media.height * 0.01,
          bottom: media.height * 0.02,
        ),
        child: Text(
          "Forgot Password ?".tr,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: media.width * 0.03,
            color: green,
          ),
        ),
      ),
    );
  }

  static Widget buildLoginButton() {
    return Custombutton(
      onTap: () => Get.toNamed(AppRoutes.firstchoice),
      text: 'Login'.tr,
      color: green,
    );
  }

  static Widget buildRegisterLink(BuildContext context, MediaQueryHelper media) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => Get.to(() => RegisterScreen()),
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Don't have an account ? ".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: media.width * 0.04,
                fontFamily: "Montserrat",
              ),
            ),
            TextSpan(
              text: "Register".tr,
              style: TextStyle(
                color: green,
                fontWeight: FontWeight.bold,
                fontSize: media.width * 0.04,
                fontFamily: "Montserrat",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}