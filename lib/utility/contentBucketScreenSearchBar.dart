// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:teach_advance/functions/contentBucketCardClick.dart';
// import 'package:teach_advance/utility/cachedImageNetwork.dart';
// import 'package:teach_advance/utility/chipInList.dart';
// import 'package:teach_advance/utility/colors.dart' as colors;

// Widget contentBucketScreenSearchBar(list) {
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
//             hintText: "Search exam or subject here...",
//           ),
//           searchList: list,
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

// Widget suggestionList(item) {
//   return ListTile(
//     title: Text(
//       item['title'].toString(),
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
//             contentBucketOnCardClick(item),
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
//         chipInList(Colors.blueGrey.shade50, Colors.black, item['related_exam']),
//       ],
//     ),
//     leading: CircleAvatar(
//       radius: 22,
//       backgroundColor: colors.leftGradient,
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(100.0),
//           child: cachedImageNetwork(item['background_image'])),
//     ),
//   );
// }
