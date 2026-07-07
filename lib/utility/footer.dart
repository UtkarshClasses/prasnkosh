import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';

class Footer extends StatefulWidget {
  final Color textColor, backGroundColor;
  final String footer;
  const Footer({
    Key? key,
    required this.footer,
    required this.textColor,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        MarqueeText(
          text: TextSpan(
            text: widget.footer,
          ),
          style: TextStyle(
            fontSize: 10.0,
            color: widget.textColor,
            fontFamily: "serif",
          ),
          speed: 20,
        ),
      ],
    );
  }
}
