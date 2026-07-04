import 'package:get/get.dart';

class ManageShowingContent extends GetxController {
  RxString language = "hin"
      .obs; // ye variable control karega ... kis language me question view karna hai
  RxInt questionListVisibleIndex = 0
      .obs; // ye variable control karega ... kaun sa question abhi render ho raha hai
  RxList questionListForSelection = []
      .obs; // ye variable responsible hai ... kaun sa questions selection ke liye available hai
  List questionListForSelectionBackup = [];
  RxInt questionViewMode = 1
      .obs; // two mode → viewQuestionDefaultMode and listMode; 0 = listMode and 1 = viewQuestionDefaultMode;
  RxList selectedQuestions = []
      .obs; // users ne kaun kaun se questions kisi particular set me select karke rakha hai
  RxMap usedQuestions = {
    "record_id_list": [].obs,
    "list_object": [].obs
  }.obs; // es varaible me db se data laakar store kar lete hain ... already usage ki jaankari lene ke liye

  RxMap selectedSetForOperation = {
    "set_name":
        "", // kis set par kaam chal raha hai ... usko access karne ke liye
    "set_id":
        -1, // api request me selected set ke saath operation karne ke liye is variable ka use hota hai
    "set_password":
        "", // setting modal me password database se laate hain aur dikhate hain
    "global_access":
        -1, // eska value ... setting modal me radio button (Global Access) ko control karne ke liye hota hai
    "editing_access":
        -1, // eska value ... setting modal me radio button (Allow Editing) ko control karne ke liye hota hai
  }.obs; // home screen par jaise hee koi set select karte hain to es variable me selected set ka jaruri data store kar lete hain
}
