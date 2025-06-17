// utils/register_helpers.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Views/Login_View/login_screen.dart';
import 'package:ouzoun/Widgets/CustomButton.dart';
import 'package:ouzoun/Widgets/CustomTextForm.dart';
import '../register_controller.dart';
import 'LocationPicker/LocationPicker .dart';

class RegisterHelpers {
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
        SizedBox(height: media.height * 0.04),
        Text(
          "Sign Up".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: media.height * 0.04),
        Text(
          "Sign in to your account and then continue using this app".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: media.height * 0.04),
      ],
    );
  }

  static Widget buildNameField(MediaQueryHelper media, TextEditingController controller) {
    return CustomTextForm(
      prefixIcon: Icon(Icons.person,
          color: Colors.grey[500]
      ),
      validator: (val) => val?.isEmpty ?? true ? "Name must not be empty".tr : null,
      mycontroller: controller,
      hinttext: "Enter your Name".tr,
      obscureText: false,
    );
  }

  static Widget buildLocationField(MediaQueryHelper media, RegisterController controller,) {
    return InkWell(
      onTap: () async {
        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        try {
          await Get.to(() => LocationPicker(
            onLocationSelected: (coords, address) {
              controller.updateLocation(coords, address);
            },
            useOSM: true,
          ));

          if (Get.isDialogOpen!) Get.back();
        } catch (e) {
          if (Get.isDialogOpen!) Get.back();
          Get.snackbar(
            'Error'.tr,
            'Failed to load map: ${e.toString()}'.tr,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      child: IgnorePointer(
        child: CustomTextForm(
          prefixIcon: Icon(Icons.location_on, color: Colors.grey[500]),
          validator: (val) => val?.isEmpty ?? true ? "Location must not be empty".tr : null,
          mycontroller: controller.locationController,
          hinttext: controller.selectedLocation.value == null
              ? "Tap to select location".tr
              : "Location selected. Tap to change".tr,
          obscureText: false,

          suffixIcon: controller.selectedLocation.value != null
              ? Icon(Icons.check_circle, color: Colors.green)
              : null,
        ),
      ),
    );
  }

  static Widget buildPhoneField(MediaQueryHelper media, TextEditingController controller) {
    return CustomTextForm(
      prefixIcon: Icon(Icons.phone,
          color: Colors.grey[500]
      ),
      validator: (val) => val?.isEmpty ?? true ? "Phone must not be empty".tr : null,
      mycontroller: controller,
      hinttext: "Enter your phone".tr,
      obscureText: false,
    );
  }

  static Widget buildEmailField(MediaQueryHelper media, TextEditingController controller) {
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

  static Widget buildPasswordField(MediaQueryHelper media, TextEditingController controller) {
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

  static Widget buildSignUpButton() {
    return Custombutton(
      onTap: () => Get.toNamed(AppRoutes.firstchoice),
      text: 'Sign Up'.tr,
      color: green,
    );
  }

  static Widget buildLoginLink(BuildContext context, MediaQueryHelper media) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => Get.to(() => LoginScreen()),
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "you have an account ? ".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: media.width * 0.04,
                fontFamily: "Montserrat",
              ),
            ),
            TextSpan(
              text: "Login".tr,
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