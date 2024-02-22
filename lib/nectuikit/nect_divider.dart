import 'dart:ui';
import 'package:flutter/material.dart';
import 'models/Nect_divider_models.dart';
import 'Nect_color.dart';

class NectDivider extends StatefulWidget {
  final NectDividerStyle style;
  final NectDividerOrientation orientation;
  final Color color;

  NectDivider({
    Key? key,
    this.style = NectDividerStyle.SOLID,
    this.orientation = NectDividerOrientation.HORIZONTAL,
    this.color = NectColor.Gray11,
  }) : super(key: key);

  @override
  _NectDividerState createState() => _NectDividerState();
}

class _NectDividerState extends State<NectDivider> {
  _NectDividerState();

  @override
  Widget build(BuildContext context) {
    if (widget.style == NectDividerStyle.SOLID) {
      if (widget.orientation == NectDividerOrientation.HORIZONTAL) {
        return Divider(
          height: 1,
          thickness: 1,
          color: widget.color,
        );
      } else {
        return VerticalDivider(
          width: 1,
          thickness: 1,
          color: widget.color,
        );
      }
    }

    if (widget.orientation == NectDividerOrientation.HORIZONTAL) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth =
              (widget.style == NectDividerStyle.DASHED ? 8 : 2).floorToDouble();
          final dashCount = (boxWidth /
                  ((widget.style == NectDividerStyle.DASHED ? 1.5 : 3) *
                      dashWidth))
              .floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: widget.style == NectDividerStyle.DOTTED ? 2 : 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      );
    } else {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var boxHeight = constraints.constrainHeight();
          if (boxHeight == double.infinity) {
            boxHeight = 0;
          }
          final dashHeight =
              (widget.style == NectDividerStyle.DASHED ? 8 : 2).floorToDouble();
          final dashCount = (boxHeight /
                  ((widget.style == NectDividerStyle.DASHED ? 1.5 : 3) *
                      dashHeight))
              .floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: widget.style == NectDividerStyle.DOTTED ? 2 : 1,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
          );
        },
      );
    }
  }
}
