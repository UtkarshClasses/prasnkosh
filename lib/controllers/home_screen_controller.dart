import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList mySets = [].obs;
  List mySetsBackup = [];
  RxList setFolderList = [].obs;
}

voidReInitialiseHomeScreenController() {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  homeScreenController.mySets.value = [];
  homeScreenController.mySetsBackup = [];
  homeScreenController.setFolderList.value = [];
}

void extractCategory(setList) {
  var temp = [];
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  for (var element in setList) {
    temp.add(element['folder_name']);
  }
  homeScreenController.setFolderList.value = temp.toSet().toList();
}

filterFolder(filterKey) {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  var filterSetList = [];
  for (var element in homeScreenController.mySetsBackup) {
    if (element['folder_name'] == filterKey) {
      filterSetList.add(element);
    }
  }
  return filterSetList;
}
