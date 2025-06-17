import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; // أضف هذا الاستيراد
import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomBottomNavigationBar .dart';
import '../../../Widgets/CustomDrawer.dart';
import '../HomePage_Controller/homePage_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = Get.find<HomeController>();
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
      body: _buildBody(context),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildBody(BuildContext context) {
    final media = MediaQueryHelper(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Lottie.asset(
            'assets/animations/doctor1.json',
            fit: BoxFit.contain,
            repeat: false,
           width: 350,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOptionButton(
                color: green,
                context: context,
                icon: Icons.construction,
                label: "Surgical  Kits",
                textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,
                onTap: () {

                },
              ),
              _buildOptionButton(
                textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,
                color: green,
                context: context,
                icon: Icons.add_circle_outline,
                label: "Additional Kits",
                onTap: () {
                  // Action for Additional Tools
                },
              ),
              _buildOptionButton(
                textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,
                color: green,
                context: context,
                icon: Icons.agriculture,
                label: "Implant Kits",
                onTap: () {
                  // Action for Farming Tools
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionButton({
    required Color color,
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required TextAlign textAlign, TextStyle? style,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,
            label,

          ),
        ],
      ),
    );
  }
}