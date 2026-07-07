import 'package:flutter/material.dart';

Widget chipInList(backGroundColor_1, textColor_1, text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Container(
      decoration: BoxDecoration(
          color: backGroundColor_1,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 8.0,
        ),
        child: Text(
          text.toString(),
          style: TextStyle(
            fontSize: 10.0,
            color: textColor_1,
            fontFamily: "serif",
          ),
        ),
      ),
    ),
  );
}