import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomText.dart';
import '_BuildDetailItem.dart';
import '_ShowQuantityDialog.dart';

Widget BuildToolCard({
  required bool isappear,
  required BuildContext context,
  required String imagePath,
  required String toolName,
  required String length,
  required String width,
  required String thickness,
  required Function(int) onQuantitySelected,
  int? selectedQuantity,
}) {
  final media = MediaQueryHelper(context);
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Card(
    margin: EdgeInsets.symmetric(vertical: media.height * 0.01),
    color: isDarkMode ? Theme.of(context).cardColor : Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(media.width * 0.025),
      side: BorderSide(
        color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
        width: 2,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(media.width * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tool Image
          Container(
            width: media.width * 0.2,
            height: media.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(media.width * 0.02),
              color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: media.width * 0.15,
                height: media.width * 0.15,
                color:  null,
              ),
            ),
          ),
          SizedBox(width: media.width * 0.04),

          // Tool Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  fontFamily: "Montserrat",
                  fontSize: media.width * 0.045,
                  isbold: true,
                  color: isDarkMode ? Colors.white : Colors.black,
                  text: toolName.tr, textAlign: TextAlign.start,
                ),
                SizedBox(height: media.height * 0.01),
                Row(
                  children: [
                    BuildDetailItem(context, "Length", length),
                    SizedBox(width: media.width * 0.04),
                    BuildDetailItem(context, "Width", width),
                    SizedBox(width: media.width * 0.04),
                    BuildDetailItem(context, "Thickness", thickness),
                  ],
                ),
              ],
            ),
          ),

          // Quantity Section
          if(isappear)
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(media.width * 0.02),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: media.width * 0.02,
                  vertical: media.height * 0.005,
                ),
                child: Text(
                  selectedQuantity != null && selectedQuantity > 0
                      ? 'Qty: $selectedQuantity'
                      : 'Add',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.white,
                    fontSize: media.width * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.01),
              GestureDetector(
                onTap: () async {
                  final quantity = await ShowQuantityDialog(toolName);
                  if (quantity != null) {
                    onQuantitySelected(quantity);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: green,
                  ),
                  padding: EdgeInsets.all(media.width * 0.02),
                  child: Icon(
                    selectedQuantity == null || selectedQuantity == 0
                        ? Icons.add
                        : Icons.edit,
                    color: Colors.white,
                    size: media.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}