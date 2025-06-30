
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Routes/app_routes.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import 'buildOptionButton.dart';

Widget BuildBody(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          AppAssets.doctorForHomePage,
          fit: BoxFit.contain,
          repeat: false,
          width: 350,
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildOptionButton(
              color: AppColors.primaryGreen,
              context: context,
              icon: Icons.health_and_safety,
              label: "Surgical  Kits",
              onTap: () {
                Get.toNamed(AppRoutes.surgical_kit);
              },
            ),
            buildOptionButton(
              color: AppColors.primaryGreen,
              context: context,
              icon: Icons.add_circle_outline,
              label: "Additional Kits",
              onTap: () {
                Get.toNamed(AppRoutes.additional_kit);
              },
            ),
            buildOptionButton(
              color: AppColors.primaryGreen,
              context: context,
              icon: Icons.medical_services,
              label: "Implant Kits",
              onTap: () {
                Get.toNamed(AppRoutes.implant_kit);
              },
            ),
          ],
        ),
      ),
    ],
  );
}

