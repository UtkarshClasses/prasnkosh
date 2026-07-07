import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final String tag;
  final Color tagTextColor;
  final Color tagBackgroundColor;
  const TagWidget(
      {Key? key,
      required this.tag,
      required this.tagTextColor,
      required this.tagBackgroundColor})
      : super(key: key);

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.tagBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
          child: Text(
            widget.tag,
            style: TextStyle(
              fontSize: 10.0,
              color: widget.tagTextColor,
              fontFamily: "serif",
            ),
          )),
    );
  }
}
