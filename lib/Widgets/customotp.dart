
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';

import '../Core/Services/mediaQuery.dart';

class Customotp extends StatelessWidget {
   Customotp({super.key, required this.onChanged,required this.codenumber,required this.focusedbordercolor,required this.cursorcolor,required this.keybord});
  Color cursorcolor;
  Color focusedbordercolor;
  int codenumber;
  TextInputType keybord;
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    final media=MediaQueryHelper(context);
    return OtpTextField(
      numberOfFields: codenumber,
      cursorColor:cursorcolor,
      focusedBorderColor:focusedbordercolor,
      keyboardType:keybord,
      autoFocus: true,
      showFieldAsBox: true,
      onCodeChanged:onChanged,
      //runs when every textfield is filled
      /* onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            },*/ // end onSubmit
    );

  }
}
