import 'package:get/get.dart';

import '../apis/filter_data.dart';

class FilterListController extends GetxController {
  List<String> selectedItem = [].obs.cast<String>();
  List<String> listData = [].obs.cast<String>();
  List<Data> data = [].obs.cast<Data>();

  RxMap<String, dynamic> filtersMap = {
    "Category": {
      "visibility": false.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "City": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Batch": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Board": {
      "visibility": false.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Exam": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Year": {
      "visibility": false.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Subject": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Chapter": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Topic": {
      "visibility": true.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Date": {
      "visibility": false.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "Collection": {
      "visibility": false.obs,
      "selected_item": [].obs,
      "possible_item": [].obs,
    },
    "addFilterModalData": {
      "selectedItem": [
        "Category",
        "Board",
        "Exam",
        "Subject",
        "Chapter",
        "Topic"
      ].obs.cast<String>(),
      "possible_item": [
        "Category",
        "Board",
        "Exam",
        "Year",
        "Date",
        "Subject",
        "Chapter",
        "Topic",
        "Collection",
      ],
    },
    "onlyPreviousYear": 1.obs,
    "language": 1.obs,
    "lastColumnHitForGettingDiscussion": "".obs,
    "selectedCity":"Jodhpur".obs
  }.obs;
}
