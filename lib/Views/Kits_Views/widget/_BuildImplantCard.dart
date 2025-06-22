import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomButton.dart';
import '_BuildDetailRow.dart';

Widget BuildImplantCard(BuildContext context, MediaQueryHelper media, Map<String, dynamic> implant) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Container(
    margin: EdgeInsets.symmetric(vertical: media.height * 0.01),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: isDarkMode
              ? Colors.black.withOpacity(0.5)
              : Colors.grey.withOpacity(0.3),
          blurRadius: 8,
          spreadRadius: 1,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
          width: 1.5,
        ),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(media.width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: media.width * 0.2,
                  height: media.width * 0.2,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(implant['image']),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: media.width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        implant['name'],
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: media.height * 0.01),
                    Row(
                      children: [
                        BuildDetailRow('height:', implant['height']),
                        SizedBox(width: 20),
                        BuildDetailRow('width:', implant['width']),
                      ],
                    ),
                    Row(
                      children: [
                        BuildDetailRow('radius:', implant['radius']),
                        SizedBox(width: 20),
                        BuildDetailRow('quantity:', '${implant['quantity']}'),
                      ],
                    ),
                    SizedBox(height: media.height * 0.01),
                  ],
                ),
              ],
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              implant['description'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Montserrat'
              ),
            ),
            SizedBox(height: 12),
            Custombutton(
                onTap: (){},
                text: "View details",
                color: green
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
