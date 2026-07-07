// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/utility/app_bar_custom.dart';
// import 'package:teach_advance/utility/contentBucketScreenSearchBar.dart';
// import 'package:teach_advance/utility/content_bucket.dart';
// import 'package:teach_advance/utility/rectangular_tabs.dart';
// import 'package:teach_advance/utility/relatedPreviousButtonWidget.dart';

// class ContentBucketScreen extends StatelessWidget {
//   const ContentBucketScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ContentBucketController contentBucketController =
//         Get.put(ContentBucketController());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           appBarNew("Select Exams", 25, 30, 6, 0, 10),
//           moreOptions(),
//           contentBucketScreenSearchBar(
//               contentBucketController.contentBucketListBackup),
//           Row(
//             children: [
//               relatedPreviousButtonWidget(),
//             ],
//           ),
//           Obx(() => Expanded(
//                 child: contentBucketContainer(
//                     context, contentBucketController.contentBucketList),
//               )),
//         ],
//       ),
//     );
//   }
// }
