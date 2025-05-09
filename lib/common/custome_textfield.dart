import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/constants/constants.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({super.key, required this.hintText, required this.prefixIcon,
    this.maxLines, this.onEditingComplete,
    this.keyboardType, this.controller, });

  final String hintText;
  final Widget prefixIcon;
  final int? maxLines;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      maxLines: maxLines?? 1,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      controller: controller,
      style: appStyle(12, kDark, FontWeight.normal),
      validator: (value){
        if (value==null || value.isEmpty){
          return 'Please enter some text';
        }
        return null;
      },


      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: maxLines==1? EdgeInsets.zero : const EdgeInsets.all(6),
        hintStyle: appStyle(12, kGray, FontWeight.normal),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kRed, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimary, width: 0.5),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kGray, width: 0.5),
            borderRadius: BorderRadius.circular(12)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed, width: 0.5),
            borderRadius: BorderRadius.circular(12)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: 0.5),
            borderRadius: BorderRadius.circular(12)
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: kGray, width: 0.5),
            borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}
