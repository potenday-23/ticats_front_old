import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';

class TicketsButton extends StatelessWidget {
  const TicketsButton(this.text, {super.key, this.color, this.gradient, this.textColor, required this.onTap});

  final String text;
  final Color? color;
  final LinearGradient? gradient;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: color ?? AppColor.systemBlue,
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTypeFace.smallBold.copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
