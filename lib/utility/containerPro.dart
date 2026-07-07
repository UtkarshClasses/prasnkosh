import 'package:flutter/material.dart';

Widget containerPro(widget, color, shadowColor, blurRadius, borderRadius) {
  return Container(
    decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius,
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius)),
    child:
        // paddingOnly(2.0, 4.0, 2.0, 4.0, widget),
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: widget,
    ),
  );
}
