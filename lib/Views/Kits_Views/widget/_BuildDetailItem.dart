import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BuildDetailItem(BuildContext context, String title, String value) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontFamily: "Montserrat",
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    ],
  );
}