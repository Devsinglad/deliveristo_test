
import 'package:flutter/material.dart';

Widget CustomText({
  required final String title,
  final TextAlign? align,
  final FontWeight? weight,
  final TextOverflow? textOverflow,
  final int? maxLines,
  final TextStyle? fonts,
  final Function()? onTap,
  final Color? color,
  final double? fontSize,
  final TextDecoration? decoration,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      title,
      style: TextStyle(
        fontFamily: 'Outfit',
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      ),
      textAlign: align,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: true,
    ),
  );
}