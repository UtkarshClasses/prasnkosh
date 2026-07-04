import 'package:get/get.dart';

class ContentBucketController extends GetxController {
  var selectedIndexInPossibleExamList = 0.obs;
  List possibleExamList = [
    "SSC",
    "Railway",
    "Banking",
    "State Exams",
    "Technical",
    "Quiz",
    "Others"
  ];
  List possibleExamListImages = [
    "SSC.gif",
    "Railway.gif",
    "Banking.gif",
    "State.gif",
    "Technical.gif",
    "telegram.gif",
    "Others.gif"
  ];
  List mainFilterList = [];
  RxInt mainFilterListSelectedIndex = 0.obs;
  RxInt relatedPreviousTabSelectedIndex = 0.obs;
  RxList contentBucketList = [].obs;
  List contentBucketListBackup = [];
  RxList groupedContentFetchedFromDB = [].obs;
  RxMap detailsRequireForGroupingData = {
    "aitable_table_id": "",
    "related_exam": "",
    "is_pyp": "",
  }.obs;
}
