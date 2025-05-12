import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';

import 'CustomText.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.onTap, required this.text, required this.color,});
  final Function onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height:MediaQuery.of(context).size.height * 0.07 ,
      child: InkWell(
        onTap: (){
          onTap!();
        },
        child:Center(
          child: Customtext
            (
            fontFamily: 'Montserrat',
            fontSize: 20,
            isbold: true,
            color: background,
            text: text,
            textAlign: TextAlign.center,

          ),
        ),
      ),
    );
  }
}
