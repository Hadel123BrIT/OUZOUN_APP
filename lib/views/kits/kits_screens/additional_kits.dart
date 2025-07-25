import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ouzoun/widgets/custom_button.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../Widgets/custom_drawer.dart';
import '../../../Widgets/custom_text.dart';
import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';
import '../widget/buildToolCard.dart';
import '../widget/buildDetailItem.dart';
import '../widget/showAdditionalToolsDialog.dart';
import '../widget/showQuantityDialog.dart';

class AdditionalKits extends StatelessWidget {
  final KitsController controller = Get.put(KitsController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final additionalTools = controller.additionalTools;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: showSelectedToolsDialog,
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
        title: Text("Additional tools", style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width * 0.04, vertical: context.height * 0.02,
      ),
        child: Column(
          children: [
            // Welcome message
            buildWelcomeMessage(context, isDarkMode),
            // Tools list
            Expanded(
              child: buildToolsList(context, additionalTools),
            ),
            // Savث button
            buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildWelcomeMessage(BuildContext context, bool isDarkMode) {
    return Container(
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
    );
  }

  Widget buildToolsList(BuildContext context, List<Map<String, dynamic>> tools) {
    return AnimationLimiter(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            tools.length,
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
                    imagePath: tools[index]['image'],
                    toolName: tools[index]['name'],
                    length: tools[index]['length'],
                    width: tools[index]['width'],
                    thickness: tools[index]['thickness'],
                    selectedQuantity: controller.additionalToolQuantities[index],
                    onQuantitySelected: (quantity) {
                      controller.updateAdditionalToolQuantity(index, quantity);
                    },
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: CustomButton(
        onTap: () {
          final selectedIds = controller.getSelectedToolsIds();
          Get.back(result: selectedIds);
        },
        text: "Save Selection",
        color: AppColors.primaryGreen,
      ),
    );
  }


}