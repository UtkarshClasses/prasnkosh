//   import 'package:get/get.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';

// filterFunctionOnContentBucketScreen() {
//       final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//     List temp = contentBucketController.contentBucketListBackup;
//     List relatedExamFiltered = temp
//         .where(((o) => o['related_exam']
//             .contains(contentBucketController.possibleExamList[contentBucketController.selectedIndexInPossibleExamList.value])))
//         .toList();
//     List previousYearFiltered = relatedExamFiltered
//         .where(((o) => o['is_pyp']
//             .contains(contentBucketController.relatedPreviousTabSelectedIndex.value.toString())))
//         .toList();
//     contentBucketController.contentBucketList.value = previousYearFiltered;
//   }