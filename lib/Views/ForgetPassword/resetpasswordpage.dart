

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Views/ForgetPassword/resetpagecontroller.dart';

import '../../Core/Constances/all_colors.dart';
import '../../Core/Services/mediaQuery.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextForm.dart';

class Resetpasswordpage extends StatelessWidget {
  const Resetpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQueryHelper(context);
    resetpagecontroller controller=Get.find();
    return  Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background ,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:media.height*0.15,horizontal:media.width*0.06),
          child:Container(
            alignment: Alignment.center,
            child: Column(children: [
              Icon(FontAwesomeIcons.key,color:green, size: media.width * 0.2,),
              SizedBox(height: media.height * 0.03),
              Text("Reset Password",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: media.height * 0.02),
              Text("Please Reset your Password to Access\nOuzoun App ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: media.height * 0.05),
              CustomTextForm(
                hinttext:"Enter your Password",
                suffixIcon:Icon(Icons.lock_outline),
                obscureText:false,
                mycontroller:controller.resetPassword,
                validator:(val) {
                  if (val == null || val.isEmpty) {
                    return "password must not be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: media.height * 0.05),
              CustomTextForm(
                hinttext:"confirm your Password",
                suffixIcon:Icon(Icons.lock_open),
                obscureText:false,
                mycontroller:controller.confirmresetPassword,
                validator:(val) {
                  if (val == null || val.isEmpty) {
                    return "confirm password must not be empty";
                  }
                  return null;
                },

              ),
              SizedBox(height: media.height * 0.05),
              Custombutton(
                color:green,
                text:"done",
                onTap:(){
              //    controller.GoToVrefiy();
                },)

            ],),

          ),
        ),
      ),
    );
  }
}
