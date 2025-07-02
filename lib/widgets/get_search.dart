// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// class Getsearch extends StatelessWidget {
//   const Getsearch({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: context.height * 0.06,
//               decoration: BoxDecoration(color: Colors.grey[300]),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Search",
//                   hintStyle:TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: context.width * 0.05),
//           Container(
//             height: context.height * 0.06,
//             width: context.width * 0.1,
//             decoration: BoxDecoration(color: Colors.grey[300]),
//             child: Center(
//
//               child: Icon(Icons.filter_list_sharp),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
