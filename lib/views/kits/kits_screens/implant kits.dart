import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Widgets/custom_button.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../Widgets/custom_drawer.dart';
import '../../../core/constants/app_colors.dart';
import '../Kits_Controller/kits_controller.dart';
import '../widget/build_detail_row.dart';
import '../widget/build_implant_card.dart';

class Implantkits extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<Map<String, dynamic>> implants = [
    {
      'name': 'Nobel Biocare ',
      'height': '10 mm',
      'width': '3.5 mm',
      'radius': '3.5 mm',
      'brand' : "Implant Tech",
      'quantity': 15,
      'description': 'High Quality Premium implant for anterior region',
      'image': 'assets/icons/implant1.png'
    },
    {
      'name': 'Straumann ',
      'height': '12 mm',
      'width': '4.1 mm',
      'radius': '4.1 mm',
      'brand' : "Implant Tech",
      'quantity': 8,
      'description': 'Roxolid SLActive surface for doctor and his operation',
      'image': 'assets/icons/implant2.png'
    },
    {
      'name': 'BioHorizons ',
      'height': '11.5 mm',
      'width': '4.6 mm',
      'radius': '4.6 mm',
      'brand' : "Implant Tech",
      'quantity': 10,
      'description': 'Laser-Lok microchannel technology',
      'image': 'assets/icons/implant3.png'
    },
    {
      'name': 'Nobel Biocare ',
      'height': '10 mm',
      'width': '3.5 mm',
      'radius': '3.5 mm',
      'brand' : "Implant Tech",
      'quantity': 15,
      'description': 'High Quality Premium implant for anterior region',
      'image': 'assets/icons/implant1.png'
    },
    {
      'name': 'Straumann ',
      'height': '12 mm',
      'width': '4.1 mm',
      'radius': '4.1 mm',
      'brand' : "Implant Tech",
      'quantity': 8,
      'description': 'Roxolid SLActive surface',
      'image': 'assets/icons/implant2.png'
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_checkout_outlined,
              color: Colors.white,
            )),
          )],
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        toolbarHeight: context.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(context.width * 0.06),
          ),
        ),
        title: Text("Implant Kits", style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.width * 0.04),
              margin: EdgeInsets.only(bottom: context.height * 0.02),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDarkMode ? Colors.grey[600]! : Colors.grey[400]!,
                  width: 1,
                ),
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
                    "This page allows you to select the appropriate implant and the tools needed for each procedure. "
                        "You can view the specific tools required for each implant by clicking 'View details'.",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: context.width * 0.035,
                      color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  Text(
                    "Note: The required tools for each implant can be found in the details section.",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: context.width * 0.035,
                      fontStyle: FontStyle.italic,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: implants.map((implant) => BuildImplantCard(context, implant)).toList(),
            ),
          ],
        ),
      ),
    );
  }

}