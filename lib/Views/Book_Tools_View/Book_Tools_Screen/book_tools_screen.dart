import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import 'package:ouzoun/Widgets/CustomDrawer.dart';
import 'package:ouzoun/Widgets/CustomText.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomAppbar.dart';
import '../../../Widgets/buildToolCard.dart';
import '../../../Widgets/getSearch.dart';
import '../Book_Tools_Controller/book_tools_controller.dart';

class BookToolsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  BookToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookToolsController());
    final media = MediaQueryHelper(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            scaffoldKey.currentState?.openDrawer();
          }, icon: Icon(Icons.menu,
            color: Colors.white,
          )),
          backgroundColor: green,
          toolbarHeight: media.height* 0.1, // 80 replaced
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(media.width * 0.06), // 22 replaced
            ),
          ),
          title: Text("Choose what do you want.".tr,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            Obx(() => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () => controller.showCartDialog(context, controller),
                ),
                if (controller.selectedTools.isNotEmpty)
                  Positioned(
                    right: media.width * 0.02,
                    top: media.height * 0.01,
                    child: CircleAvatar(
                      radius: media.width * 0.025,
                      backgroundColor: Colors.red,
                      child: Text(
                        controller.selectedTools.length.toString(),
                        style: TextStyle(fontSize: media.width * 0.025, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            )),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        //body:
      ),
    );
  }
}