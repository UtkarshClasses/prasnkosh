import 'package:teach_advance/utility/widget_of_question_show_screen.dart';
import 'package:flutter/material.dart';

Widget settingsTransferSetDeleteButton() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        buttonWidgets("Settings", Icons.settings, "settings"),
        buttonWidgets("Copy Set", Icons.copy, "copy_set"),
        // buttonWidgets("Thumbnails", Icons.wallpaper, "thumbnail"),
        buttonWidgets("Transfer Set", Icons.send, "transfer"),
        buttonWidgets("Delete", Icons.delete_forever_outlined, "delete"),
      ],
    ),
  );
}
