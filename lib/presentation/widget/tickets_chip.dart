import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';

class TicketsChip extends StatelessWidget {
  const TicketsChip(this.text, {super.key, this.color, this.padding, required this.onTap});

  final String text;
  final EdgeInsets? padding;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color ?? AppColor.primaryLight,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Text(text, style: AppTypeFace.xsmallSemiBold),
        ),
      ),
    );
  }
}
