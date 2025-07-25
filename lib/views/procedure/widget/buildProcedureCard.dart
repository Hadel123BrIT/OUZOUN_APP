import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ouzoun/Widgets/custom_button.dart';
import 'package:ouzoun/core/constants/app_colors.dart';
import '../../../models/procedure_model.dart';
import '../procedure_controller/procedure_controller.dart';
import '../procedure_screen/procedure_detail_screen.dart';

Widget buildProcedureCard(Procedure procedure, BuildContext context) {
  ProcedureController controller=Get.put(ProcedureController());
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Card(
    color: isDarkMode ? Theme.of(context).cardColor : Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(context.width * 0.025),
      side: BorderSide(
        color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
        width: 2,
      ),
    ),
    margin: EdgeInsets.symmetric( vertical: context.height * 0.02),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Procedure ${procedure.id}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Chip(
                label: Text(procedure.statusText,
                style: TextStyle(
                  fontFamily: "Montserrat",
                ),
                ),
                backgroundColor: procedure.statusColor,
                labelStyle: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            ' ${procedure.doctor.userName}',
            style: TextStyle(
               fontFamily: "Montserrat",
               fontSize: 15,
            )
          ),
          SizedBox(height: 8),
          Text(
            'Date: ${DateFormat('yyyy-MM-dd').format(procedure.date)}        Time: ${DateFormat('HH:mm').format(procedure.date)}',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Number of Assistants : ${procedure.numberOfAssistants}',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
              )
          ),
          // if (procedure.assistants.isNotEmpty) ...[
          //   SizedBox(height: 8),
          //   Text(
          //     'Assistants:',
          //     style: TextStyle(fontWeight: FontWeight.bold,
          //       fontFamily: "Montserrat",
          //       color: AppColors.primaryGreen
          //     ),
          //   ),
          //   Wrap(
          //     spacing: 8,
          //     children: procedure.assistants
          //         .map((assistant) => Chip(
          //       label: Text(assistant.userName),
          //     ))
          //         .toList(),
          //   ),
          SizedBox(height: 8),
          // ExpansionTile(
          //   title: Text('Tools (${procedure.tools.length})',
          //       style: TextStyle(
          //         fontFamily: "Montserrat",
          //         fontSize: 15,
          //       )
          //   ),
          //   children: procedure.tools.map((tool) => ListTile(
          //     title: Text(tool.name),
          //     subtitle: Text('Quantity: ${tool.quantity}',
          //         style: TextStyle(
          //           fontFamily: "Montserrat",
          //           fontSize: 15,
          //         )
          //     ),
          //     trailing: Text('${tool.width}x${tool.height}x${tool.thickness} cm'),
          //   )).toList(),
          // ),
          // ...procedure.kits.map((kit) => ExpansionTile(
          //   title: Row(
          //     children: [
          //       Text(kit.name,
          //           style: TextStyle(
          //             fontFamily: "Montserrat",
          //             fontSize: 15,
          //           )
          //       ),
          //       if (kit.isMainKit) ...[
          //         SizedBox(width: 8),
          //         Icon(Icons.medical_services, color: Colors.green, size: 20),
          //         // Text(
          //         //   '(Surgical Kit)',
          //         //   style: TextStyle(color: Colors.green),
          //         // ),
          //       ],
          //     ],
          //   ),
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: 16),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Implants:',
          //             style: TextStyle(
          //               fontFamily: "Montserrat",
          //               fontSize: 15,
          //             ),
          //           ),
          //           ...kit.implants.map((implant) => ListTile(
          //             title: Text(implant.brand),
          //             subtitle: Text(implant.description,
          //                 style: TextStyle(
          //                   fontFamily: "Montserrat",
          //                   fontSize: 15,
          //                 )
          //             ),
          //             trailing: Text('Qty: ${implant.quantity}',
          //                 style: TextStyle(
          //                   fontFamily: "Montserrat",
          //                   fontSize: 15,
          //                 )
          //             ),
          //           )).toList(),
          //
          //           SizedBox(height: 8),
          //           Text(
          //             'Kit Tools:',
          //               style: TextStyle(
          //                 fontFamily: "Montserrat",
          //                 fontSize: 15,
          //               ),
          //           ),
          //           ...kit.tools.map((tool) => ListTile(
          //             title: Text(tool.name),
          //             subtitle: Text('Qty: ${tool.quantity}',
          //                 style: TextStyle(
          //                   fontFamily: "Montserrat",
          //                   fontSize: 15,
          //                 )
          //             ),
          //             trailing: Text('${tool.width}x${tool.height}x${tool.thickness} cm',
          //                 style: TextStyle(
          //                   fontFamily: "Montserrat",
          //                   fontSize: 15,
          //                 )
          //             ),
          //           )).toList(),
          //         ],
          //       ),
          //     ),
          //   ],
          // )).toList(),
          CustomButton(
            // onTap: () async {
            //   try {
            //     await controller.fetchProcedureDetails(procedure.id);
            //     Get.to(() => ProcedureDetailScreen(procedure: controller.selectedProcedure.value!));
            //   } catch (e) {
            //     Get.snackbar('Error'.tr, 'Cannot view details: ${e.toString()}'.tr);
            //   }
            // },
            onTap: (){
              Get.to(() => ProcedureDetailScreen(procedure: procedure));
            },
            text: "View details".tr,
            color: AppColors.primaryGreen,
          ),
        ],
      ),
    ),
  );
}