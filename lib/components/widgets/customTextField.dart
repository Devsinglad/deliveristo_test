
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String? val)? onchanged;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? cPadding;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool obscureText;
  final bool readonly;
  final bool isLarge;

  const CustomTextFormField({
    Key? key,
    this.validator,
    this.controller,
    this.textInputType,
    this.obscureText = false,
    this.isLarge = false,
    this.onchanged,
    this.onsaved,
    this.textInputAction,
    this.hintText,
    this.cPadding,
    this.textInputFormatter,
    this.readonly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.borderColor,
    this.textAlign,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        //height: isLarge? 118 : 63,
        child: TextFormField(
          maxLines: isLarge ? 4 :1,
          onTap: onTap,
          obscureText: obscureText,
          controller: controller,
          keyboardType: textInputType,
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: textInputFormatter,
          textInputAction: textInputAction ?? TextInputAction.next,
          validator: validator,
          onChanged: onchanged,
          onSaved: onsaved,
          readOnly: readonly,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Theme.of(context).primaryColor
          ),
          decoration: InputDecoration(
            errorMaxLines:1,
            contentPadding: cPadding,
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).dividerColor,
            ),
            fillColor: fillColor ?? Theme.of(context).cardColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}