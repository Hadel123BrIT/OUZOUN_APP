import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../kits/Kits_Controller/kits_controller.dart';

class AddProcedureController extends GetxController {
  final KitsController kitsController = Get.put(KitsController());

  // متغيرات إدخال البيانات
  final patientNameController = TextEditingController();
  final needsAssistance = false.obs;
  final assistantsCount = 1.obs;
  final procedureType = 1.obs;
  final procedureDate = Rx<DateTime?>(null);
  final procedureTime = Rx<TimeOfDay?>(null);

  // اختيار التاريخ
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green[800]!,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green[800]!,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != procedureDate.value) {
      procedureDate.value = picked;
    }
  }

  // اختيار الوقت
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green[800]!,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green[800]!,
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              dialHandColor: Colors.green[800]!,
              dialBackgroundColor: Colors.green[50]!,
              hourMinuteColor: Colors.green[100]!,
              hourMinuteTextColor: Colors.black,
              dayPeriodColor: Colors.green[100]!,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != procedureTime.value) {
      procedureTime.value = picked;
    }
  }

  // إرسال الإجراء
  void submitProcedure() {
    if (patientNameController.text.isEmpty) {
      Get.snackbar('Error', 'Patient name is required');
      return;
    }
    if (procedureDate.value == null || procedureTime.value == null) {
      Get.snackbar('Error', 'Procedure date and time are required');
      return;
    }

    // تحضير البيانات
    final procedureData = {
      'patientName': patientNameController.text,
      'needsAssistance': needsAssistance.value,
      'numberOfAssistants': assistantsCount.value,
      'date': procedureDate.value!.toIso8601String(),
      'time': '${procedureTime.value!.hour}:${procedureTime.value!.minute}',
      'categoryId': procedureType.value,
      ...kitsController.prepareProcedureData(),
    };

    // هنا يمكنك إضافة كود إرسال البيانات إلى الخادم
    print('Submitting procedure data: $procedureData');

    Get.snackbar('Success', 'Procedure added successfully');
    Get.back();
  }

  @override
  void onClose() {
    patientNameController.dispose();
    super.onClose();
  }
}