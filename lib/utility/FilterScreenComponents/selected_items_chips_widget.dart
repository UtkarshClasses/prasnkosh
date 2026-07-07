import 'package:flutter/material.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

Widget selectedItemChips(list) {
  return Align(
    alignment: Alignment.centerLeft,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
                  // "${list[i].title.toString()}(${list[i].id.toString()})",
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
    ),
  );
}
