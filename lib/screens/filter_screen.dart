import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:teach_advance/screens/add_number_question.dart';
import 'package:teach_advance/utility/FilterScreenComponents/city_filter_widget.dart';
import 'package:teach_advance/utility/FilterScreenComponents/collection_filter_widget.dart';
import 'package:teach_advance/utility/FilterScreenComponents/date.dart';
import 'package:teach_advance/utility/FilterScreenComponents/exams_filter_widget.dart';
import 'package:teach_advance/utility/FilterScreenComponents/show_add_filter_modal.dart';
import 'package:teach_advance/utility/FilterScreenComponents/subject_filter_widget.dart';
import '../apis/filter_data.dart';
import '../controllers/filter_list_controller.dart';
import '../functions/get_question_on_condition.dart';
import '../utility/FilterScreenComponents/batch_filter_widget.dart';
import '../utility/FilterScreenComponents/board_filter_widget.dart';
import '../utility/FilterScreenComponents/category_filter_widget.dart';
import '../utility/FilterScreenComponents/chapter_filter_widget.dart';
import '../utility/FilterScreenComponents/previous_year_non_previous_year_filter.dart';
import '../utility/FilterScreenComponents/topic_filter_widget.dart';
import '../utility/FilterScreenComponents/year_filter_widget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  int langeCode = 1;
  static const int numberOfQuestionsLimit = 10;
  final List<Data> data12 = [
    Data(id: "0", title: "Jodhpur", coverImage: ""),
    Data(id: "0", title: "Jaipur", coverImage: ""),
    Data(id: "0", title: "Prayagraj", coverImage: ""),
    Data(id: "0", title: "Indore", coverImage: ""),
  ];

  @override
  Widget build(BuildContext context) {
    var filterListController = Get.put(FilterListController());
    if (filterListController
        .filtersMap["City"]["selected_item"].value.isEmpty) {
      filterListController.filtersMap["City"]["selected_item"].value = [
        data12[0]
      ];
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Choose city",
                    style: TextStyle(
                        fontFamily: "Poppins", fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: List.generate(data12.length, (index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() {
                              String? value1 = filterListController
                                          .filtersMap['selectedCity'].value ==
                                      data12[index].title
                                  ? data12[index].title
                                  : "";
                              return GFRadio(
                                size: 25,
                                value: value1,
                                groupValue: filterListController
                                    .filtersMap['selectedCity'].value,
                                onChanged: (value) {
                                  filterListController
                                      .filtersMap['selectedCity']
                                      .value = data12[index].title;
                                  List<dynamic> data = [];
                                  data.add(data12[index]);
                                  filterListController
                                      .filtersMap["City"]["selected_item"]
                                      .value = data;
                                },
                                inactiveIcon: null,
                                activeBorderColor: colors.leftGradient,
                                radioColor: colors.leftGradient,
                              );
                            }),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Text(
                                data12[index].title.toString(),
                                style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                // Obx(() => previousYearNonPreviousYearRadioWidget()),
                Obx(() => filterListController
                        .filtersMap['Category']['visibility'].value
                    ? categoryFilterWidget(context)
                    : Container()),
                // Obx(() =>
                //     filterListController.filtersMap['City']['visibility'].value
                //         ? cityFilterWidget(context)
                //         : Container()),
                Obx(() =>
                    filterListController.filtersMap['Batch']['visibility'].value
                        ? batchFilterWidget(context)
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
                Obx(() =>
                    filterListController.filtersMap['Topic']['visibility'].value
                        ? topicFilterWidget(context)
                        : Container()),
                Obx(() => filterListController
                        .filtersMap['Collection']['visibility'].value
                    ? collectionFilterWidget(context)
                    : Container()),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Select Language",
                    style: TextStyle(
                        fontFamily: "Poppins", fontWeight: FontWeight.bold),
                  ),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GFRadio(
                                  size: GFSize.SMALL,
                                  value: 1,
                                  groupValue: filterListController
                                      .filtersMap['language'].value,
                                  onChanged: (value) {
                                    filterListController
                                        .filtersMap['language'].value = value;
                                    langeCode = 1;
                                  },
                                  inactiveIcon: null,
                                  activeBorderColor: colors.leftGradient,
                                  radioColor: colors.leftGradient,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GFRadio(
                                  size: GFSize.SMALL,
                                  value: 2,
                                  groupValue: filterListController
                                      .filtersMap['language'].value,
                                  onChanged: (value) {
                                    filterListController
                                        .filtersMap['language'].value = value;
                                    langeCode = 2;
                                  },
                                  inactiveIcon: null,
                                  activeBorderColor: colors.leftGradient,
                                  radioColor: colors.leftGradient,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Hindi",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GFRadio(
                                  size: GFSize.SMALL,
                                  value: 3,
                                  groupValue: filterListController
                                      .filtersMap['language'].value,
                                  onChanged: (value) {
                                    filterListController
                                        .filtersMap['language'].value = value;
                                    langeCode = 3;
                                  },
                                  inactiveIcon: null,
                                  activeBorderColor: colors.leftGradient,
                                  radioColor: colors.leftGradient,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Both",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 8),
                GFButton(
                  size: GFSize.LARGE,
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  color: colors.leftGradient,
                  onPressed: () async {
                    // Navigator.push(context, MaterialPageRoute(builder:(context)=> AddNumberQuestion()));

                    if (filterListController
                        .filtersMap["Batch"]['selected_item'].value.isEmpty) {
                      EasyLoading.showToast("Please select batch");
                      return;
                    }

                    await getQuestionOnCondition(
                        langeCode, numberOfQuestionsLimit.toString());
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
