import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Nect_color.dart';
import 'Nect_text_style.dart';
import 'models/Nect_chip_models.dart';

class NectChip extends StatefulWidget {
  final String text;
  final NectChipSize size;
  final Widget? leftIconActive;
  final Widget? leftIconInactive;
  final Widget? rightButtonActive;
  final Widget? rightButtonInactive;
  final bool disabled;
  bool selected;
  final double borderWidth;
  final Color defaultBorderColor;
  final Color selectedBorderColor;
  final Color defaultBackgroundColor;
  final Color selectedBackgroundColor;
  final Color defaultContentColor;
  final Color selectedContentColor;
  final Function(bool)? onChange;

  NectChip(
      {required this.text,
      this.size = NectChipSize.LARGE,
      this.leftIconActive,
      this.leftIconInactive,
      this.rightButtonActive,
      this.rightButtonInactive,
      this.disabled = false,
      this.selected = false,
      this.borderWidth = 2,
      this.defaultBorderColor = NectColor.Blue3,
      this.selectedBorderColor = NectColor.Blue3,
      this.defaultBackgroundColor = Colors.white,
      this.selectedBackgroundColor = NectColor.Blue3,
      this.defaultContentColor = NectColor.Blue3,
      this.selectedContentColor = Colors.white,
      this.onChange});

  _NectChipState createState() => _NectChipState();
}

class _NectChipState extends State<NectChip> {
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
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: () {
        if (!widget.disabled) {
          setState(() {
            widget.selected = !widget.selected;
          });
        }
      },
      child: Opacity(
        opacity: widget.disabled ? 0.48 : 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: widget.selected
                  ? widget.selectedBackgroundColor
                  : widget.defaultBackgroundColor,
              border: Border.all(
                  width: widget.borderWidth,
                  color: widget.selected
                      ? widget.selectedBorderColor
                      : widget.defaultBorderColor)),
          padding: EdgeInsets.only(
              top: widget.size == NectChipSize.LARGE
                  ? 12
                  : widget.size == NectChipSize.MEDIUM
                      ? 8
                      : 4,
              bottom: widget.size == NectChipSize.LARGE
                  ? 12
                  : widget.size == NectChipSize.MEDIUM
                      ? 8
                      : 4,
              left: widget.size == NectChipSize.SMALL ||
                      (widget.size == NectChipSize.MEDIUM &&
                          widget.leftIconInactive != null)
                  ? 8
                  : 12,
              right: widget.rightButtonInactive != null &&
                      widget.size != NectChipSize.LARGE
                  ? widget.size == NectChipSize.MEDIUM
                      ? 8
                      : 4
                  : 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.leftIconInactive != null
                  ? Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 26,
                      height: 16,
                      child: FittedBox(
                        child: widget.selected && widget.leftIconActive != null
                            ? widget.leftIconActive
                            : widget.leftIconInactive,
                      ),
                    )
                  : Container(),
              Text(
                widget.text,
                style: NectTextStyle.NectCaption.apply(
                    color: widget.selected
                        ? widget.selectedContentColor
                        : widget.defaultContentColor),
              ),
              widget.rightButtonInactive != null
                  ? Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 26,
                      height: 16,
                      child: FittedBox(
                        child:
                            widget.selected && widget.rightButtonActive != null
                                ? widget.rightButtonActive
                                : widget.rightButtonInactive,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
