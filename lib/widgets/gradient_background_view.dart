import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';

class GradientBackgroundView extends StatelessWidget {
  final Widget child;
  const GradientBackgroundView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          focal: Alignment.topRight,
          center: Alignment.topRight,
          radius: 3.8,
          colors: [
            colorPrimaryLight,
            colorPrimaryDark,
            colorPrimary,
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
