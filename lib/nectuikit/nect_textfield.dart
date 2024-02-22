import 'package:flutter/material.dart';
import 'models/nect_textfield_models.dart';
import 'nect_color.dart';
import 'nect_text_style.dart';

class NectTextField extends StatefulWidget {
  final String? placeholder;
  String? value;
  final TextEditingController? textEditingController;
  NectTextFieldState state;
  String? helperText;
  Widget? leftIcon;
  Widget? rightIcon;
  final bool disableAutoCorrection;
  final bool secureField;
  final Color background;
  final Color disabledBackground;
  final Color placeholderColor;
  final Color textfieldColor;
  final Color disabledTextfieldColor;
  final Color borderDefaultColor;
  final Color borderDisabledColor;
  final Color borderErrorColor;
  final Color borderSuccessColor;
  final Color borderFocusColor;
  final Color defaultHelperTextColor;
  final Color disabledHelperTextColor;
  final Color errorHelperTextColor;
  final Color successHelperTextColor;
  final TextInputType keyboardType;
  Function(String)? onChange;

  NectTextField({
    this.placeholder,
    this.value,
    this.textEditingController,
    this.state = NectTextFieldState.DEFAULT,
    this.disableAutoCorrection = true,
    this.helperText,
    this.leftIcon,
    this.rightIcon,
    this.secureField = false,
    this.background = Colors.white,
    this.disabledBackground = NectColor.Gray12,
    this.placeholderColor = NectColor.Gray8,
    this.textfieldColor = NectColor.Gray,
    this.disabledTextfieldColor = NectColor.Gray8,
    this.borderDefaultColor = NectColor.Gray11,
    this.borderDisabledColor = NectColor.Gray8,
    this.borderErrorColor = NectColor.Red3,
    this.borderSuccessColor = NectColor.Green1,
    this.borderFocusColor = NectColor.Blue5,
    this.defaultHelperTextColor = NectColor.Gray8,
    this.disabledHelperTextColor = NectColor.Gray8,
    this.errorHelperTextColor = NectColor.Red3,
    this.successHelperTextColor = NectColor.Green1,
    this.keyboardType = TextInputType.text,
    this.onChange,
  });

  @override
  _NectTextFieldState createState() => _NectTextFieldState();
}

class _NectTextFieldState extends State<NectTextField> {
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
    return Column(
      children: [
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: widget.state == NectTextFieldState.DISABLED
                ? widget.disabledBackground
                : widget.background,
            border: Border.all(
                color: widget.state == NectTextFieldState.DEFAULT
                    ? widget.borderDefaultColor
                    : widget.state == NectTextFieldState.FOCUS
                        ? widget.borderFocusColor
                        : widget.state == NectTextFieldState.ERROR
                            ? widget.borderErrorColor
                            : widget.state == NectTextFieldState.SUCCESS
                                ? widget.borderSuccessColor
                                : widget.borderDisabledColor,
                width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Focus(
            child: TextFormField(
              initialValue: widget.value,
              onChanged: widget.onChange,
              controller: widget.textEditingController,
              style: NectTextStyle.NectButtonMedium.apply(
                color: widget.state == NectTextFieldState.DISABLED
                    ? widget.disabledTextfieldColor
                    : widget.textfieldColor,
              ),
              enabled: widget.state != NectTextFieldState.DISABLED,
              maxLines: 1,
              cursorColor: widget.textfieldColor,
              decoration: InputDecoration(
                labelText: widget.placeholder,
                labelStyle: NectTextStyle.NectSmallBody.apply(
                    color: widget.placeholderColor),
                floatingLabelStyle: NectTextStyle.NectSmallBody.apply(
                    color: widget.placeholderColor),
                border: InputBorder.none,
                hoverColor: Colors.transparent,
                filled: true,
                fillColor: widget.state == NectTextFieldState.DISABLED
                    ? widget.disabledBackground
                    : widget.background,
                prefixIcon: widget.leftIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: widget.leftIcon,
                      )
                    : null,
                suffixIcon: widget.rightIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: widget.rightIcon,
                      )
                    : null,
              ),
              autocorrect: !widget.disableAutoCorrection,
              obscureText: widget.secureField,
            ),
            onFocusChange: (hasFocus) {
              setState(() {
                if (hasFocus) {
                  widget.state = NectTextFieldState.FOCUS;
                } else {
                  widget.state = NectTextFieldState.DEFAULT;
                }
              });
            },
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: widget.helperText != null ? 8 : 0),
            child: widget.helperText != null
                ? Text(
                    widget.helperText!,
                    style: NectTextStyle.NectCaption.apply(
                        color: widget.state == NectTextFieldState.DEFAULT
                            ? widget.defaultHelperTextColor
                            : widget.state == NectTextFieldState.ERROR
                                ? widget.errorHelperTextColor
                                : widget.state == NectTextFieldState.SUCCESS
                                    ? widget.successHelperTextColor
                                    : widget.disabledHelperTextColor),
                  )
                : Container())
      ],
    );
  }
}
