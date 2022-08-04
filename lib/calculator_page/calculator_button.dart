import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final IconData? icon;
  final void Function() onTap;
  const CalculatorButton(
      {Key? key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.text,
      required this.onTap,
      this.icon})
      : super(key: key);

  const CalculatorButton.icon(
      {Key? key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.text,
      required this.onTap,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  size: 32.r,
                  color: foregroundColor,
                )
              : Text(
                  text,
                  style: TextStyle(color: foregroundColor, fontSize: 32.sp),
                ),
        ),
      ),
    );
  }
}
