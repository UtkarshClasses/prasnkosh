import 'package:flutter/material.dart';

Widget textfiledWidget(controller, icon, iconColor, keyboardtype, hintText) {
  return TextField(
    style: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontFamily: "serif",
      fontWeight: FontWeight.bold,
    ),
    enableSuggestions: false,
    cursorColor: Colors.grey,
    enabled: true,
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      hintText: hintText,
      icon: Icon(
        icon,
        color: iconColor,
        size: 30.0,
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
    ),
    onChanged: (phone) {},
    keyboardType: keyboardtype,
  );
}
