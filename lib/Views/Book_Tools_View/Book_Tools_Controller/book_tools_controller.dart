// book_tools_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Services/mediaQuery.dart';

class BookToolsController extends GetxController {
  final RxMap<String, int> selectedTools = <String, int>{}.obs;
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> toolsList = [
    {'image': 'assets/icons/mouth-mirror.png', 'name': 'mouth-mirror'},
    {'image': 'assets/icons/probe.png', 'name': 'probe'},
    {'image': 'assets/icons/forceps.png', 'name': 'forceps'},
    {'image': 'assets/icons/tooth.png', 'name': 'tooth'},
    {'image': 'assets/icons/mouth-mirror.png', 'name': 'mouth-mirror'},
    {'image': 'assets/icons/probe.png', 'name': 'probe'},
    {'image': 'assets/icons/forceps.png', 'name': 'forceps'},
    {'image': 'assets/icons/tooth.png', 'name': 'tooth'},
  ];

  List<Map<String, String>> get filteredTools {
    if (searchController.text.isEmpty) return toolsList;
    return toolsList.where((tool) =>
        tool['name']!.toLowerCase().contains(searchController.text.toLowerCase())
    ).toList();
  }

  void updateQuantity(String toolName, int quantity) {
    selectedTools[toolName] = quantity;
  }

  void editToolQuantity(String toolName, int newQuantity) {
    if (newQuantity > 0) {
      selectedTools[toolName] = newQuantity;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void showCartDialog(BuildContext context, BookToolsController controller) {
    final media = MediaQueryHelper(context);

    if (controller.selectedTools.isEmpty) {
      Get.snackbar(
        'Cart is Empty'.tr,
        'Please add some tools first'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.defaultDialog(
      title: 'Your Selected Tools'.tr,
      titleStyle: TextStyle(fontSize: media.width * 0.045, fontWeight: FontWeight.bold),
      content: Container(
        width: media.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.selectedTools.entries.map((entry) =>
                ListTile(
                  leading: Image.asset(
                    controller.toolsList.firstWhere((t) => t['name'] == entry.key)['image']!,
                    width: media.width * 0.1, // 40 replaced
                    height: media.height * 0.05, // 40 replaced
                  ),
                  title: Text(entry.key.tr),
                  trailing: Text('${entry.value}'),
                  onTap: () => _editToolQuantity(controller, entry.key),
                ),
            ),
            SizedBox(height: media.height * 0.025), // 20 replaced
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                minimumSize: Size(double.infinity, media.height * 0.06),
              ),
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'Order Submitted'.tr,
                  'Your tools order has been placed'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text('Confirm Order'.tr,
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _editToolQuantity(BookToolsController controller, String toolName) {
    final media = MediaQueryHelper(Get.context!);
    final quantityController = TextEditingController(
        text: controller.selectedTools[toolName].toString()
    );

    Get.defaultDialog(
      title: 'Edit Quantity'.tr,
      titleStyle: TextStyle(fontSize: media.width * 0.045, fontWeight: FontWeight.bold), // 18 replaced
      content: Padding(
        padding: EdgeInsets.all(media.width * 0.04), // 16 replaced
        child: Column(
          children: [
            Text('Enter new quantity for $toolName'.tr),
            SizedBox(height: media.height * 0.025), // 20 replaced
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity'.tr,
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
        ),
        onPressed: () {
          final newQuantity = int.tryParse(quantityController.text);
          if (newQuantity != null && newQuantity > 0) {
            controller.editToolQuantity(toolName, newQuantity);
            Get.back();
          }
        },
        child: Text('Save'.tr, style: TextStyle(color: Colors.white)),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'.tr),
      ),
    );
  }
}