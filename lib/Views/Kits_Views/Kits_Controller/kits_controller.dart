import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class KitsController extends GetxController {
  var toolQuantities = <int>[].obs;
  var tools = <String, bool>{}.obs;

  void toggleTool(String toolName) {
    tools[toolName] = !(tools[toolName] ?? false);
  }
  @override
  void onInit() {
    toolQuantities.value = List.filled(6, 0);
    super.onInit();
  }

  void updateToolQuantity(int index, int quantity) {
    toolQuantities[index] = quantity;
  }
}