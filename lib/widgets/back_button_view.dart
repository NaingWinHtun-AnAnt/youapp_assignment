import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';
import 'package:youapp_assignment/resources/strings.dart';

class BackButtonView extends StatelessWidget {
  final Function onTap;
  final EdgeInsetsGeometry? margin;
  const BackButtonView({
    super.key,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: margin ??
            const EdgeInsets.only(
              top: marginXLarge,
              left: marginMedium2,
            ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: colorWhite,
            ),
            SizedBox(
              width: marginMedium,
            ),
            Text(
              txtBack,
              style: TextStyle(
                fontSize: textRegular,
                fontWeight: FontWeight.w700,
                color: colorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
