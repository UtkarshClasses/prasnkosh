import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:teach_advance/utility/FilterScreenComponents/collection_filter_widget.dart';
import 'package:teach_advance/utility/FilterScreenComponents/date.dart';
import 'package:teach_advance/utility/FilterScreenComponents/exams_filter_widget.dart';
import 'package:teach_advance/utility/FilterScreenComponents/show_add_filter_modal.dart';
import 'package:teach_advance/utility/FilterScreenComponents/subject_filter_widget.dart';
import '../controllers/filter_list_controller.dart';
import '../functions/get_question_on_condition.dart';
import '../utility/FilterScreenComponents/board_filter_widget.dart';
import '../utility/FilterScreenComponents/category_filter_widget.dart';
import '../utility/FilterScreenComponents/chapter_filter_widget.dart';
import '../utility/FilterScreenComponents/previous_year_non_previous_year_filter.dart';
import '../utility/FilterScreenComponents/topic_filter_widget.dart';
import '../utility/FilterScreenComponents/year_filter_widget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var filterListController = Get.put(FilterListController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 16.0,
          onPressed: () {
            addFilterModal(context);
          },
          label: const Text('Filters'),
          icon: const Icon(Icons.filter_list),
          backgroundColor: colors.leftGradient,
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Obx(() => previousYearNonPreviousYearRadioWidget()),
                Obx(() => filterListController
                        .filtersMap['Category']['visibility'].value
                    ? categoryFilterWidget(context)
                    : Container()),
                Obx(() =>
                    filterListController.filtersMap['Board']['visibility'].value
                        ? boardFilterWidget(context)
                        : Container()),
                Obx(() =>
                    filterListController.filtersMap['Exam']['visibility'].value
                        ? examsFilterWidget(context)
                        : Container()),
                Obx(() =>
                    filterListController.filtersMap['Year']['visibility'].value
                        ? yearFilterWidget(context)
                        : Container()),
                Obx(() =>
                    filterListController.filtersMap['Date']['visibility'].value
                        ? dateFilterWidget(context)
                        : Container()),
                Obx(() => filterListController
                        .filtersMap['Subject']['visibility'].value
                    ? subjectFilterWidget(context)
                    : Container()),
                Obx(() => filterListController
                        .filtersMap['Chapter']['visibility'].value
                    ? chapterFilterWidget(context)
                    : Container()),
                Obx(() => filterListController
                    .filtersMap['Topic']['visibility'].value
                    ? topicFilterWidget(context)
                    : Container()),
                Obx(() => filterListController
                        .filtersMap['Collection']['visibility'].value
                    ? collectionFilterWidget(context)
                    : Container()),
                GFButton(
                  size: GFSize.LARGE,
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  color: colors.leftGradient,
                  onPressed: () async {
                    await getQuestionOnCondition();
                  },
                  text: "Get Questions",
                  textStyle: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
