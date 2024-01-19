import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';

class TestTextField extends StatefulWidget {
  const TestTextField({
    Key? key,
    required this.placeholder,
    this.lableText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.iconPressed,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.borderColor,
    this.enableBorderColor,
    this.labelStyle,
    this.inputFormatters,
    this.textInputType,
  }) : super(key: key);

  final String placeholder;
  final String lableText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? iconPressed;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final Color? borderColor;
  final Color? enableBorderColor;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  @override
  State<TestTextField> createState() => _TestTextFieldState();
}

class _TestTextFieldState extends State<TestTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        scrollPadding: EdgeInsets.zero,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              gapPadding: 2,
              borderSide: BorderSide(
                color: widget.enableBorderColor ?? AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(15)),
          prefixIconColor: AppColors.black,
          suffixIconColor: AppColors.black,
          focusedBorder: OutlineInputBorder(
            gapPadding: 2,
            borderSide:
                BorderSide(color: widget.borderColor ?? AppColors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          focusColor: AppColors.black,
          iconColor: AppColors.black,
          hoverColor: AppColors.black,
          labelText: widget.lableText,
          labelStyle:
              widget.labelStyle ?? const TextStyle(color: AppColors.black),
          prefixIcon: 
            widget.prefixIcon,
          
          suffixIcon: IconButton(
            onPressed: widget.iconPressed,
            icon: widget.suffixIcon ?? const Offstage(),
          ),
          border: OutlineInputBorder(
            gapPadding: 2,
            borderSide: const BorderSide(
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          fillColor: Colors.amberAccent,
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}
