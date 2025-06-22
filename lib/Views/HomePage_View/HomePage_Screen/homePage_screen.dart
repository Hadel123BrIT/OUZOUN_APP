import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomBottomNavigationBar .dart';
import '../../../Widgets/CustomDrawer.dart';
import '../../Kits_Views/Kits_Controller/kits_controller.dart';
import '../HomePage_Controller/homePage_controller.dart';
import '../widget/build_body.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[300],
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.06,
          height: MediaQuery.of(context).size.width * 0.06,
          child: Icon(Icons.home, color: Colors.black),
        ),
        onPressed: () {
          Get.find<NavigationController>().changeIndex(2);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        toolbarHeight: media.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(media.width * 0.06),
          ),
        ),
        title: Text("Welcome Doctor",
            style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: green,
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: buildBody(context),

    );
  }

}