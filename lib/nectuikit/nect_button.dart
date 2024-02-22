import 'package:flutter/material.dart';
import 'nect_color.dart';
import 'nect_text_style.dart';
import 'models/nect_button_models.dart';

class NectButton extends StatelessWidget {
  NectButton({
    this.text,
    required this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.size = NectButtonSize.MEDIUM,
    this.state = NectButtonState.DEFAULT,
    this.type = NectButtonType.PRIMARY,
    this.background = NectColor.Blue,
    this.foregroundColor = Colors.white,
    this.defaultBorderColor = NectColor.Gray11,
    this.autoResize = true,
    this.borderLineWidth = 1,
    this.removePaddings = false,
    this.horizontalAlignment = MainAxisAlignment.center,
    this.width,
    this.height,
  });

  final String? text;
  final GestureTapCallback onPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double? width;
  final double? height;
  final NectButtonSize size;
  final NectButtonState state;
  final NectButtonType type;
  final Color background;
  final Color foregroundColor;
  final Color defaultBorderColor;
  final bool autoResize;
  final double borderLineWidth;
  final bool removePaddings;
  final MainAxisAlignment horizontalAlignment;

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    if (leftIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(
          right: removePaddings
              ? 0
              : text != null
                  ? (size == NectButtonSize.LARGE
                      ? 18
                      : size == NectButtonSize.MEDIUM
                          ? 14
                          : 9)
                  : rightIcon != null
                      ? (size == NectButtonSize.SMALL ? 5 : 10)
                      : 0,
        ),
        child: leftIcon!,
      ));
    }

    if (text != null) {
      children.add(Text(
        text!,
        style: (size == NectButtonSize.SMALL
                ? NectTextStyle.NectButtonMedium
                : size == NectButtonSize.SMALL
                    ? NectTextStyle.NectButtonSmall
                    : NectTextStyle.NectButtonLarge)
            .apply(color: foregroundColor),
      ));
    }

    if (rightIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(
          left: removePaddings
              ? 0
              : text != null
                  ? (size == NectButtonSize.LARGE
                      ? 18
                      : size == NectButtonSize.MEDIUM
                          ? 14
                          : 9)
                  : leftIcon != null
                      ? (size == NectButtonSize.SMALL ? 5 : 10)
                      : 0,
        ),
        child: rightIcon!,
      ));
    }

    return SizedBox(
      width: width,
      height: height,
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        focusElevation: 2,
        highlightElevation: 0,
        hoverElevation: 0,
        fillColor: background,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            side: type == NectButtonType.PRIMARY
                ? BorderSide.none
                : BorderSide(color: defaultBorderColor, width: borderLineWidth),
            borderRadius: BorderRadius.all(
                Radius.circular(size == NectButtonSize.SMALL ? 12 : 16))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              removePaddings
                  ? 0
                  : (leftIcon != null
                      ? (size == NectButtonSize.LARGE
                          ? 24
                          : size == NectButtonSize.MEDIUM
                              ? 16
                              : 8)
                      : (size == NectButtonSize.LARGE
                          ? 24
                          : (size == NectButtonSize.SMALL && text == null
                              ? 8
                              : 16))),
              removePaddings ? 0 : (size == NectButtonSize.SMALL ? 8 : 16),
              removePaddings
                  ? 0
                  : (rightIcon != null
                      ? (size == NectButtonSize.LARGE
                          ? 24
                          : size == NectButtonSize.MEDIUM
                              ? 16
                              : 8)
                      : (size == NectButtonSize.LARGE
                          ? 24
                          : (size == NectButtonSize.SMALL && text == null
                              ? 8
                              : 16))),
              removePaddings ? 0 : (size == NectButtonSize.SMALL ? 8 : 16)),
          child: Row(
            mainAxisSize: autoResize ? MainAxisSize.min : MainAxisSize.max,
            mainAxisAlignment: horizontalAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
