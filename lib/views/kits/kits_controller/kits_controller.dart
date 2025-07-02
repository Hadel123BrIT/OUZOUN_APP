import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class KitsController extends GetxController {
  var toolQuantities = <int>[].obs;
  var tools = <String, bool>{}.obs;
  final selectedImplants = <String>{}.obs;
  var selectedToolsCount = 0.obs;

  void updateToolQuantity(int index, int quantity) {

    toolQuantities[index] = quantity;
    updateSelectedToolsCount();
  }

  bool isImplantSelected(String implantId) {
    return selectedImplants.contains(implantId);
  }

  void toggleImplantSelection(String implantId) {
    if (selectedImplants.contains(implantId)) {
      selectedImplants.remove(implantId);
    } else {
      selectedImplants.add(implantId);
    }
  }

  void updateSelectedToolsCount() {
    selectedToolsCount.value = toolQuantities.where((q) => q > 0).length;
  }

  void toggleTool(String toolName) {
    tools[toolName] = !(tools[toolName] ?? false);
  }

  @override
  void onInit() {
    toolQuantities.value = List.filled(6, 0);
    super.onInit();
  }

  }
