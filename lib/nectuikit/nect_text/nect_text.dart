

import 'package:nect_widgets/export.dart';

class NectText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? minFontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final TextStyle? style;

  const NectText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontFamily,
      this.fontWeight,
      this.maxLines,
      this.minFontSize,
      this.style,
      this.textAlign,
      this.decoration,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return text.text
        .fontWeight(fontWeight ?? FontWeight.w400)
        .color(color ?? Colors.black)
        .fontFamily(fontFamily ?? inter_family)
        .size(size ?? 14)
        .minFontSize(minFontSize ?? 5)
        .maxLines(maxLines ?? 1)
        .overflow(overflow ?? TextOverflow.ellipsis)
        .textStyle(style)
        .textStyle(TextStyle(decoration: decoration))

        // .ellipsis
        .align(textAlign ?? TextAlign.center)
        .make();
  }
}
