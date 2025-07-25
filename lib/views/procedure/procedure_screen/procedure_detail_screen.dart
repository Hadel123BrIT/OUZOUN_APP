// screens/procedure_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ouzoun/core/constants/app_colors.dart';
import '../../../models/Implant_model.dart';
import '../../../models/kit_model.dart';
import '../../../models/medicalTool_model.dart';
import '../../../models/procedure_model.dart';
import '../widget/buildProcedureDetailsHelper.dart';

class ProcedureDetailScreen extends StatelessWidget {
  final Procedure procedure;

  const ProcedureDetailScreen({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : AppColors.deepBlack;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        toolbarHeight: context.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(context.width * 0.06),
          ),
        ),
        title: Text("Procedure Details",
            style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            buildHeaderCard(context, isDarkMode, textColor, procedure),
            SizedBox(height: 20),

            // Assistants Section
            buildSectionTitle('Assistants (${procedure.assistants.length})'),
            buildAssistantsList( procedure,  isDarkMode),

            SizedBox(height: 20),

            // Additional Tools Section
            buildSectionTitle('Additional Tools (${procedure.tools.length})'),
            buildToolsList(procedure.tools,isDarkMode),

            SizedBox(height: 20),

            // Kits Section
            buildSectionTitle('Kits (${procedure.kits.length})'),
            ...procedure.kits.map((kit) => buildKitCard(kit, context)).toList(),
          ],
        ),
      ),
    );
  }


}