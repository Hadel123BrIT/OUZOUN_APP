import 'package:get/get.dart';

class KitsController extends GetxController {
  var toolQuantities = <int>[].obs;
  var tools = <String, bool>{}.obs;
  final selectedImplantDetails = <String, Map<String, dynamic>>{}.obs;
  var selectedToolsCount = 0.obs;
  final selectedImplants = <String, Map<String, dynamic>>{}.obs;
  final selectedToolsForImplants = <String, List<String>>{}.obs;

  void updateToolQuantity(int index, int quantity) {
    toolQuantities[index] = quantity;
    updateSelectedToolsCount();
  }

  bool isImplantSelected(String implantId) {
    return selectedImplants.containsKey(implantId);
  }

  void toggleImplantSelection(String implantId, Map<String, dynamic> implantData) {
    if (selectedImplants.containsKey(implantId)) {
      selectedImplants.remove(implantId);
      selectedToolsForImplants.remove(implantId);
    } else {
      selectedImplants[implantId] = implantData;
      selectedToolsForImplants[implantId] = [];
    }
    update();
  }

  void updateSelectedToolsCount() {
    selectedToolsCount.value = toolQuantities.where((q) => q > 0).length;
  }

  void toggleTool(String toolName) {
    tools[toolName] = !(tools[toolName] ?? false);
    update();
  }

  void toggleToolForImplant(String implantId, String toolName) {
    if (!selectedToolsForImplants.containsKey(implantId)) {
      selectedToolsForImplants[implantId] = [];
    }

    if (selectedToolsForImplants[implantId]!.contains(toolName)) {
      selectedToolsForImplants[implantId]!.remove(toolName);
    } else {
      selectedToolsForImplants[implantId]!.add(toolName);
    }
    update();
  }

  bool isToolSelectedForImplant(String implantId, String toolName) {
    return selectedToolsForImplants[implantId]?.contains(toolName) ?? false;
  }

  int get selectedImplantsCount => selectedImplants.length;

  @override
  void onInit() {
    toolQuantities.value = List.filled(6, 0);
    super.onInit();
  }
}























