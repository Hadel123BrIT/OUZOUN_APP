import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import '../../Routes/AppRoutes.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomTextForm.dart';
import '../../Widgets/logo.dart';
import '../Doctor_Choices/Doctor_choices_screens/first_page_choices.dart';
import '../Register_View/register_screen.dart';
import 'login_controller.dart';


class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(() => _controller.isLoading.value
          ?  Center(child: Lottie.asset(
          'assets/animations/Animation - 1740348375718.json',
          fit: BoxFit.cover,
          repeat: true,
          height: 150,
          width: 150
      ))
          : Container(
        padding: EdgeInsets.all(media.width * 0.05),
        child: ListView(
          children: [
            Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: media.height * 0.06),
                  Text("Log in".tr, textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: media.height * 0.04),
                  Text("Log in to your account\n and then continue using this app".tr, textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
                   SizedBox(height: media.height * 0.08),
                  CustomTextForm(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Email must not be empty".tr;
                      }
                      return null;
                    },
                    mycontroller: _controller.emailController,
                    hinttext: "Enter your Email".tr,
                    obscureText: false,
                  ),
                  SizedBox(height: media.height * 0.05),
                  CustomTextForm(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,
                    color: Colors.grey[500],
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Password must not be empty".tr;
                      }
                      return null;
                    },
                    obscureText: true,
                    mycontroller: _controller.passwordController,
                    hinttext: 'Enter Your Password'.tr,
                  ),
                  SizedBox(height: media.height * 0.01),
                  InkWell(
                    onTap: () => {},
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
                          color: green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: media.height * 0.08),
                  Custombutton(
                    onTap: (){
                      Get.toNamed(AppRoutes.firstchoice);
                    },
                    text: 'Login'.tr, color: green,

                  ),
                  SizedBox(height: media.height * 0.15),
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Don't have an account ? ".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: media.width * 0.04,
                                fontFamily: "Montserrat",
                              )
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
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}