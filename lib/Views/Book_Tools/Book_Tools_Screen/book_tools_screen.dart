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

class BookToolsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
   BookToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        //appBar: CustomAppbar(ScaffoldKey: scaffoldKey, title: '', text: "", keytool: media.width * 0.2,),
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(Icons.menu, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Center(
                      child:
                      Text("Choose what do you want".tr,
                        textAlign:TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,),

                    ),
                  ],
                ),
              ),
               SizedBox(height: 20),
              Getsearch(),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics:  NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            buildToolCard(
                              imagePath: 'assets/icons/mouth-mirror.png',
                              toolName: 'mouth-mirror',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/probe.png',
                              toolName: 'probe',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/forceps.png',
                              toolName: 'forceps',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/tooth.png',
                              toolName: 'tooth',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/mouth-mirror.png',
                              toolName: 'mouth-mirror',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/probe.png',
                              toolName: 'probe',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/forceps.png',
                              toolName: 'forceps',
                            ),
                            buildToolCard(
                              imagePath: 'assets/icons/tooth.png',
                              toolName: 'tooth',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}