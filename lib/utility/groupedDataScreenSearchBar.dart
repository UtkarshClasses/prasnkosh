// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';
// import 'package:teach_advance/functions/groupedContentViewButtonClicked.dart';
// import 'package:teach_advance/utility/chipInList.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;

// Widget groupedDataScreenSearchBar() {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//   return Padding(
//     padding: const EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(4.0),
//       child: Container(
//         color: Colors.white,
//         child: GFSearchBar(
//           searchBoxInputDecoration: const InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderSide:
//                   BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
//             ),
//             prefixIcon: Icon(
//               Icons.search,
//               size: 30,
//             ),
//             hintText: "Search here...",
//           ),
//           searchList: contentBucketController.groupedContentFetchedFromDB,
//           searchQueryBuilder: (query, list) {
//             return list
//                 .where((item) =>
//                     item.toString().toLowerCase().contains(query.toLowerCase()))
//                 .toList();
//           },
//           noItemsFoundWidget: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text("No data found!"),
//           ),
//           overlaySearchListItemBuilder: (item) {
//             return suggestionList(item);
//           },
//           onItemSelected: (item) {
//             print(item);
//           },
//         ),
//       ),
//     ),
//   );
// }

// final ContentBucketController contentBucketController =
//     Get.put(ContentBucketController());
// Widget suggestionList(item) {
//   var selectedFilter = contentBucketController.mainFilterList[
//       contentBucketController.mainFilterListSelectedIndex
//           .value]; // chapter or collection or subject --- which one is selected
//   return ListTile(
//     title: Text(
//       item[selectedFilter].toString(),
//       style: const TextStyle(
//         fontSize: 12.0,
//         fontFamily: "Nunito",
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     trailing: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GFButton(
//           color: colors.leftGradient,
//           type: GFButtonType.outline,
//           onPressed: () => {
//             groupedContentViewButtonClick(item)
//           },
//           child: const Text(
//             "View",
//             style: TextStyle(fontFamily: "Mont"),
//           ),
//         )
//       ],
//     ),
//     subtitle: Row(
//       children: [
//         chipInList(Colors.blueGrey.shade50, Colors.black,
//             "${item['total']} Questions"),
//       ],
//     ),
//     leading: CircleAvatar(
//       radius: 22,
//       backgroundColor: Colors.blueGrey.shade50,
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(100.0),
//           child: Text(
//             (item[selectedFilter] == null || item[selectedFilter] == "")
//                 ? ""
//                 : item[selectedFilter].toUpperCase()[0].toString(),
//             style: const TextStyle(fontFamily: "serif", color: Colors.black),
//           )),
//     ),
//   );
// }
