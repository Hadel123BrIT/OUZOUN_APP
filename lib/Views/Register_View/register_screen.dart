import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Views/Register_View/register_controller.dart';
import '../../../Widgets/CustomTextForm.dart';
import '../../../Widgets/logo.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomText.dart';
import '../Doctor_Choices/doctor_choices_screen.dart';
import '../Login_View/login_screen.dart';



class RegisterScreen extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final media=MediaQueryHelper(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor:  background,
        body:Obx(() => _controller.isLoading.value
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
                    SizedBox(height: media.height * 0.04),
                    Customtext(
                      textAlign: TextAlign.center,
                      fontFamily: 'Ubuntu',
                      fontSize:media.isPortrait
                          ? media.width * 0.09
                          : media.height * 0.09,
                      isbold: true,
                      color: Colors.black87,
                      text: "Sign Up",
                    ),
                    SizedBox(height: media.height * 0.04),
                    Customtext(
                      textAlign: TextAlign.center,
                      fontFamily: 'Montserrat',
                      fontSize:media.isPortrait
                          ? media.width * 0.04
                          : media.height * 0.04,
                      isbold: false,
                      color: Colors.black,
                      text: "Sign in to your account and then continue using this app",
                      max: 2,
                    ),
                    SizedBox(height: media.height * 0.04),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your Name",
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your phone",
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                      mycontroller: _controller.emailController,
                      hinttext: "Enter your Email",
                      obscureText: false,
                    ),
                    SizedBox(height: media.height * 0.05),
                    CustomTextForm(
                      suffixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: Colors.grey[500],
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password must not be empty";
                        }
                        return null;
                      },
                      obscureText: true,
                      mycontroller: _controller.passwordController,
                      hinttext: 'Enter Your Password',
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
                          "Forgot Password ?",
                          style: TextStyle(
                              fontSize: media.width * 0.04,
                              color: green
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: media.height * 0.02),
                    Custombutton(
                      onTap: (){
                        Get.to(DoctorChoicesScreen());
                      },
                      text: 'Sign Up', color: green,

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
                            TextSpan(text: "you have an account ? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: media.width * 0.04,
                                  fontFamily: "Montserrat",
                                )
                            ),
                            TextSpan(
                              text: "Login",
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