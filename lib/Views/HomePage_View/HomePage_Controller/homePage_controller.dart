import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  void changeIndex(int index) => selectedIndex.value = index;
}