import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/app_colors.dart';
import '../procedure_controller/procedure_controller.dart';

Future<void> showPaginationDialog(BuildContext context) async {
  final controller = Get.put(ProcedureController());
  final pageNumberController = TextEditingController(
      text: controller.currentPage.value.toString()
  );
  final pageSizeController = TextEditingController(
      text: controller.itemsPerPage.value.toString()
  );
  await Get.dialog(
    AlertDialog(
      title: Text('إعدادات التقسيم'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: pageNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'رقم الصفحة',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: pageSizeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'عدد العناصر في الصفحة',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            final pageNum = int.tryParse(pageNumberController.text) ?? 1;
            final pageSize = int.tryParse(pageSizeController.text) ?? 3;

            if (pageSize > 0 && pageNum > 0) {
              controller.itemsPerPage.value = pageSize;
              controller.currentPage.value = pageNum;
              controller.fetchProceduresPaged();
              Get.back();
            } else {
              Get.snackbar('خطأ', 'الرجاء إدخال أرقام صحيحة');
            }
          },
          child: Text('تطبيق'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}