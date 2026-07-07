import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import '../apis/filter_data.dart';
import '../controllers/filter_list_controller.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
class AddNumberQuestion extends StatefulWidget {
  const AddNumberQuestion({super.key});

  @override
  State<AddNumberQuestion> createState() => _AddNumberQuestionState();
}

const colorF2F2F2 = Color(0xffF2F2F2);
TextEditingController numberQuestion = TextEditingController();
var filterListController = Get.put(FilterListController());
List<Data> selectedTopic =
    filterListController.filtersMap['Topic']['selected_item'].cast<Data>();

class _AddNumberQuestionState extends State<AddNumberQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: colorF2F2F2,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total No. Question Available",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: colorF2F2F2,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text(
                          "800",
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      width: 200,
                      child: TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style:const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter the value of question required'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: colorF2F2F2,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text(
                          "90/300",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            int questionNumber = index + 1;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Topic-$questionNumber',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.red)),
                        TextSpan(
                            text: ":${selectedTopic[index].title}"),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        border: Border.all(
                            color: const Color(0xff707070), width: 1)),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7)),
                              color: colorF2F2F2),
                          padding: const EdgeInsets.all(8.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                "Low",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Medium",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "High",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Available",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5,),
                                  SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration:const InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)),borderSide: BorderSide(width: 1,color: Colors.black)),

                                      ),

                                    ),

                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Available",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5,),
                                  SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)),borderSide: BorderSide(width: 1,color: Colors.black)),

                                      ),

                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Available",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5,),
                                  SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)),borderSide: BorderSide(width: 1,color: Colors.black)),

                                      ),

                                    ),

                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: selectedTopic.length,
        )),
        Obx(() => Container(
          padding:const EdgeInsets.all(8.0) ,
          color: colorF2F2F2,
          child: Row(
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
                        },
                        inactiveIcon: null,
                        activeBorderColor: colors.leftGradient,
                        radioColor: colors.leftGradient,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Random Select",
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
                        },
                        inactiveIcon: null,
                        activeBorderColor: colors.leftGradient,
                        radioColor: colors.leftGradient,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Manual Select",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(10 ),
          child: GFButton(
            size: GFSize.LARGE,
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            color:const Color(0xFFD1D1D1),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> const AddNumberQuestion()));

              // if (filterListController
              //     .filtersMap["Batch"]['selected_item'].value.isEmpty) {
              //   EasyLoading.showToast("Please select batch");
              //   return;
              // }
              //
              // await getQuestionOnCondition(langeCode);
            },
            text: "Generate Paper",
            textStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
