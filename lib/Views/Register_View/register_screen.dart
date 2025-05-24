import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Views/Register_View/register_controller.dart';
import '../../../Widgets/CustomTextForm.dart';
import '../../../Widgets/logo.dart';
import '../../Routes/AppRoutes.dart' show AppRoutes;
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomText.dart';
import '../Login_View/login_screen.dart';



class RegisterScreen extends StatelessWidget {
  final RegisterController _controller =Get.find();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final media=MediaQueryHelper(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:Obx(() => _controller.isLoading.value
            ?  Center(child: Lottie.asset(
            'assets/animations/Animation - 1740348375718.json',
            fit: BoxFit.cover,
            repeat: true,
            height: 150,
            width: 150
        ))
            : Container(
          padding: EdgeInsets.symmetric(horizontal: media.width * 0.04,vertical: media.width * 0.03),
          child: ListView(
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: media.height * 0.04),
                    Text("Sign Up".tr, textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: media.height * 0.04),
                    Text("Sign in to your account and then continue using this app".tr, textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: media.height * 0.04),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Name must not be empty".tr;
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your Name".tr,
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "location must not be empty".tr;
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your Location".tr,
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email must not be empty".tr;
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your phone".tr,
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
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
                      onTap: () => {
                        Get.toNamed(AppRoutes.chekEmail),
                      },
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
                    SizedBox(height: media.height * 0.02),
                    Custombutton(
                      onTap: (){
                      Get.toNamed(AppRoutes.firstchoice);
                      },
                      text: 'Sign Up'.tr, color: green,

                    ),
                    SizedBox(height: media.height * 0.05),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(text: "you have an account ? ".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: media.width * 0.04,
                                  fontFamily: "Montserrat",
                                )
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