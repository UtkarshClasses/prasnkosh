// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:teach_advance/apis/groupbyDataByColumnAPI.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;
// Widget collectionSubjectChapterTabs() {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//   var list = contentBucketController.mainFilterList;
//   return Padding(
//     padding: const EdgeInsets.only(top: 2.0, left: 6),
//     child: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: <Widget>[
//           for (int i = 0; i < list.length; i++)
//             Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: Obx(() => GFButtonBadge(
//                     shape: GFButtonShape.pills,
//                     onPressed: () async {
//                       contentBucketController
//                           .mainFilterListSelectedIndex.value = i;
//                       groupByDataByColumnName();
//                     },
//                     text: list[i],
//                     color: colors.leftGradient,
//                     textStyle: TextStyle(
//                       fontFamily: "Mont",
//                       fontWeight: FontWeight.bold,
//                       color: (contentBucketController
//                                   .mainFilterListSelectedIndex.value ==
//                               i)
//                           ? Colors.white
//                           : colors.leftGradient,
//                     ),
//                     type: (contentBucketController
//                                 .mainFilterListSelectedIndex.value ==
//                             i)
//                         ? GFButtonType.solid
//                         : GFButtonType.outline,
//                   )),
//             ),
//         ],
//       ),
//     ),
//   );
// }
