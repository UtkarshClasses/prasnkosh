import 'package:flutter/material.dart';
import 'package:teach_advance/utility/containerPro.dart';

Widget previousOfWidget(text) {
  return (text == "0" || text == "" || text == 0)
      ? Container()
      : containerPro(
          Text(
            text,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
                fontFamily: "Poppins",
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Colors.yellow,
          Colors.white,
          1.0,
          2.0);
}
