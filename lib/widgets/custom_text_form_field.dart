import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.myController,
        required this.hintText,
        required this.validator,
        required bool obscureText,
        this.suffixIcon,
        this.prefixIcon,
      });
  final TextEditingController myController;
  final String hintText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
   final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryGreen,
      validator: validator,
      controller: myController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[500],
          fontFamily: "Montserrat"
        ),
        //filled: true,
        //fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primaryGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primaryGreen, width: 2.0),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
