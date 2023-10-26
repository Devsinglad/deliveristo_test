
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {

  final double? height;
  final double? width;
  // final String? image,
  final Color? color;
  final BorderRadius? radius;
  final BoxShape? shapes;
  final Widget? widget;
  final Color? shadowColor;
  final Color? borderColor;
  final Function()? onPressed;
  final LinearGradient? gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CustomButton({super.key, this.height,  this.width, this.color, this.radius, this.shapes, this.widget, this.shadowColor, this.borderColor, this.onPressed, this.gradient, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //     image ?? "",
          //   ),
          //   fit: BoxFit.fill,
          // ),
          gradient: gradient,
          color: color,
          borderRadius: radius,
          shape: shapes ?? BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? Colors.transparent,
              offset: const Offset(3, 3),
              blurRadius: 15,
            ),
          ],
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
        ),
        child: widget,
      ),
    );
  }
}