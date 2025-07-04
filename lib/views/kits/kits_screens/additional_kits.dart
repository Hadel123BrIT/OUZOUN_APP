import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../Widgets/custom_bottom_navigation_bar .dart';
import '../../../Widgets/custom_drawer.dart';
import '../../../Widgets/custom_text.dart';
import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';
import '../widget/build_tool_card.dart';
import '../widget/build_detail_item.dart';
import '../widget/show_additional_tools_dialog.dart';
import '../widget/show_quantity_dialog.dart';

class AdditionalKits extends StatelessWidget {
  final KitsController controller = Get.put(KitsController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<Map<String, dynamic>> additionalTools = [
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': 0,
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': 0,
    },
    {
      'name': 'Bone File',
      'image': 'assets/images/probe.png',
      'length': '18 cm',
      'width': '2 cm',
      'thickness': '0.8 cm',
      'quantity': 0,
    },
    {
      'name': 'Retractor',
      'image': 'assets/images/tooth.png',
      'length': '20 cm',
      'width': '5 cm',
      'thickness': '1 cm',
      'quantity': 0,
    },
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': 0,
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {
                    show_additional_tools_dialog(context, additionalTools, controller);
                  },
                  icon: Icon(Icons.shopping_cart_checkout_outlined, color: Colors.white),
                ),
                Obx(() => controller.selectedToolsCount > 0
                    ? CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    controller.selectedToolsCount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
                    : SizedBox.shrink()),
              ],
            ),
          )
        ],
        toolbarHeight: context.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(context.width * 0.06),
          ),
        ),
        title: Text("Additional Kits",
            style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.04, vertical: context.height * 0.02),
          child: Column(
            children: [
              // Welcome message
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.width * 0.04),
                margin: EdgeInsets.only(bottom: context.height * 0.02),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Doctor,",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: context.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: context.height * 0.01),
                    Text(
                      "This page is dedicated to additional tools that may assist you in the surgical procedure you are performing. Simply select the quantity you need.",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: context.width * 0.035,
                        color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              AnimationLimiter(
                child: Column(
                  children: List.generate(
                    additionalTools.length,
                        (index) => AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Obx(() => BuildToolCard(
                            showQuantityDetail: false,
                            isAppear: true,
                            context: context,
                            imagePath: additionalTools[index]['image'],
                            toolName: additionalTools[index]['name'],
                            length: additionalTools[index]['length'],
                            width: additionalTools[index]['width'],
                            thickness: additionalTools[index]['thickness'],
                            selectedQuantity: controller.toolQuantities[index],
                            onQuantitySelected: (quantity) {
                              controller.updateToolQuantity(index, quantity);
                            },
                          )),
                        ),
                      ),
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
}