import 'package:flutter/material.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';

class TextFieldView extends StatelessWidget {
  final Function(String) onChange;
  final String hintText;
  final bool isObscure;
  final bool isPasswordField;
  final TextInputType? textInputType;
  final Function? onTapSuffixIcon;
  final BoxBorder? boxBorder;
  final TextAlign? textAlign;
  final bool readOnly;
  final Function? onTap;

  const TextFieldView({
    super.key,
    required this.onChange,
    required this.hintText,
    this.isObscure = false,
    this.isPasswordField = false,
    this.textInputType,
    this.onTapSuffixIcon,
    this.boxBorder,
    this.textAlign,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: boxBorder,
        borderRadius: BorderRadius.circular(textFieldBorderRadius),
        color: colorWhite.withOpacity(0.06),
      ),
      child: TextField(
        onTap: () => onTap?.call(),
        textAlign: textAlign ?? TextAlign.left,
        keyboardType: textInputType,
        obscureText: isObscure,
        obscuringCharacter: "*",
        onChanged: (value) => onChange(value),
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: textRegular,
            color: colorWhite.withOpacity(0.4),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(marginMedium2),
          suffixIcon: isPasswordField
              ? GestureDetector(
                  onTap: () => onTapSuffixIcon?.call(),
                  child: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: colorWhite,
                  ),
                )
              : null,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: textRegular,
          color: colorWhite,
        ),
      ),
    );
  }
}
