import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Routes/app_routes.dart';
import '../../../Widgets/custom_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../kits/kits_screens/surgical_kits.dart';
import '../procedure_controller/procedure_controller.dart';
import '../../kits/Kits_Controller/kits_controller.dart';

Widget buildPatientNameField(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final borderColor = isDark ? Colors.white : Colors.grey;
  final controller = Get.put(AddProcedureController());
  return TextField(
    cursorColor: Colors.grey,
    controller: controller.patientNameController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 2.0),
      ),
      hintText: 'Patient Name',
      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isDark ? Colors.white70 : Colors.black54,
      ),
    ),
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: isDark ? Colors.white : Colors.black,
    ),
  );
}

Widget buildNeedsAssistanceDropdown(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final borderColor = isDark ? Colors.white : Colors.grey;
  final controller = Get.put(AddProcedureController());
  return Obx(() => DropdownButtonFormField<bool>(
    items: [
      DropdownMenuItem(
        value: true,
        child: Text('Yes', style: Theme.of(context).textTheme.headlineSmall),
      ),
      DropdownMenuItem(
        value: false,
        child: Text('No', style: Theme.of(context).textTheme.headlineSmall),
      ),
    ],
    onChanged: (value) => controller.needsAssistance.value = value!,
    value: controller.needsAssistance.value,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 2.0),
      ),
      labelText: 'Needed Assistance',
      labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isDark ? Colors.white70 : Colors.black54,
      ),
    ),));
}

Widget buildAssistantsCountDropdown(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final borderColor = isDark ? Colors.white : Colors.grey;
  final controller = Get.put(AddProcedureController());
  return Obx(() => controller.needsAssistance.value
      ? DropdownButtonFormField<int>(
    items: List.generate(5, (index) => index + 1)
        .map((count) => DropdownMenuItem(
      value: count,
      child: Text(count.toString(),
          style: Theme.of(context).textTheme.headlineSmall),
    ))
        .toList(),
    onChanged: (value) => controller.assistantsCount.value = value!,
    value: controller.assistantsCount.value,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 2.0),
      ),
      labelText: 'Number rof Assistance',
      labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isDark ? Colors.white70 : Colors.black54,
      ),
    ),
  )
      : const SizedBox.shrink());
}

Widget buildProcedureTypeDropdown(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final borderColor = isDark ? Colors.white : Colors.grey;
  final controller = Get.put(AddProcedureController());
  return Obx(() => DropdownButtonFormField<int>(
    items: [
      DropdownMenuItem(
        value: 1, // medical supplies
        child: Text(
          'Medical Supplies',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      DropdownMenuItem(
        value: 2, // surgical operation
        child: Text(
          'Surgical Operation',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    ],
    onChanged: (value) => controller.procedureType.value = value!,
    value: controller.procedureType.value,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 2.0),
      ),
      labelText: 'Patient Name',
      labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isDark ? Colors.white70 : Colors.black54,
      ),
    ),
  ));
}

Widget buildDateTimeSelectionRow(BuildContext context) {
  final controller = Get.put(AddProcedureController());
  return Row(
    children: [
      Expanded(
        child: Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          onPressed: () => controller.selectDate(context),
          child: Text(
            controller.procedureDate.value == null
                ? 'Select Date'
                : ' ${controller.procedureDate.value!.toLocal().toString().split(' ')[0]}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 15,
            ),
          ),
        )),
      ),
      SizedBox(width: Get.width * 0.03),
      Expanded(
        child: Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () => controller.selectTime(context),
          child: Text(
            controller.procedureTime.value == null
                ? 'Select Time'
                : 'Time : ${controller.procedureTime.value!.format(context)}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 15,
            ),
          ),
        )),
      ),
    ],
  );
}

Widget buildKitsToolsButtonsRow(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final KitsController controller = Get.put(KitsController());
  return Column(
    children: [
      Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mandatory Surgical Tools',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 10),
              ...controller.surgicalKits.map((tool) => ListTile(
                title: Text(
                  tool['name'],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
      SizedBox(height: 20),
      Obx(() => Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: controller.selectedImplants.isEmpty
            ? ElevatedButton(
          onPressed: () => Get.toNamed(AppRoutes.implant_kit),
          child: Text('Tap to choose Implants',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontFamily: 'Montserrat',
            ),
          ),
        )
            : Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selected Implants:',
             style: TextStyle(
             color: Colors.grey,
             fontSize: 15,
              fontFamily: 'Montserrat',
              ),
              ),
              SizedBox(height: 10),
              //هون رح نفك المصفوفة ونعمل ادراج لعناصرها
              ...controller.selectedImplants.entries.map((entry) {
                final implant = entry.value;
                return Column(
                  children: [
                    ListTile(
                      title: Text(implant['name'],
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete,
                        color: Colors.red,
                        ),
                        onPressed: () => controller.toggleImplantSelection(
                            entry.key, implant),
                      ),
                    ),
                    ExpansionTile(
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: Text('Tools for ${implant['name']}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      children: controller.getToolsForImplant(entry.key)
                          .map((tool) => ListTile(
                        title: Text(tool,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                    Divider(),
                  ],
                );
              }),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async {
                    await Get.toNamed(AppRoutes.implant_kit);
                  },
                  child: Text(
                    'Edit Selection',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),
      )),
      SizedBox(height: Get.height * 0.03),
      Obx(() => Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: controller.selectedTools.isEmpty
            ? ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode ? Theme.of(context).cardColor : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: ()  {
            Get.toNamed(AppRoutes.additional_kit);
            controller.updateSelectedTools();
            controller.update();
          },
          child: Text(
            'Tap to choose Tools',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontFamily: 'Montserrat',
            ),
          ),
        )
            : Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.selectedTools.length,
                  itemBuilder: (context, index) {
                    final tool = controller.selectedTools[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tool['name'],
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),

                          Text(
                            'x ${tool['quantity']}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async {
                    await Get.toNamed(AppRoutes.additional_kit);
                  },
                  child: Text(
                    'Edit Selection',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ],
  );
}

Widget buildSubmitButton(BuildContext context) {
  final controller = Get.put(AddProcedureController());
  return CustomButton(onTap: (){
    controller.submitProcedure;
  }, text: 'Confirm Procedure', color: AppColors.primaryGreen);

}