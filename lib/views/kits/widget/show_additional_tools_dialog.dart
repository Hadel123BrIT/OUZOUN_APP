import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';

void show_additional_tools_dialog(BuildContext context, List<Map<String, dynamic>> surgicalTools, KitsController controller) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final selectedTools = surgicalTools.asMap().entries.where((entry) {
    final index = entry.key;
    return controller.toolQuantities[index] > 0;
  }).toList();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Selected Tools',
          style: TextStyle(
              fontFamily: "Montserrat",
              color: isDarkMode ? Colors.white : Colors.black)),
      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
      content: SizedBox(
        width: double.maxFinite,
        child: selectedTools.isEmpty
            ? Text('No tools selected',
            style: TextStyle(
              fontFamily: "Montserrat",
              color: isDarkMode ? Colors.white : Colors.black,
            ))
            : ListView.builder(
          shrinkWrap: true,
          itemCount: selectedTools.length,
          itemBuilder: (context, index) {
            final tool = selectedTools[index].value;
            final toolIndex = selectedTools[index].key;
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
                          'Qty : ${controller.toolQuantities[toolIndex]}',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : AppColors.primaryGreen,
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