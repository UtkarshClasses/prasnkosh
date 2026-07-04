import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_container/gradient_container.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/question_view_default_mode.dart';
import 'package:teach_advance/utility/question_view_list_mode.dart';
import 'package:teach_advance/utility/settingsTransferSetDeleteButton.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

class MyQuestions extends StatelessWidget {
  MyQuestions({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void scrollToXIndex(index) {
    itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final ManageShowingContent manageShowingContentController =
        Get.put(ManageShowingContent());
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)),
            child: GradientContainer(
              colors: [
                Colors.red.shade300,
                Colors.pink.shade300,
                Colors.amber.shade300
              ],
              child: Column(
                children: [
                  topbar1(
                      // context esliye le rahe hain kyunki eska use filterlist wale package ko hota hai
                      context,
                      Icons.widgets,
                      manageShowingContentController
                          .selectedSetForOperation['set_name'],
                      "my_question_screen"),
                  settingsTransferSetDeleteButton(),
                  topbar2(true, scrollToXIndex),
                ],
              ),
            ),
          )
        ]),
        Obx(() => questionPallete(
            manageShowingContentController.questionListForSelection.length,
            scrollToXIndex)),
        // questionAndOptionAndSolution(
        //     manageShowingContentController.questionListForSelection),
        // bottomAction()
        Obx(() => (manageShowingContentController.questionViewMode.value == 0)
            ? listMode(itemScrollController, itemPositionsListener)
            : questionViewDefaultMode()),
      ],
    ));
  }
}
