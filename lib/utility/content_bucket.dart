// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:teach_advance/functions/contentBucketCardClick.dart';
// import 'package:teach_advance/utility/cachedImageNetwork.dart';

// Widget contentBucketContainer(context, contentBucketList) {
//   return SingleChildScrollView(
//     child: Wrap(
//       spacing: 2,
//       runSpacing: 2,
//       children: [
//         for (int i = 0; i < contentBucketList.length; i++) ...[
//           GestureDetector(
//             onTap: () async {
//               contentBucketOnCardClick(contentBucketList[i]);
//             },
//             child: Card(
//               elevation: 6,
//               shadowColor: Colors.blueGrey,
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.98 * 0.18,
//                 width: MediaQuery.of(context).size.width * 0.98 * 0.48,
//                 child: Container(
//                   color: Colors.transparent,
//                   margin: const EdgeInsets.all(2),
//                   child: SizedBox.fromSize(
//                     size: const Size.fromRadius(48), // Image radius
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(4.0),
//                             child: cachedImageNetwork(
//                                 contentBucketList[i]['background_image']),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 1.0),
//                           child: AutoSizeText(
//                             contentBucketList[i]['title'],
//                             style: const TextStyle(
//                               fontFamily: "Mont",
//                               fontWeight: FontWeight.bold,
//                             ),
//                             minFontSize: 8,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ]
//       ],
//     ),
//   );
// }
