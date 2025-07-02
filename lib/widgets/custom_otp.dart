
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../Core/Services/media_query_service.dart';

class CustomOtp extends StatelessWidget {
  CustomOtp({super.key, required this.onChanged,required this.codeNumber,required this.focusedBorderColor,required this.cursorColor,required this.keyBoard});
  Color cursorColor;
  Color focusedBorderColor;
  int codeNumber;
  TextInputType keyBoard;
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: codeNumber,
      cursorColor:cursorColor,
      focusedBorderColor:focusedBorderColor,
      keyboardType:keyBoard,
      autoFocus: true,
      showFieldAsBox: true,
      onCodeChanged:onChanged,

    );

  }
}
