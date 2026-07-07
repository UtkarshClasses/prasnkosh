// import 'package:get/get.dart';
// import 'package:teach_advance/apis/fetchQuestionsFromDBAPI.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/screens/question_selection_screen.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// final ContentBucketController contentBucketController =
//     Get.put(ContentBucketController());
// groupedContentViewButtonClick(kiskeViewButtonParClickHua) async {
//   EasyLoading.show(
//       indicator: Card(
//           shadowColor: Colors.blueGrey.shade100,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               height: 17.0,
//               width: 17.0,
//               child: CircularProgressIndicator(
//                 color: colors.leftGradient,
//               ),
//             ),
//           )),
//       maskType: EasyLoadingMaskType.black,
//       status: "Loading Questions...\nThis may take a while...",
//       dismissOnTap: true);
//   await fetchQuestionsFromDBAPI(
//       contentBucketController.mainFilterList[
//           contentBucketController.mainFilterListSelectedIndex.value],
//       kiskeViewButtonParClickHua[contentBucketController.mainFilterList[
//           contentBucketController.mainFilterListSelectedIndex.value]],
//       contentBucketController
//           .detailsRequireForGroupingData['airtable_table_id'],
//       contentBucketController.detailsRequireForGroupingData['related_exam']);
//   EasyLoading.dismiss();
//   Get.to(() => QuestionSelectionScreen(),
//       arguments: [
//         kiskeViewButtonParClickHua[contentBucketController.mainFilterList[
//             contentBucketController.mainFilterListSelectedIndex.value]]
//       ],
//       duration: const Duration(milliseconds: 500),
//       transition: Transition.rightToLeft);
// }
