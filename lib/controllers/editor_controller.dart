import 'package:get/get.dart';

class EditorController extends GetxController {
  RxInt editorSelectedColumnIndex = 0.obs;
  List columnNames = [
    "question_hin",
    "question_eng",
    "solution_hin",
    "solution_eng",
    "subject",
    "chapter",
    "type",
    "previous_of",
    "option1_hin",
    "option1_eng",
    "option2_hin",
    "option2_eng",
    "option3_hin",
    "option3_eng",
    "option4_hin",
    "option4_eng",
    "option5_hin",
    "option5_eng",
    "answer"
  ];

  List columnNameShow = [
    "subject",
    "chapter",
    "type",
    "previous_of",
  ];
}
