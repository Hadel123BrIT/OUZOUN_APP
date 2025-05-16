import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ouzoun/Core/Constances/all_colors.dart';
import '../Models/DrawItemModel.dart';
import 'CustomViewItemList.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key}); // أضف constructor

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<DrawItemModel> items=[
    DrawItemModel(text: 'HOMEPAGE', icon: Icons.home, function: (){

    }, ),
    DrawItemModel(text: 'SETTING', icon: Icons.settings,function: (){

    }),
    // DrawItemModel(text: 'NOTLFICATIONS', icon: Icons.notifications_active_sharp,function: (){}),
    DrawItemModel(text: 'MYPROFILE', icon: Icons.person,function: (){

    }),
    DrawItemModel(text: 'LOGOUT', icon: Icons.logout,function: ()async{

  }),

  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
    _triggerItemAnimations();
  }

  void _triggerItemAnimations() {
    for (int i = 0; i < items.length; i++) {
      Future.delayed(Duration(milliseconds: i * 150), () {
        if (mounted) {
          setState(() {
            items[i].animated = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: background,
      elevation: 0,
      child: Column(
        children: [
          ScaleTransition(
            scale: Tween(begin: 0.5, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.elasticOut,
              ),
            ),
            child: DrawerHeader(
              child: Icon(
                FontAwesomeIcons.solidHeart,
                size: 56,
                color: greenlight,
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomViewItemList(items: items),
        ],
      ),
    );
  }
}