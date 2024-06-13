import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';

class LongButtonView extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isActive;

  const LongButtonView({
    super.key,
    required this.text,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isActive ? onTap() : null,
      child: Opacity(
        opacity: isActive ? 1.0 : 0.3,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: marginMedium2,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              colorButtonLight,
              colorButtonDark,
            ]),
            borderRadius: BorderRadius.circular(longButtonBorderRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: textLarge,
                color: colorWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
