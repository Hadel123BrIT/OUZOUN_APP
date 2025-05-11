import 'package:flutter/material.dart';
import 'package:ouzoun/core/constances/all_colors.dart';
import '../../Widgets/buildChoiceCard.dart';

class DoctorChoicesScreen extends StatelessWidget {
  const DoctorChoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.07,
          horizontal: screenSize.width * 0.05,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Doctor",
                style: TextStyle(
                  color: green,
                  fontSize: isPortrait
                      ? screenSize.width * 0.1
                      : screenSize.height * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),

              Text(
                "Please choose the procedure type",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: isPortrait
                      ? screenSize.width * 0.055
                      : screenSize.height * 0.055,
                ),
              ),

              SizedBox(height: screenSize.height * 0.08),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceCard(
                    icon: Icons.add_circle_outline,
                    title: "عملية جديدة",
                    subtitle: "بدء علاج جديد",
                    color: Colors.blue[100]!,
                    textColor: Colors.blue[800]!,
                    onTap: () {},
                    height: screenSize.height * 0.25,
                  ),
                  ChoiceCard(
                    icon: Icons.build_outlined,
                    title: "تعويض مواد",
                    subtitle: "إكمال علاج موجود",
                    color: Colors.green[100]!,
                    textColor: Colors.green[800]!,
                    onTap: () {},
                    height: screenSize.height * 0.25,
                  ),
                ],
              ),

              const Spacer(),

              Image.asset(
                'assets/icons/dentist-day.png',
                width: isPortrait
                    ? screenSize.width * 0.4
                    : screenSize.height * 0.4,
                fit: BoxFit.contain,
              ),

              SizedBox(height: screenSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}