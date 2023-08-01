// import 'package:flutter/material.dart';
//
// class QrResult extends StatelessWidget {
//   const QrResult({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(top: 50 , left: 10),
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 130),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Welcome To On Time App !',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Your scan time is',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Text(
//                         '10:42 AM',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Monday , Mar 07 , 2022',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Image.asset(
//                         'path_to_your_image',
//                         width: 200,
//                         height: 200,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.location_on, color: Colors.black),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Monday , Mar 07 , 2022 : office',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 16,
//                 left: 16,
//                 child: Row(
//                   children: [
//                     ClipOval(
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         color: Colors.blue,
//                         child: IconButton(
//                           icon: const Icon(Icons.arrow_back),
//                           onPressed: () {
//                             Navigator.pop(context); // Replace with the desired navigation action
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'Attendance',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ) ,
//       ),
//     );
//   }
// }
