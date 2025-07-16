import 'package:get/get.dart';

class KitsController extends GetxController {
  final List<Map<String, dynamic>> additionalTools = [
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': "0",
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': "3",
    },
    {
      'name': 'Bone File',
      'image': 'assets/images/probe.png',
      'length': '18 cm',
      'width': '2 cm',
      'thickness': '0.8 cm',
      'quantity': "2",
    },
    {
      'name': 'Retractor',
      'image': 'assets/images/tooth.png',
      'length': '20 cm',
      'width': '5 cm',
      'thickness': '1 cm',
      'quantity': "1",
    },
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': "4",
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': "5",
    },
  ];
  final List<Map<String, dynamic>> surgicalKits = [
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': "0",
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': "3",
    },
    {
      'name': 'Bone File',
      'image': 'assets/images/probe.png',
      'length': '18 cm',
      'width': '2 cm',
      'thickness': '0.8 cm',
      'quantity': "2",
    },
    {
      'name': 'Retractor',
      'image': 'assets/images/tooth.png',
      'length': '20 cm',
      'width': '5 cm',
      'thickness': '1 cm',
      'quantity': "1",
    },
    {
      'name': 'Dental Drill',
      'image': 'assets/images/forceps.png',
      'length': '15 cm',
      'width': '3 cm',
      'thickness': '2 cm',
      'quantity': "4",
    },
    {
      'name': 'Surgical Scissors',
      'image': 'assets/images/mouth-mirror.png',
      'length': '12 cm',
      'width': '4 cm',
      'thickness': '0.5 cm',
      'quantity': "5",
    },
  ];
  final RxList<int> additionalToolQuantities = <int>[].obs;
  final RxList<Map<String, dynamic>> selectedAdditionalTools = <Map<String, dynamic>>[].obs;
  final RxList<int> toolQuantities = <int>[].obs;
  final RxMap<String, bool> tools = <String, bool>{}.obs;
  final RxInt selectedToolsCount = 0.obs;
  final RxList<int> surgicalToolQuantities = <int>[].obs;
  final RxList<Map<String, dynamic>> selectedSurgicalTools = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> selectedTools = <Map<String, dynamic>>[].obs;
  final RxMap<String, Map<String, dynamic>> selectedImplants = <String, Map<String, dynamic>>{}.obs;
  final RxMap<String, List<String>> selectedToolsForImplants = <String, List<String>>{}.obs;
  final RxMap<String, Map<String, dynamic>> selectedImplantDetails = <String, Map<String, dynamic>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initializeToolQuantities();
  }

  void initializeToolQuantities() {
    toolQuantities.value = List.filled(surgicalKits.length, 0);
    surgicalToolQuantities.value = List.filled(surgicalKits.length, 0);
    additionalToolQuantities.value = List.filled(additionalTools.length, 0);
    updateSelectedTools();
  }


  void updateAdditionalToolQuantity(int toolIndex, int newQuantity) {
    if (toolIndex >= 0 && toolIndex < additionalTools.length) {
      additionalToolQuantities[toolIndex] = newQuantity;
      _updateSelectedAdditionalTools();
      updateSelectedTools();
      update();
    }
  }

  void _updateSelectedAdditionalTools() {
    selectedAdditionalTools.clear();
    for (int i = 0; i < additionalToolQuantities.length; i++) {
      if (additionalToolQuantities[i] > 0) {
        selectedAdditionalTools.add({
          ...additionalTools[i],
          'quantity': additionalToolQuantities[i],
        });
      }
    }
  }

  List<int> getSelectedToolsIds() {

    List<int> ids = [];
    for (int i = 0; i < toolQuantities.length; i++) {
      if (toolQuantities[i] > 0) {
        ids.add(i + 1);
      }
    }
    return ids;

  }

  void updateSelectedTools() {
    selectedTools.clear();
    for (int i = 0; i < additionalToolQuantities.length; i++) {
      if (additionalToolQuantities[i] > 0) {
        selectedTools.add({
          ...additionalTools[i],
          'quantity': additionalToolQuantities[i].toString(),
        });
      }
    }
  }

//----------------------------------------------------
  void updateSurgicalToolQuantity(int index, int quantity) {
    if (index >= 0 && index < surgicalToolQuantities.length) {
      surgicalToolQuantities[index] = quantity;
      update();
    }
  }

  void updateSelectedSurgicalTools() {
    selectedSurgicalTools.clear();
    for (int i = 0; i < surgicalToolQuantities.length; i++) {
      if (surgicalToolQuantities[i] > 0) {
        selectedSurgicalTools.add({
          ...surgicalKits[i],
          'quantity': surgicalToolQuantities[i],
        });
      }
    }
  }

  void clearSurgicalToolsSelection() {
    surgicalToolQuantities.assignAll(List.filled(surgicalKits.length, 0));
    update();
  }

  List<String> getAllSurgicalToolsNames() {
    return surgicalKits.map((tool) => tool['name'] as String).toList();
  }

  bool hasSelectedSurgicalTools() {
    return surgicalToolQuantities.any((quantity) => quantity > 0);
  }

  void clearAllSelections() {
    additionalToolQuantities.assignAll(List.filled(additionalTools.length, 0));
    surgicalToolQuantities.assignAll(List.filled(surgicalKits.length, 0));
    selectedAdditionalTools.clear();
    selectedSurgicalTools.clear();
    selectedImplants.clear();
    selectedToolsForImplants.clear();
  }

  List<int> getSelectedIds() {
    List<int> ids = [];

    for (int i = 0; i < surgicalToolQuantities.length; i++) {
      if (surgicalToolQuantities[i] > 0) {
        ids.add(i + 1000);
      }
    }

    for (int i = 0; i < additionalToolQuantities.length; i++) {
      if (additionalToolQuantities[i] > 0) {
        ids.add(i + 2000);
      }
    }

    selectedImplants.forEach((implantId, _) {
      final numericId = int.tryParse(implantId.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      if (numericId > 0) ids.add(numericId);
    });

    return ids;
  }

  //------------------------------------------------------
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

  bool isImplantSelected(String implantId) => selectedImplants.containsKey(implantId);

  void toggleToolForImplant(String implantId, String toolName) {
    if (!selectedToolsForImplants.containsKey(implantId)) {
      selectedToolsForImplants[implantId] = [];
    }

    final toolsList = selectedToolsForImplants[implantId]!;
    if (toolsList.contains(toolName)) {
      toolsList.remove(toolName);
    } else {
      toolsList.add(toolName);
    }
  }

  bool isToolSelectedForImplant(String implantId, String toolName) {
    return selectedToolsForImplants[implantId]?.contains(toolName) ?? false;
  }

  List<String> getToolsForImplant(String implantId) {
    return selectedToolsForImplants[implantId] ?? [];
  }

  void toggleTool(String toolName) {
    tools[toolName] = !(tools[toolName] ?? false);
    update();
  }

  int get selectedImplantsCount => selectedImplants.length;

  Map<String, dynamic> getAllSelectedTools() {
    final Map<String, dynamic> result = {
      'general_tools': [],
      'implant_specific_tools': {},
    };

    for (int i = 0; i < toolQuantities.length; i++) {
      if (toolQuantities[i] > 0) {
        result['general_tools'].add({
          'tool_id': i,
          'quantity': toolQuantities[i],
        });
      }
    }

    selectedToolsForImplants.forEach((implantId, tools) {
      if (tools.isNotEmpty) {
        result['implant_specific_tools'][implantId] = tools;
      }
    });

    return result;
  }


}