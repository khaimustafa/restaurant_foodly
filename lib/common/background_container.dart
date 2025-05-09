import 'package:flutter/material.dart';
import 'package:restaurant_foodly/constants/constants.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: width,
        height: hieght,
        decoration: BoxDecoration(
          color: color?? kLightWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          image: const DecorationImage(
              image: AssetImage('assets/images/restaurant_bk.png'),
              fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
