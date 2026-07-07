import 'package:flutter/material.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

Widget selectedItemChips(list) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Wrap(
      alignment: WrapAlignment.start,
      children: [
        for (int i = 0; i < list.length; i++)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: colors.leftGradient,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  "${list[i].title.toString()}(${list[i].id.toString()})",
                  style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontFamily: "serif",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
