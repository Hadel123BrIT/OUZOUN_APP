import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/media_query_service.dart';
import 'Widget/loginHelpers.dart';
import 'Widget/buildLoginForm.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? LoginHelpers.buildLoadingIndicator()
        : buildLogin.buildLoginForm(context));
  }

}