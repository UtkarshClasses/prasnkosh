import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/apis/filter_data.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:http/http.dart' as http;
import '../controllers/filter_list_controller.dart';

getSuggestionsAPI(columnName) async {
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var filterListController = Get.put(FilterListController());

  if (filterListController
          .filtersMap['lastColumnHitForGettingDiscussion'].value ==
      columnName) {
    var keyName = getKeyNameByColumnName(columnName);
    return filterListController.filtersMap[keyName]['possible_item'].value;
  }

  filterListController.filtersMap['lastColumnHitForGettingDiscussion'].value =
      columnName;
  var payload = {};
  var requiredList = [];

  if (columnName == "subject") {
    for (var element in filterListController.filtersMap["Exam"]
        ['selected_item']) {
      requiredList.add(element.id);
    }
  }else if (columnName == "subject") {
    for (var element in filterListController.filtersMap["Exam"]
    ['selected_item']) {
      requiredList.add(element.id);
    }
  } else if (columnName == "chapter") {
    for (var element in filterListController.filtersMap["Subject"]
        ['selected_item']) {
      requiredList.add(element.id);
    }
  } else if (columnName == "topic") {
    for (var element in filterListController.filtersMap["Chapter"]
        ['selected_item']) {
      requiredList.add(element.id);
    }
  } else {
    for (var element in filterListController.filtersMap['addFilterModalData']
        ['possible_item']) {
      if (filterListController.filtersMap[element]['visibility'].value &&
          filterListController.filtersMap[element]['selected_item'].length >
              0) {
        for (var data in filterListController.filtersMap[element]
            ['selected_item']) {
          requiredList.add(data.id);
        }
        payload[element] = requiredList;
      }
    }
  }

  // payload.remove(getKeyNameByColumnName(columnName));
  var url = Uri.parse('${globalvariable.nodeBaseURL}getFilter');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'columnName': columnName,
      'payload': requiredList.join(",")
    },
  );
  var temp = FilterData.fromJson(jsonDecode(response.body));

  // var requiredList = [];
  // for (var element in temp.data!) {
  //   // if (element[columnName] != null) {
  //     requiredList.add(element.title);
  //   // }
  // }
  return temp.data;
}

getKeyNameByColumnName(columnName) {
  switch (columnName) {
    case "category":
      return "Category";
    case "batch":
      return "Batch";
    case "city":
      return "City";
    case "board":
      return "Board";
    case "subject":
      return "Subject";
    case "exam":
      return "Exam";
    case "chapter":
      return "Chapter";
    case "date":
      return "Date";
    case "year":
      return "Year";
    case "collection":
      return "Collection";
    default:
      return "";
  }
}
