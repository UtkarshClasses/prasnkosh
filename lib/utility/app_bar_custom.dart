import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget appBarNew(title, fontSize, top, right, bottom, left) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: top.toDouble(),
          right: right.toDouble(),
          bottom: bottom.toDouble(),
          left: left.toDouble(),
        ),
        child: AutoSizeText(
          title,
          minFontSize: 6.0,
          style: TextStyle(
              fontSize: fontSize.toDouble(),
              fontFamily: "Mont",
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
