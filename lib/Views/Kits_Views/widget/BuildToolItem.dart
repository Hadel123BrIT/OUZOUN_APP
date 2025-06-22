import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../Core/Constances/all_colors.dart';
import '../Kits_Controller/kits_controller.dart';

Widget BuildToolItem(BuildContext context, String toolName) {
  final controller = Get.put(KitsController());

  return Obx(() {
    bool isChecked = controller.tools[toolName] ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              controller.toggleTool(toolName);
            },
            activeColor: green,
            checkColor: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            toolName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  });
}
