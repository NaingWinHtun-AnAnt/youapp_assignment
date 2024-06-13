import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';

class GradientTextView extends StatelessWidget {
  final String text;
  final Function? onTap;
  final double textSize;
  final bool visibleUnderLine;
  final List<Color> colorList;
  final EdgeInsetsGeometry? margin;

  const GradientTextView({
    super.key,
    required this.text,
    this.onTap,
    this.textSize = textRegular,
    this.visibleUnderLine = true,
    required this.colorList,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        margin: margin,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: colorList,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: textSize,
              color: colorWhite,
            ),
          ),
        ),
      ),
    );
  }
}
