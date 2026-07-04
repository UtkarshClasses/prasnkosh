// import 'package:flutter/material.dart';
// import 'package:gradient_container/gradient_container.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/functions/groupedContentViewButtonClicked.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;
// import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;
// import 'package:get/get.dart';

// Widget subjectList(data) {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//   return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (BuildContext context, int index) {
//         int randomNumber = helperfunctions.randomNumber();
//         Color textColor_1 = colors.textColors[randomNumber];
//         Color backGroundColor_1 = colors.backGroundColors[randomNumber];
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 6.0),
//           child: Card(
//             shadowColor: colors.leftGradientLight,
//             elevation: 10,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () async {
//                           groupedContentViewButtonClick(data[index]);
//                         },
//                         child: ListTile(
//                           title: Text(
//                             data[index][contentBucketController.mainFilterList[
//                                 contentBucketController
//                                     .mainFilterListSelectedIndex.value]],
//                             style: const TextStyle(
//                               fontSize: 12.0,
//                               fontFamily: "Mont",
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           subtitle: Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: backGroundColor_1,
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(20))),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 2.0,
//                                     horizontal: 8.0,
//                                   ),
//                                   child: Text(
//                                     "${data[index]['total']} Questions",
//                                     style: TextStyle(
//                                       fontSize: 10.0,
//                                       color: textColor_1,
//                                       fontFamily: "serif",
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(500.0),
//                                 child: const GradientContainer(
//                                   height: 36,
//                                   width: 70,
//                                   colors: [Colors.red, Colors.pink],
//                                   child: Center(
//                                     child: Text(
//                                       "View",
//                                       style: TextStyle(
//                                         fontFamily: "serif",
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           leading: CircleAvatar(
//                             radius: 22,
//                             backgroundColor: textColor_1,
//                             child: Text(
//                               (index + 1).toString(),
//                               style: const TextStyle(
//                                 fontSize: 10.0,
//                                 color: Colors.white,
//                                 fontFamily: "serif",
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
