import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';

class AddProcedureController extends GetxController {
  final patientNameController = TextEditingController();
  var needsAssistance = false.obs;
  var assistantsCount = 1.obs;
  var procedureType = 1.obs;
  var procedureDate = Rx<DateTime?>(null);
  var procedureTime = Rx<TimeOfDay?>(null);


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

  void submitProcedure() {
    if (patientNameController.text.isEmpty) {
      Get.snackbar('Error', 'Patient name is required');
      return;
    }
    if (procedureDate.value == null || procedureTime.value == null) {
      Get.snackbar('Error', 'Procedure date and time are required');
      return;
    }
    Get.snackbar('Success', 'Procedure added successfully');
    Get.back();
  }

  @override
  void onClose() {
    patientNameController.dispose();
    super.onClose();
  }
}