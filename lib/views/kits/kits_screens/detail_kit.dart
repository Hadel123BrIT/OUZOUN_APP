import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Services/media_query_service.dart';
import 'package:ouzoun/Widgets/custom_button.dart' hide  CustomButton;
import '../../../core/constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../Kits_Controller/kits_controller.dart';
import '../widget/build_spec_item.dart';
import '../widget/build_tool_item.dart';

class ImplantDetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Map<String, dynamic> implant;
  ImplantDetailScreen({Key? key}) : implant = Get.arguments ?? {}, super(key: key);

  @override
  Widget build(BuildContext context) {
      final implantId = implant['id']?.toString() ?? UniqueKey().toString();
      print("---------------------------------Implant ID: $implantId");
      print("---------------------------Current Tools: ${Get.put(KitsController()).selectedToolsForImplants[implantId]}");
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: context.width * 0.5,
                  height: context.height * 0.16,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(context.width * 0.2),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: context.width * 0.4,
                            height: context.width * 0.4,
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                )
                              ],
                              image: DecorationImage(
                                image: AssetImage(implant['image']),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.02),
                          Text(
                            implant['name'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: context.height * 0.01),
                          Text(
                            "Quantity: ${implant['quantity']}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    Container(
                      padding: EdgeInsets.all(context.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Specifications",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: context.height * 0.01),
                          Divider(color: AppColors.primaryGreen),
                          SizedBox(height: context.height * 0.01),
                          BuildSpecItem(context, "Height", implant['height']),
                          BuildSpecItem(context, "Width", implant['width']),
                          BuildSpecItem(context, "Radius", implant['radius']),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    Container(
                      padding: EdgeInsets.all(context.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand and Quantity",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: context.height * 0.01),
                          Divider(color: AppColors.primaryGreen),
                          SizedBox(height: context.height * 0.01),
                          BuildSpecItem(context, "Brand", implant['brand']),
                          BuildSpecItem(context, "Quantity", '${implant['quantity']}'),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    Container(
                      padding: EdgeInsets.all(context.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: context.height * 0.01),
                          Divider(color: AppColors.primaryGreen),
                          SizedBox(height: context.height * 0.01),
                          Text(
                            implant['description'],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    Container(
                      padding: EdgeInsets.all(context.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Required Tools",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: context.height * 0.01),
                          Divider(color: AppColors.primaryGreen),
                          SizedBox(height: context.height * 0.01),
                          _buildToolItem(context, implantId, "Surgical Kit"),
                          _buildToolItem(context, implantId, "Drill Guide"),
                          _buildToolItem(context, implantId, "Healing Abutment"),
                          _buildToolItem(context, implantId, "Torque Wrench"),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.04),
                    Center(
                      child: CustomButton(onTap: (){
                            Get.snackbar(
                              "Added to Cart",
                              "${implant['name']} has been added to your cart",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.primaryGreen,
                              colorText: Colors.white,
                            );
                      }, text: 'Add to Cart',
                        color: AppColors.primaryGreen,),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: context.width * 0.5,
                  height: context.height * 0.16,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.width * 0.2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildToolItem(BuildContext context, String implantId, String toolName) {
    final controller = Get.find<KitsController>();

    return Obx(() => CheckboxListTile(
      title: Text(toolName),
      value: controller.isToolSelectedForImplant(implantId, toolName),
      onChanged: (value) => controller.toggleToolForImplant(implantId, toolName),
      activeColor: AppColors.primaryGreen,
    ));
  }
}