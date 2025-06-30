import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../Widgets/custom_bottom_navigation_bar .dart';
import '../../../Widgets/custom_drawer.dart';
import '../../../core/constants/app_colors.dart';
import '../HomePage_Controller/homePage_controller.dart';
import '../widget/build_body.dart';

class HomePageScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
        toolbarHeight: context.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(context.width * 0.06),
          ),
        ),
        title: Text("Welcome Doctor",
            style: Theme.of(context).textTheme.titleSmall),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: BuildBody(context),

    );
  }

}