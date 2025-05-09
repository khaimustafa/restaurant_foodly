import 'package:flutter/cupertino.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.btnWidth, this.btnHeight, this.btnColor, this.btnRadius, required this.text});

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? btnRadius;
  final Color? btnColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
        child: Container(
          width: btnWidth??width,
          height: btnHeight??26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(btnRadius??12),
            color: btnColor??kPrimary,

          ),
          child: Center(
            child: ReusableText(
                text: text,
                style: appStyle(12, kLightWhite, FontWeight.w500)),
          ),
        ));
  }
}
