import 'package:flutter/material.dart';
import 'nect_color.dart';
import 'nect_text_style.dart';
import 'models/nect_checkbox_models.dart';

class NectCheckbox extends StatefulWidget {
  final Widget? checkboxIcon;
  final String? label;
  final String? caption;
  final String? value;
  final Function(bool)? onChange;
  final Color selectedColor;
  final Color defaultColor;
  final Color valueColor;
  final Color labelColor;
  final Color captionColor;
  final NectCheckboxSize size;
  final bool disabled;
  final bool isChecked;

  NectCheckbox(
      {this.checkboxIcon,
      this.label,
      this.caption,
      this.value,
      this.onChange,
      this.selectedColor = NectColor.Blue3,
      this.defaultColor = NectColor.Gray11,
      this.valueColor = NectColor.Red3,
      this.labelColor = NectColor.Gray2,
      this.captionColor = NectColor.Gray8,
      this.size = NectCheckboxSize.MEDIUM,
      this.disabled = false,
      this.isChecked = false});

  @override
  _NectCheckboxState createState() => _NectCheckboxState();
}

class _NectCheckboxState extends State<NectCheckbox> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isChecked = widget.isChecked;
    });
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: widget.disabled ? Colors.transparent : null,
      highlightColor: widget.disabled ? Colors.transparent : null,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (widget.disabled) {
          return;
        }
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.onChange != null) {
          widget.onChange!(isChecked);
        }
      },
      child: Opacity(
        opacity: widget.disabled ? 0.5 : 1,
        child: Row(
          children: [
            Container(
              width: widget.size == NectCheckboxSize.LARGE
                  ? 32
                  : widget.size == NectCheckboxSize.MEDIUM
                      ? 24
                      : 20,
              height: widget.size == NectCheckboxSize.LARGE
                  ? 32
                  : widget.size == NectCheckboxSize.MEDIUM
                      ? 24
                      : 20,
              decoration: BoxDecoration(
                  color: isChecked ? widget.selectedColor : Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      widget.size == NectCheckboxSize.LARGE
                          ? 12
                          : widget.size == NectCheckboxSize.MEDIUM
                              ? 9
                              : 8),
                  border: Border.all(
                    color:
                        isChecked ? widget.selectedColor : widget.defaultColor,
                    width: 2,
                  )),
              child: Container(
                alignment: Alignment.center,
                width: widget.size == NectCheckboxSize.SMALL ? 12 : 15,
                height: widget.size == NectCheckboxSize.SMALL ? 12 : 15,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: isChecked ? widget.checkboxIcon : null,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.label != null
                      ? Text(
                          widget.label!,
                          style: NectTextStyle.NectButtonMedium.apply(
                              color: widget.labelColor),
                        )
                      : Container(),
                  widget.caption != null
                      ? Text(
                          widget.caption!,
                          style: NectTextStyle.NectCaption.apply(
                              color: widget.captionColor),
                        )
                      : Container(),
                ],
              ),
            )),
            widget.value != null
                ? Text(
                    widget.value!,
                    style: NectTextStyle.NectButtonLarge.apply(
                        color: widget.valueColor),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
