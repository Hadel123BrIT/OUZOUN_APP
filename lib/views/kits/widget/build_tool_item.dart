import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';

Widget BuildToolItem(BuildContext context, String toolName, String implantId) {
  final controller = Get.find<KitsController>();

  return Obx(() {
    bool isChecked = controller.isToolSelectedForImplant(implantId, toolName);

    return ListTile(
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          controller.toggleToolForImplant(implantId, toolName);
        },
        activeColor: AppColors.primaryGreen,
      ),
      title: Text(toolName),
    );
  });
}