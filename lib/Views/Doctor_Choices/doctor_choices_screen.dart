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
    );
  }
}