import 'package:ouzoun/models/procedure_model.dart';

import 'Implant_model.dart';
import 'medicalTool_model.dart';

class Kit {
  final int id;
  final String name;
  final bool isMainKit;
  final List<Implant> implants;
  final List<MedicalTool> tools;

  Kit({
    required this.id,
    required this.name,
    required this.isMainKit,
    required this.implants,
    required this.tools,
  });

  factory Kit.fromJson(Map<String, dynamic> json) {
    return Kit(
      id: json['id'],
      name: json['name'],
      isMainKit: json['isMainKit'],
      implants: List<Implant>.from(
          json['implants'].map((x) => Implant.fromJson(x))),
      tools: List<MedicalTool>.from(
          json['tools'].map((x) => MedicalTool.fromJson(x))),
    );
  }

  // دالة مساعدة لعرض نوع الطقم
  String get kitType => isMainKit ? 'Main Surgical Kit' : 'Custom Kit';
}