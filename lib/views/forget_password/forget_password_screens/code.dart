
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Widgets/CustomButton.dart';
import 'package:ouzoun/Widgets/CustomOtp.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../core/constants/app_colors.dart';
import '../forget_password_controller/verfiycodecontroller.dart';

class Code extends StatelessWidget {
  const Code({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQueryHelper(context);
    VerfiyCodeController controller=Get.find();
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:media.height*0.15,horizontal:media.width*0.06),
          child:Container(
            alignment: Alignment.center,
            child: Column(children: [
              Text("Enter Verification Code",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: media.height * 0.02),
              Text("Enter the 5-digit that we have sent via the \nEmail ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: media.height * 0.04),
              CustomOtp(
                  onChanged:(code){
                controller.verifycode=code;
              },
                codenumber: 5,
                  focusedbordercolor: green,
                  cursorcolor: greenlight,
                keybord:TextInputType.number,
              ),
              SizedBox(height: media.height * 0.05),
              CustomButton(
                color:green,
                text:"Confirm",
                onTap:(){
                  controller.goToreset();
                },)
        
            ],),
        
          ),
        ),
      ),
    );
  }
}
