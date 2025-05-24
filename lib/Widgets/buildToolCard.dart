import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/Constances/all_colors.dart';
import 'CustomText.dart';
import 'custom_awesome_dialog.dart';
import '../../Core/Services/mediaQuery.dart';

Widget buildToolCard({
  required BuildContext context,
  required String imagePath,
  required String toolName,
  required Function(int) onQuantitySelected,
  int? selectedQuantity,
}) {
  final media = MediaQueryHelper(context);

  return Card(
    color: background,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(media.width * 0.025), // 10 replaced
      side: BorderSide(color: green, width: media.width * 0.011), // 4.5 replaced
    ),
    child: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  imagePath,
                  height: media.height * 0.1, // 80 replaced
                  width: media.width * 0.2, // 80 replaced
                  fit: BoxFit.contain
              ),
              SizedBox(height: media.height * 0.02), // 17 replaced
              Customtext(
                fontFamily: "Montserrat",
                fontSize: media.width * 0.04, // 16 replaced
                isbold: true,
                color: Colors.black,
                text: toolName.tr,
                textAlign: TextAlign.center,
              ),
              if (selectedQuantity != null)
                Padding(
                  padding: EdgeInsets.only(top: media.height * 0.01), // 8 replaced
                  child: Text(
                    'Qty: $selectedQuantity',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: media.width * 0.035, // Added for consistency
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: media.height * 0.01, // 8 replaced
          right: media.width * 0.02, // 8 replaced
          child: GestureDetector(
            onTap: () async {
              final quantity = await showQuantityDialog(toolName);
              if (quantity != null) {
                onQuantitySelected(quantity);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(media.width * 0.01), // 4 replaced
              child: Icon(
                selectedQuantity == null ? Icons.add : Icons.edit,
                color: Colors.white,
                size: media.width * 0.05, // 20 replaced
              ),
            ),
          ),
        ),
      ],
    ),
  );
}