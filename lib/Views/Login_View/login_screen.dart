import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'Widget/LoginHelpers.dart';
import 'Widget/_buildLoginForm.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  LoginScreen({super.key});

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
        ? LoginHelpers.buildLoadingIndicator()
        : buildLogin.buildLoginForm(context, media));
  }

}