import 'dart:io';

import 'package:damacalculator/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key,
    required this.hintText,
    this.controller,
    this.onDatePicTap,
    this.isEnable,
    this.fieldWidth,
    this.question,
    this.maxLine,
    this.inputType,
    this.inputFormator,
    this.maxCharLength,
    this.onChange,
    this.fieldHeight,
    this.preFixIcon,
    this.boarderColour,
    this.suffixIcon,
    this.obscureText,
    this.padding,
    this.readOnly,
    this.initialValue,
    this.contentPadding});

  final String? hintText;
  final String? initialValue;
  final String? question;
  final bool? isEnable;
  final bool? readOnly;
  final bool? obscureText;
  final TextEditingController? controller;
  final double? fieldWidth;
  final double? fieldHeight;
  final VoidCallback? onDatePicTap;
  final int? maxLine;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? preFixIcon ;
  final Widget? suffixIcon ;
  final Color? boarderColour ;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormator;
  final int? maxCharLength;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fieldHeight,
      width: fieldWidth,
      alignment: Alignment.center,
      padding: padding,
      decoration:
      BoxDecoration(border: Border.all(color: boarderColour ?? ColorRes.themColor),borderRadius: BorderRadius.circular(10)),
      child: TextField(
        cursorColor: ColorRes.themColor,
        obscureText: obscureText ?? false,
        controller: controller,
        maxLines: maxLine ?? 1,
        keyboardType: inputType ?? TextInputType.text,
        maxLength: maxCharLength,
        onChanged: onChange,
        enabled: isEnable,
        readOnly: readOnly ?? false,
        inputFormatters: inputFormator,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          prefixIcon: preFixIcon,
          border: InputBorder.none,
          hintText: hintText ?? "",
          hintStyle: TextStyle(
              color: ColorRes.hint,
              fontSize: Platform.isIOS ? 15 : 14,
              ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
