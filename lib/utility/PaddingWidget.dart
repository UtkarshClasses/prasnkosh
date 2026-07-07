import 'package:flutter/cupertino.dart';

Widget paddingOnly(top, right, bottom, left, widget) {
  return Padding(
    padding:
        EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
    child: widget,
  );
}
