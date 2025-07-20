import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/media_query_service.dart';
import 'package:ouzoun/views/register/register_controller.dart';
import 'Widget/LocationPicker/locationPicker .dart';
import 'Widget/registerHelpers .dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() =>
        _buildRegisterForm(context));
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
        vertical: context.width * 0.03,
      ),
      child: ListView(
        children: [
          Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RegisterHelpers.buildHeader(context),
                RegisterHelpers.buildNameField(controller.nameController),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildClinicField(controller.clinicNameController),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildAddressField(controller.addressController),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildLocationField(controller),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildPhoneField(controller.phoneController),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildEmailField(controller.emailController),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildPasswordField(controller.passwordController),
                RegisterHelpers.buildForgotPasswordLink(context),
                SizedBox(height: context.height * 0.02),
                RegisterHelpers.buildSignUpButton(controller),
                SizedBox(height: context.height * 0.03),
                RegisterHelpers.buildLoginLink(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}