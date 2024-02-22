import 'package:flutter/material.dart';
import 'package:nect_widgets/nectuikit/utils/xela_expanded_section.dart';
import 'Nect_color.dart';
import 'Nect_text_style.dart';

import 'models/Nect_accordion_models.dart';

class NectAccordion extends StatefulWidget {
  final String title;
  bool isOpen;
  final Widget? openIcon;
  final Widget? closeIcon;
  final NectAccordionIconPosition iconPosition;
  final Color openBackground;
  final Color closeBackground;
  final Color openTitleColor;
  final Color closeTitleColor;
  final Widget content;

  NectAccordion(
      {required this.title,
      this.isOpen = false,
      this.openIcon,
      this.closeIcon,
      this.iconPosition = NectAccordionIconPosition.RIGHT,
      this.openBackground = NectColor.Gray12,
      this.closeBackground = NectColor.Gray12,
      this.openTitleColor = NectColor.Gray2,
      this.closeTitleColor = NectColor.Gray2,
      required this.content});

  @override
  _NectAccordionState createState() => _NectAccordionState();
}

class _NectAccordionState extends State<NectAccordion> {
  _NectAccordionState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isOpen ? widget.openBackground : widget.closeBackground,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                widget.isOpen = !widget.isOpen;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  widget.iconPosition == NectAccordionIconPosition.LEFT &&
                          widget.openIcon != null &&
                          widget.closeIcon != null
                      ? widget.isOpen
                          ? widget.openIcon!
                          : widget.closeIcon!
                      : Container(),
                  widget.iconPosition == NectAccordionIconPosition.LEFT &&
                          widget.openIcon != null &&
                          widget.closeIcon != null
                      ? const SizedBox(width: 16)
                      : Container(),
                  Text(
                    widget.title,
                    style: NectTextStyle.NectBodyBold.apply(
                        color: widget.isOpen
                            ? widget.openTitleColor
                            : widget.closeTitleColor),
                  ),
                  const Spacer(),
                  widget.iconPosition == NectAccordionIconPosition.RIGHT &&
                          widget.openIcon != null &&
                          widget.closeIcon != null
                      ? widget.isOpen
                          ? widget.openIcon!
                          : widget.closeIcon!
                      : Container(),
                ],
              ),
            ),
          ),
          NectExpandedSection(
              expand: widget.isOpen,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 16, left: 16, right: 16),
                child: widget.content,
              ))
        ],
      ),
    );
  }
}
