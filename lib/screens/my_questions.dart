import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gradient_container/gradient_container.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/question_view_default_mode.dart';
import 'package:teach_advance/utility/question_view_list_mode.dart';
import 'package:teach_advance/utility/settingsTransferSetDeleteButton.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

class MyQuestions extends StatelessWidget {
  MyQuestions(this.isSaveBtn,{super.key});
  final bool isSaveBtn;
  final TextEditingController controller = new TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
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
                      "my_question_screen",isSaveBtn),
                  settingsTransferSetDeleteButton(isSaveBtn),
                  topbar2(true, scrollToXIndex, (position) {
                    // _pageController.jumpToPage(position);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: "Enter question id",
                              hintStyle: TextStyle(fontFamily: "serif"),

                              labelStyle: TextStyle(color: Colors.black),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),

                          onChanged: (text)
                          {

                          },
                        ),
                      ),
                      InkWell(onTap: () {
                        if(controller.text.isNotEmpty) {
                          List filteredData = manageShowingContent
                              .questionListForSelectionBackup
                              .where((question) =>
                              question["record_id"].contains(controller.text))
                              .toList();
                          if(filteredData.isEmpty)
                            {
                              EasyLoading.showToast("Question not found");
                              return;
                            }
                          manageShowingContent.questionListForSelection.value =
                              filteredData;
                        }

                      }, child: Icon(Icons.search))
                    ],
                  )
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
            : questionViewDefaultMode())

        // Expanded(
        //         child: PageView.builder(
        //             allowImplicitScrolling:false,
        //             controller: _pageController,
        //             itemCount: manageShowingContentController
        //                 .questionListForSelection.length,
        //             onPageChanged: (int page) {
        //               manageShowingContentController
        //                   .questionListVisibleIndex.value = page;
        //             },
        //             itemBuilder: (BuildContext context, int index) {
        //               return questionViewDefaultMode();
        //             }),
        //       )),
      ],
    ));
  }
}
