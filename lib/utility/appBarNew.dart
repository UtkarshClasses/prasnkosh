import 'package:flutter/material.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

Widget appBarNew(title, fontSize, verticalPadding, horizontalPadding) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding.toDouble(),
            horizontal: horizontalPadding.toDouble()),
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize.toDouble(),
              fontFamily: "Poppins",
              color: Colors.blueGrey.shade600,
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
