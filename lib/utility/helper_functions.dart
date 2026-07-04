import 'dart:math';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/screens/authentication.dart';

int randomNumber() {
  Random random = Random();
  return random.nextInt(9);
}

yyyymmddToLocalDate(date) {
  var day = date.substring(8, 10);
  var month = date.substring(5, 7);
  var year = date.substring(0, 4);
  const monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return day + " " + monthList[int.parse(month) - 1] + " " + year;
}

void assingUserdetais(
    userId, logoUrl, instituteName, teacherName, phoneNo, whatsappNo, token) {
  final userDetails = GetStorage();
  userDetails.write("user_id", userId);
  userDetails.write("logo_url", logoUrl);
  userDetails.write("token", token);
  userDetails.write("institute_name", instituteName);
  userDetails.write("teacher_name", teacherName);
  userDetails.write("phone_no", phoneNo);
  userDetails.write("whatsapp_no", whatsappNo);
}

confirmLogout() {
  final userDetails = GetStorage();
  Get.defaultDialog(
    content: Column(
      children: [
        const Text(
          "logout this account",
          style: TextStyle(fontFamily: "serif"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFButtonBadge(
                onPressed: () {
                  userDetails.erase();
                  Get.offAll(() => const Authentication());
                },
                text: "Logout",
                color: Colors.red,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                type: GFButtonType.solid,
              ),
              GFButtonBadge(
                onPressed: () {
                  Get.back();
                },
                text: "Cancel",
                color: Colors.grey,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                type: GFButtonType.outline,
              ),
            ],
          ),
        ),
      ],
    ),
    title: "Are you sure",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: colors.leftGradient,
  );
}

Widget getMathJxOrHtmlWidget(String s) {
  if (s.contains(r"$$")) {
    String temp = "";
    bool isOpenBracket = true;

    for (int i = 0; i < s.length;) {
      if (s[i] == r'$') {
        temp += isOpenBracket ? r"\(" : r"\)";
        isOpenBracket = !isOpenBracket;
        i += 2;
      } else {
        temp += s[i];
        i++;
      }
    }
    return TeXView(
        onRenderFinished: (height) {
          // height = height;
        },
        loadingWidgetBuilder: (context) => Container(
              height: 20.0,
            ),
        renderingEngine: const TeXViewRenderingEngine.katex(),
        child: TeXViewDocument(temp,
            style: TeXViewStyle(
                textAlign: TeXViewTextAlign.left,
                fontStyle:
                    TeXViewFontStyle(fontFamily: "Noto-Serif-Devnagri"))));
  } else if (s.contains(r"\(")) {
    return TeXView(
        onRenderFinished: (height) {
          // height = 20.0;
        },
        loadingWidgetBuilder: (context) => Container(
              height: 20.0,
            ),
        renderingEngine: const TeXViewRenderingEngine.katex(),
        child: TeXViewDocument(s,
            style: TeXViewStyle(
                // height: height,
                textAlign: TeXViewTextAlign.left,
                fontStyle: TeXViewFontStyle(
                    fontFamily: "Noto-Serif-Devnagri", fontSize: 18))));
  } else {
    return HtmlWidget(
      s,
      textStyle:
          const TextStyle(fontFamily: "Noto-Serif-Devnagri", fontSize: 16.5),
    );
  }
}

organisePayload(data) {
  // print(data);
  List organisedPayload = [];
  Map thisQuestionRequiredObject = {};
  for (var i = 0; i < data.length; i++) {
    thisQuestionRequiredObject['question_no'] = data[i]['question_no'];
    thisQuestionRequiredObject['record_id'] = data[i]['record_id'];
    organisedPayload.add({
      "question_no": thisQuestionRequiredObject['record_id'],
      "record_id": thisQuestionRequiredObject['record_id']
    });
  }
  return organisedPayload;
}
