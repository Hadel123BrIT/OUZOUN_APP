import 'package:flutter/material.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Widgets/CustomText.dart';


  Widget  buildToolCard({required String imagePath,required String toolName}){
   return Card(
     color: background,
     elevation: 3,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10),
       side: BorderSide(
         color: greenlight,
         width: 2.0,
       ),
     ),

     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Image.asset(imagePath,
         height: 80,
           width: 80,
           fit: BoxFit.contain,
         ),
          SizedBox(height: 17),
         Customtext(
             fontFamily: "Montserrat",
             fontSize: 16,
             isbold: true,
             color: Colors.black,
             text: toolName,
             textAlign: TextAlign.center
         )
       ],
     ),
   );
  }
