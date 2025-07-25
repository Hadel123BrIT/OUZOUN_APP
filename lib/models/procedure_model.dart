// models/procedure_model.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'Implant_model.dart';
import 'assistant_model.dart';
import 'doctor_model.dart';
import 'kit_model.dart';
import 'medicalTool_model.dart';

class Procedure {
  final int id;
  final String doctorId;
  final int numberOfAssistants;
  final List<String> assistantIds;
  final int categoryId;
  final int status;
  final DateTime date;
  final Doctor doctor;
  final List<MedicalTool> tools;
  final List<Kit> kits;
  final List<Assistant> assistants;

  Procedure({
    required this.id,
    required this.doctorId,
    required this.numberOfAssistants,
    required this.assistantIds,
    required this.categoryId,
    required this.status,
    required this.date,
    required this.doctor,
    required this.tools,
    required this.kits,
    required this.assistants,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      id: json['id'],
      doctorId: json['doctorId'],
      numberOfAssistants: json['numberOfAssistants'],
      assistantIds: List<String>.from(json['assistantIds']),
      categoryId: json['categoryId'],
      status: json['status'],
      date: DateTime.parse(json['date']),
      doctor: Doctor.fromJson(json['doctor']),
      tools: List<MedicalTool>.from(
          json['tools'].map((x) => MedicalTool.fromJson(x))),
      kits: List<Kit>.from(json['kits'].map((x) => Kit.fromJson(x))),
      assistants: List<Assistant>.from(
          json['assistants'].map((x) => Assistant.fromJson(x))),
    );
  }

  String get statusText {
    switch (status) {
      case 3: return 'Pending';
      case 4: return 'acceptable';
      default: return 'unacceptable';
    }
  }

  Color get statusColor {
    switch (status) {
      case 3: return Colors.orange;
      case 4: return Colors.green;
      default: return Colors.red;
    }
  }
}






