import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Constances/all_colors.dart';
import '../Views/Doctor_Choices_View/Doctor_choices_controller/doctor_choices_controller.dart';

Future<int?> showQuantityDialog(String toolName) async {
  final TextEditingController controller = TextEditingController(text: '1');
  int quantity=1 ;

  return await Get.defaultDialog<int?>(
    title: 'Add amount',
    titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    content: Column(
      children: [
        Text('How many  $toolName  which you want'),
        SizedBox(height: 16),
        TextFormField(
          cursorColor: green,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "amount",
            hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
                fontFamily: "Montserrat"
            ),
            //filled: true,
            //fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green),),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: green, width: 2.0),
            ),
          ),
          onChanged: (value) {
            quantity = int.tryParse(value) ?? 1;
          },
        ),
      ],
    ),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: green,
      ),
      onPressed: () {
        Get.back(result: quantity);
      },
      child: Text('Ok', style: TextStyle(color: Colors.white)),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text('Cancel',
      style: TextStyle(
        color:Colors.red,
      ),
      ),
    ),
  ).then((value) => value ?? null);
}
void showAssistantDialog(BuildContext context) {
  final AssistantController controller = Get.put(AssistantController());
  Get.dialog(
    AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        "Select Number of Assistants",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: green,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Choose how many assistants you need (1-5)",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              final number = index + 1;
              return GestureDetector(
                onTap: () => controller.selectAssistants(number),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: controller.tempSelection.value == number
                        ? green
                        : Colors.transparent,
                    border: Border.all(
                      color: green,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '$number',
                      style: TextStyle(
                        color: controller.tempSelection.value == number
                            ? background
                            : green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            }),
          )),
          const SizedBox(height: 20),
          Obx(() => Text(
            controller.tempSelection.value > 0
                ? 'Selected: ${controller.tempSelection.value}'
                : 'Please select a number',
            style: TextStyle(color: green),
          )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.resetSelection();
            Get.back();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: green),
          ),
        ),
        Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: controller.tempSelection.value > 0
              ? () {
            controller.confirmSelection();
            Get.back();
          }
              : null,
          child: Text(
            "Confirm",
            style: TextStyle(color: background),
          ),
        )),
      ],
    ),
  );
}