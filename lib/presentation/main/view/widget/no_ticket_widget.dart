import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';

class NoTicketWidget extends StatelessWidget {
  const NoTicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "아직 등록한 티켓이 없어요.\n내 티켓 만들기를 선택해\n티켓을 등록해보세요!",
          style: AppTypeFace.mediumBold.copyWith(color: AppColor.gray98),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 34.h),
        SvgPicture.asset(
          'assets/cats/cat_empty.svg',
          width: 105.99336.w,
          height: 170.99687.h,
        )
      ],
    );
  }
}
