import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

void showSurgicalToolsDialog(BuildContext context, List<Map<String, dynamic>> surgicalTools) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Mandatory Tools',
          style: TextStyle(
              fontFamily: "Montserrat",
              color: isDarkMode ? Colors.white : Colors.black)),
      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: surgicalTools.length,
          itemBuilder: (context, index) {
            final tool = surgicalTools[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    tool['image'],
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tool['name'],
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          ' ${tool['quantity']}',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color:isDarkMode?Colors.white: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close',
              style: TextStyle(
                fontFamily: "Montserrat",
                color: AppColors.primaryGreen,
              )),
        ),
      ],
    ),
  );
}