

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Views/ForgetPassword/checkemailcontroller.dart';

import '../../Core/Constances/all_colors.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextForm.dart';

class Chekemail extends StatelessWidget {
  const Chekemail({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQueryHelper(context);
    Checkemailcontroller controller=Get.find();
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background ,
      body:SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical:media.height*0.15,horizontal:media.width*0.06),
            child:Container(
              width:media.width,
              height:media.height,
              alignment: Alignment.center,
              child: Column(children: [
                Icon(FontAwesomeIcons.envelopeCircleCheck,color:green, size: media.width * 0.2,),
                SizedBox(height: media.height * 0.03),
                Text("Forget Password?",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: media.height * 0.02),
                Text("Please Enter your email to check\nif it is available ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: media.height * 0.05),
                CustomTextForm(
                  hinttext:"Enter your Email",
                  suffixIcon:Icon(Icons.email_outlined),
                  obscureText:false,
                  mycontroller:controller.checkemail,
                  validator:(val) {
                    if (val == null || val.isEmpty) {
                      return "Email must not be empty".tr;
                    }
                    return null;
                  },
                  key:controller.keyForm,
                ),
                SizedBox(height: media.height * 0.05),
                Custombutton(
                  color:green,
                  text:"Save",
                  onTap:(){
                  controller.GoToVrefiy();
                },)
        
              ],),
        
        ),
        ),
      ),
    );
  }
}
