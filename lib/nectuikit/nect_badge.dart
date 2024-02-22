import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Nect_color.dart';
import 'Nect_text_style.dart';

class NectBadge extends StatefulWidget {
  final String text;
  final Color background;
  final Color textColor;

  NectBadge(
      {required this.text,
      this.background = NectColor.Blue3,
      this.textColor = Colors.white});

  @override
  _NectBadgeState createState() => _NectBadgeState();
}

class _NectBadgeState extends State<NectBadge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.background),
          child: Text(
            widget.text,
            style: NectTextStyle.NectCaption.apply(color: widget.textColor),
          ),
        )
      ],
    );
  }
}
