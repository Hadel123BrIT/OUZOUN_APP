import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';

void showImplantDialog(BuildContext context) {
  final controller = Get.find<KitsController>();
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  Get.dialog(
      AlertDialog(
          title: Text("Your Cart",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen
              )),
          content: Obx(() {
            if (controller.selectedImplants.isEmpty) {
              return Center(
                child: Text("Your cart is empty",
                    style: TextStyle(fontSize: 16)),
              );
            }
            return SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: controller.selectedImplants.entries.map((entry) {
                  final implant = entry.value;
                  final implantId = entry.key;
                  final tools = controller.selectedToolsForImplants[implantId] ?? [];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      title: Text(implant['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          )),
                      leading: Icon(Icons.medication, color: AppColors.primaryGreen),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        if (tools.isEmpty)
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("No tools selected",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic
                                )),
                          )
                        else
                          ...tools.map((tool) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              dense: true,
                              leading: Icon(Icons.check_circle_outline,
                                  color: AppColors.primaryGreen),
                              title: Text(tool),
                              visualDensity: VisualDensity.compact,
                            ),
                          )).toList(),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }),
          actions: [
          TextButton(
          onPressed: () => Get.back(),
  child: Text("CONTINUE SHOPPING",
  style: TextStyle(color: Colors.grey.shade600)),

  ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout
                Get.back();
                Get.snackbar(
                  "Order Submitted",
                  "Your implants and tools have been ordered",
                  backgroundColor: AppColors.primaryGreen,
                  colorText: Colors.white,
                );
              },
              child: Text("CHECKOUT"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

          ],
  ),
  );
}