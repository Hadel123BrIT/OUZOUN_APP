import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/draw_item_model.dart';
import '../core/constants/app_colors.dart';


class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.customdrawermodel});
  final DrawItemModel   customdrawermodel ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(customdrawermodel.icon,
      color: AppColors.primaryGreen,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(customdrawermodel.text.tr,
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
            )),
      ),
    onTap: () {
      print("Tapped on ${customdrawermodel.text}");
      customdrawermodel.function?.call();
    }
    //item.function?.call();
    );
  }
}
