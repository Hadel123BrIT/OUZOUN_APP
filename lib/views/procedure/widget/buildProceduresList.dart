import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../models/Implant_model.dart';
import '../../../models/assistant_model.dart';
import '../../../models/doctor_model.dart';
import '../../../models/kit_model.dart';
import '../../../models/medicalTool_model.dart';
import '../../../models/procedure_model.dart';
import '../procedure_controller/procedure_controller.dart';
import 'buildProcedureCard.dart';

Widget buildProceduresList() {
  final ProcedureController controller = Get.put(ProcedureController());
  // دالة لإنشاء بيانات وهمية
  List<Procedure> createDummyProcedures() {
    return [
      Procedure(
        id: 1,
        doctorId: "doc1",
        numberOfAssistants: 2,
        assistantIds: ["ast1", "ast2"],
        categoryId: 1,
        status: 3, // Pending
        date: DateTime.now().add(Duration(days: 2)),
        doctor: Doctor(
          id: "doc1",
          userName: "Dr. Ahmed Mohamed",
          email: "ahmed@example.com",
          phoneNumber: "0123456789",
          role: "Surgeon",
        ),
        tools: [
          MedicalTool(
            id: 1,
            name: "Surgical Scissors",
            width: 12.0,
            height: 4.0,
            thickness: 0.5,
            quantity: 3,
            kitId: null,
            categoryId: 1,
          ),
          MedicalTool(
            id: 2,
            name: "Bone File",
            width: 18.0,
            height: 2.0,
            thickness: 0.8,
            quantity: 2,
            kitId: null,
            categoryId: 1,
          ),
        ],
        kits: [
          Kit(
            id: 1,
            name: "Basic Implant Kit",
            isMainKit: true,
            implants: [
              Implant(
                id: 1,
                radius: 3.5,
                width: 3.5,
                height: 10.0,
                quantity: 5,
                brand: "Implant Tech",
                description: "Standard implant",
                imagePath: "",
                kitId: 1,
              ),
            ],
            tools: [
              MedicalTool(
                id: 3,
                name: "Dental Drill",
                width: 15.0,
                height: 3.0,
                thickness: 2.0,
                quantity: 1,
                kitId: 1,
                categoryId: 1,
              ),
            ],
          ),
        ],
        assistants: [
          Assistant(
            id: "ast1",
            userName: "Nurse Sarah",
            email: "sarah@example.com",
            phoneNumber: "0111222333",
            role: "Nurse",
          ),
          Assistant(
            id: "ast2",
            userName: "Tech Ali",
            email: "ali@example.com",
            phoneNumber: "0100444555",
            role: "Technician",
          ),
        ],
      ),
      Procedure(
        id: 2,
        doctorId: "doc2",
        numberOfAssistants: 1,
        assistantIds: ["ast3"],
        categoryId: 2,
        status: 4, // Completed
        date: DateTime.now().subtract(Duration(days: 1)),
        doctor: Doctor(
          id: "doc2",
          userName: "Dr. Fatma Mahmoud",
          email: "fatma@example.com",
          phoneNumber: "0100123456",
          role: "Dentist",
        ),
        tools: [
          MedicalTool(
            id: 4,
            name: "Retractor",
            width: 20.0,
            height: 5.0,
            thickness: 1.0,
            quantity: 1,
            kitId: null,
            categoryId: 2,
          ),
        ],
        kits: [
          Kit(
            id: 2,
            name: "Custom Kit",
            isMainKit: false,
            implants: [
              Implant(
                id: 2,
                radius: 4.1,
                width: 4.1,
                height: 12.0,
                quantity: 3,
                brand: "Dental Care",
                description: "Premium implant",
                imagePath: "",
                kitId: 2,
              ),
            ],
            tools: [
              MedicalTool(
                id: 5,
                name: "Prosthetic Kit",
                width: 20.0,
                height: 15.0,
                thickness: 3.0,
                quantity: 1,
                kitId: 2,
                categoryId: 2,
              ),
            ],
          ),
        ],
        assistants: [
          Assistant(
            id: "ast3",
            userName: "Assistant Samir",
            email: "samir@example.com",
            phoneNumber: "0100555666",
            role: "Assistant",
          ),
        ],
      ),
      Procedure(
        id: 3,
        doctorId: "doc2",
        numberOfAssistants: 1,
        assistantIds: ["ast3"],
        categoryId: 2,
        status: 2, // Completed
        date: DateTime.now().subtract(Duration(days: 1)),
        doctor: Doctor(
          id: "doc2",
          userName: "Dr. hadel brmo",
          email: "hadel@example.com",
          phoneNumber: "0100123456",
          role: "Dentist",
        ),
        tools: [
          MedicalTool(
            id: 4,
            name: "Retractor",
            width: 20.0,
            height: 5.0,
            thickness: 1.0,
            quantity: 1,
            kitId: null,
            categoryId: 2,
          ),
        ],
        kits: [
          Kit(
            id: 2,
            name: "Custom Kit",
            isMainKit: false,
            implants: [
              Implant(
                id: 2,
                radius: 4.1,
                width: 4.1,
                height: 12.0,
                quantity: 3,
                brand: "Dental Care",
                description: "Premium implant",
                imagePath: "",
                kitId: 2,
              ),
            ],
            tools: [

            ],
          ),
        ],
        assistants: [
          Assistant(
            id: "ast3",
            userName: "Assistant Samir",
            email: "samir@example.com",
            phoneNumber: "0100555666",
            role: "Assistant",
          ),
        ],
      ),
    ];
  }
  final dummyProcedures = createDummyProcedures();
  return Obx(() {
    if (controller.isLoading.value) {
      return Center(child: CircularProgressIndicator());
    }

    // if (controller.filteredProcedures.isEmpty) {
    //   return Center(child: Text('No procedures found'));
    // }
    if (dummyProcedures.isEmpty) {
      return Center(child: Text('No procedures found'));
    }

    return ListView.builder(
     // itemCount: controller.filteredProcedures.length,
      itemCount: dummyProcedures.length,
      // itemBuilder: (context, index) {
      //   final procedure = createDummyProcedures[index];
      //   return buildProcedureCard(procedure,context);
      // },
      itemBuilder: (context, index) {
        return buildProcedureCard(dummyProcedures[index], context);
      },
    );
  });
}