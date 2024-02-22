import 'package:flutter/material.dart';
import 'models/nect_user_avatar_models.dart';
import 'nect_color.dart';
import 'nect_text_style.dart';

class NectUserAvatar extends StatefulWidget {
  final NectUserAvatarSize size;
  final NectUserAvatarStyle style;
  final String? initials;
  final Widget? icon;
  final Widget? image;
  int count;
  final NectUserAvatarDecoration? decoration;
  final NectUserAvatarDecorationPosition decorationPosition;
  final Color background;
  final Color foreground;
  final Widget? plusIcon;
  final Color decorationBorderColor;
  final Color decorationBackground;
  final Color decorationForeground;

  NectUserAvatar(
      {this.count = 0,
      this.style = NectUserAvatarStyle.RECTANGLE,
      this.size = NectUserAvatarSize.MEDIUM,
      this.initials,
      this.icon,
      this.image,
      this.decoration,
      this.decorationPosition = NectUserAvatarDecorationPosition.BOTTOMRIGHT,
      this.background = NectColor.Blue7,
      this.foreground = Colors.white,
      this.plusIcon,
      this.decorationBorderColor = Colors.white,
      this.decorationBackground = NectColor.Red3,
      this.decorationForeground = Colors.white});

  @override
  _NectUserAvatarState createState() => _NectUserAvatarState();
}

class _NectUserAvatarState extends State<NectUserAvatar> {
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
    return Stack(
      alignment:
          widget.decorationPosition == NectUserAvatarDecorationPosition.TOPRIGHT
              ? Alignment.topRight
              : Alignment.bottomRight,
      children: [
        Container(
          alignment: Alignment.center,
          width: widget.size == NectUserAvatarSize.LARGE
              ? 64
              : widget.size == NectUserAvatarSize.MEDIUM
                  ? 48
                  : 32,
          height: widget.size == NectUserAvatarSize.LARGE
              ? 64
              : widget.size == NectUserAvatarSize.MEDIUM
                  ? 48
                  : 32,
          decoration: BoxDecoration(
              shape: widget.style == NectUserAvatarStyle.RECTANGLE
                  ? BoxShape.rectangle
                  : BoxShape.circle,
              borderRadius: widget.style == NectUserAvatarStyle.RECTANGLE
                  ? BorderRadius.circular(
                      widget.size == NectUserAvatarSize.LARGE
                          ? 24
                          : widget.size == NectUserAvatarSize.MEDIUM
                              ? 18
                              : 12)
                  : null,
              color: widget.background),
          clipBehavior: Clip.hardEdge,
          child: (widget.image != null
              ? widget.image!
              : widget.icon != null
                  ? SizedBox(
                      width: widget.size == NectUserAvatarSize.LARGE
                          ? 32
                          : widget.size == NectUserAvatarSize.MEDIUM
                              ? 24
                              : 16,
                      height: widget.size == NectUserAvatarSize.LARGE
                          ? 32
                          : widget.size == NectUserAvatarSize.MEDIUM
                              ? 24
                              : 16,
                      child: FittedBox(
                        child: widget.icon!,
                      ),
                    )
                  : widget.initials != null
                      ? Text(
                          widget.initials!,
                          style: (widget.size == NectUserAvatarSize.LARGE
                                  ? NectTextStyle.NectHeadline
                                  : widget.size == NectUserAvatarSize.MEDIUM
                                      ? NectTextStyle.NectSubheadline
                                      : NectTextStyle.NectButtonMedium)
                              .apply(color: widget.foreground),
                        )
                      : null),
        ),
        widget.decoration != null
            ? Container(
                width: widget.decoration == NectUserAvatarDecoration.INDICATOR
                    ? widget.size == NectUserAvatarSize.LARGE
                        ? 12
                        : widget.size == NectUserAvatarSize.MEDIUM
                            ? 10
                            : 8
                    : widget.size == NectUserAvatarSize.LARGE
                        ? 18
                        : widget.size == NectUserAvatarSize.MEDIUM
                            ? 16
                            : 12,
                height: widget.decoration == NectUserAvatarDecoration.INDICATOR
                    ? widget.size == NectUserAvatarSize.LARGE
                        ? 12
                        : widget.size == NectUserAvatarSize.MEDIUM
                            ? 10
                            : 8
                    : widget.size == NectUserAvatarSize.LARGE
                        ? 18
                        : widget.size == NectUserAvatarSize.MEDIUM
                            ? 16
                            : 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.decorationBackground,
                    border:
                        widget.decoration == NectUserAvatarDecoration.COUNTER
                            ? null
                            : Border.all(
                                color: widget.decorationBorderColor,
                                width: widget.size == NectUserAvatarSize.LARGE
                                    ? 3
                                    : widget.size == NectUserAvatarSize.MEDIUM
                                        ? 2
                                        : 1)),
                clipBehavior: Clip.hardEdge,
                child: widget.decoration == NectUserAvatarDecoration.PLUS
                    ? SizedBox(
                        width: 8,
                        height: 8,
                        child: FittedBox(
                          child: widget.plusIcon,
                        ),
                      )
                    : widget.decoration == NectUserAvatarDecoration.COUNTER
                        ? FittedBox(
                            child: Text(
                              widget.count.toString(),
                              style: TextStyle(
                                  fontSize:
                                      widget.size == NectUserAvatarSize.LARGE
                                          ? 10
                                          : 8,
                                  color: widget.decorationForeground),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
              )
            : Container()
      ],
    );
  }
}
