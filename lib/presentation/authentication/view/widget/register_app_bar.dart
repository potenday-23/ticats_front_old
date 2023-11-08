import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegisterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      toolbarHeight: 56.h,
      leadingWidth: 80.w,
      leading: Row(
        children: [
          SizedBox(width: 24.w),
          GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset('assets/icons/arrow_left.svg', width: 24.w, height: 24.h),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
