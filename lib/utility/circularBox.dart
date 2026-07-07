import 'package:flutter/material.dart';

Widget circularBox(height, width, text, backGroundColor, fontColor) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: backGroundColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: "serif",
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: fontColor),
        ),
      ],
    ),
  );
}
