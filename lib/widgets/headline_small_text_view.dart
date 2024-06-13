import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';

class HeadlineSmallTextView extends StatelessWidget {
  final String text;
  const HeadlineSmallTextView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: marginXLarge,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: headlineSmall,
          fontWeight: FontWeight.w700,
          color: colorWhite,
        ),
      ),
    );
  }
}
