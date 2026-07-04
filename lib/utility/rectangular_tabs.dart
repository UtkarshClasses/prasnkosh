// import 'package:get/get.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:teach_advance/functions/filterFunctionOnContentBucketScreen.dart';

// Widget moreOptions() {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());

//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(4.0),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(top: 8.0, right: 6.0, bottom: 6.0, left: 6.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               Obx(() => (Row(
//                     children: [
//                       for (int i = 0;
//                           i < contentBucketController.possibleExamList.length;
//                           i++)
//                         element(
//                             contentBucketController.possibleExamList[i],
//                             contentBucketController.possibleExamListImages[i],
//                             32,
//                             (contentBucketController
//                                         .selectedIndexInPossibleExamList
//                                         .value ==
//                                     i)
//                                 ? true
//                                 : false,
//                             i),
//                     ],
//                   )))
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget element(name, icon, size, isSelected, itemIndex) {
//   return GestureDetector(
//     onTap: () {
//       final ContentBucketController contentBucketController =
//           Get.put(ContentBucketController());
//       contentBucketController.selectedIndexInPossibleExamList.value = itemIndex;
//       filterFunctionOnContentBucketScreen();
//     },
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(2),
//           color: isSelected ? Colors.blueGrey.shade100 : Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 14.0,
//                 backgroundImage: AssetImage('assets/images/$icon'),
//               ),
//               Text(
//                 name,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.w800,
//                   fontFamily: "serif",
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
