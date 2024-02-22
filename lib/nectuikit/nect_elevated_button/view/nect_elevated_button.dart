

import 'package:nect_widgets/export.dart';

class NectElevatedButton extends StatefulWidget {
  const NectElevatedButton({
    super.key,
    required this.onPressed,
    this.style,
    required this.child,
    this.loaderPrimaryColor = const Color(0xff3B5998),
    this.size = 20,
    this.loaderSecondRingColor,
    this.loaderThirdRingColor,
    this.autofocus = false,
    this.focusNode, this.height, this.width,
  });

  final Color loaderPrimaryColor;
  final bool autofocus;
  final double size;
  final FocusNode? focusNode;
  final Color? loaderSecondRingColor;

  final Color? loaderThirdRingColor;
  final double? height;

  final double? width;

  final Function onPressed;
  final ButtonStyle? style;
  final Widget child;

  @override
  State<NectElevatedButton> createState() => _NectElevatedButtonState();
}

class _NectElevatedButtonState extends State<NectElevatedButton> {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width:widget.width ,
      child: ElevatedButton(
          onPressed: loader == true
              ? () {}
              : () async {
                  try {
                    loader = true;
                    setState(() {});
                    await widget.onPressed();
                    // await Future.delayed(Duration(seconds: 2));

                    loader = false;
                    setState(() {});
                  } on Exception catch (e) {
                    loader = false;

                    // TODO
                  }
                },
          style: widget.style??ElevatedButton.styleFrom(
            backgroundColor: primary_color,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0), // 6px border radius

              )
          ),
          child: loader
              ? Center(
                  child: LoadingAnimationWidget.discreteCircle(
                  // leftDotColor: const Color(0xFF1A1A3F),
                  // rightDotColor:
                  //     const Color(0xFFEA3799),
                  size: 20,
                  color: widget.loaderPrimaryColor,
                  secondRingColor: widget.loaderSecondRingColor ??
                      const Color(0xff3B5998).withOpacity(.8),
                  thirdRingColor: widget.loaderThirdRingColor ??
                      const Color(0xff3B5998).withOpacity(.5),
                ))
              : widget.child),
    )  ;
  }
}
