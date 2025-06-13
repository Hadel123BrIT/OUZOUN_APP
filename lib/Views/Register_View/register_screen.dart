import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Views/Register_View/register_controller.dart';
import 'package:ouzoun/Views/Login_View/login_screen.dart';

import 'Widget/LocationPicker/LocationPicker .dart';
import 'Widget/RegisterHelpers .dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context, media),
    );
  }

  Widget _buildBody(BuildContext context, MediaQueryHelper media) {
    return Obx(() => _controller.isLoading.value
        ? RegisterHelpers.buildLoadingIndicator()
        : _buildRegisterForm(context, media));
  }

  Widget _buildRegisterForm(BuildContext context, MediaQueryHelper media) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: media.width * 0.04,
        vertical: media.width * 0.03,
      ),
      child: ListView(
        children: [
          Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RegisterHelpers.buildHeader(context, media),
                RegisterHelpers.buildNameField(media, _controller.nameController),
                SizedBox(height: media.height * 0.05),
                RegisterHelpers.buildLocationField(media, _controller),
                SizedBox(height: media.height * 0.05),
                RegisterHelpers.buildPhoneField(media, _controller.phoneController),
                SizedBox(height: media.height * 0.05),
                RegisterHelpers.buildEmailField(media, _controller.emailController),
                SizedBox(height: media.height * 0.05),
                RegisterHelpers.buildPasswordField(media, _controller.passwordController),
                RegisterHelpers.buildForgotPasswordLink(media),
                SizedBox(height: media.height * 0.02),
                RegisterHelpers.buildSignUpButton(),
                SizedBox(height: media.height * 0.05),
                RegisterHelpers.buildLoginLink(context, media),
              ],
            ),
          ),
        ],
      ),
    );
  }
}