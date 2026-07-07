// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/screens/grouped_content_screen.dart';

// contentBucketOnCardClick(clickedBucket) {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//   contentBucketController.mainFilterList =
//       jsonDecode(clickedBucket['main_filter']);

//   contentBucketController.detailsRequireForGroupingData['airtable_table_id'] =
//       clickedBucket['airtable_table_id'].toString();

//   contentBucketController.detailsRequireForGroupingData['is_pyp'] =
//       clickedBucket['is_pyp'].toString();

//   contentBucketController.detailsRequireForGroupingData['related_exam'] =
//       contentBucketController.possibleExamList[
//           contentBucketController.selectedIndexInPossibleExamList.value];
//   contentBucketController.mainFilterListSelectedIndex.value = 0;
//   Get.to(() => const GroupedContentScreen(),
//       duration: const Duration(milliseconds: 500),
//       transition: Transition.rightToLeft);
// }
