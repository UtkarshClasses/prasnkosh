// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:teach_advance/apis/groupbyDataByColumnAPI.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/utility/collectionSubjectChapterTabs.dart';
// import 'package:teach_advance/utility/groupedDataScreenSearchBar.dart';
// import 'package:teach_advance/utility/subject_list.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;

// import '../utility/appBarNew.dart';

// class GroupedContentScreen extends StatelessWidget {
//   const GroupedContentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ContentBucketController contentBucketController =
//         Get.put(ContentBucketController());
//     groupByDataByColumnName();
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             appBarNew("Content", 25, 10, 16),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: collectionSubjectChapterTabs(),
//                 ),
//               ],
//             ),
//             Expanded(
//                 child: Obx(() => (contentBucketController
//                         .groupedContentFetchedFromDB.isEmpty)
//                     ? Center(
//                         child: CircularProgressIndicator(
//                           color: colors.leftGradient,
//                         ),
//                       )
//                     : Column(
//                         children: [
//                           groupedDataScreenSearchBar(),
//                           Expanded(
//                             child: subjectList(contentBucketController
//                                 .groupedContentFetchedFromDB),
//                           ),
//                         ],
//                       ))),
//           ],
//         ),
//       ),
//     );
//   }
// }
