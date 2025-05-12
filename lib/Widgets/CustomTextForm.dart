import 'package:flutter/material.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';

class CustomTextForm extends StatelessWidget {
   CustomTextForm(
      {super.key, required this.mycontroller,
        required this.hinttext,
        required this.validator,
        required bool obscureText,
        this.suffixIcon,
      });
  final TextEditingController mycontroller;
  final String hinttext;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: green,
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hinttext,
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
          borderSide: BorderSide(color: green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: green, width: 2.0),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
