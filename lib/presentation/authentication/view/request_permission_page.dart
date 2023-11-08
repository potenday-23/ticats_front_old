import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/home/view/ticket_page.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import '../controller/register_controller.dart';
import 'widget/register_app_bar.dart';

class RequestPermissionPage extends StatelessWidget {
  const RequestPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 56.h),
              Text(
                "티캣츠에서 나만의 티켓을 꾸미기 위해\n접근 권한 동의를 받고있어요.",
                style: AppTypeFace.smallBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36.h),
              SvgPicture.asset(
                'assets/icons/gallery.svg',
                width: 40.w,
                height: 40.w,
              ),
              SizedBox(height: 8.h),
              Text("갤러리", style: AppTypeFace.xsmallSemiBold.copyWith(color: AppColor.gray48)),
              SizedBox(height: 8.h),
              Text(
                "티켓 이미지 등록 등 서비스 이용 시,\n이미지 등 콘텐츠 접근",
                style: AppTypeFace.xsmallSemiBold.copyWith(color: AppColor.gray63),
              ),
              const Spacer(),
              TicketsButton("다음", onTap: () async {
                bool result = await Get.find<RegisterController>().requestGalleryPermission();
                Get.to(() => TicketPage());
              }),
              SizedBox(height: 86.h),
            ],
          ),
        ),
      ),
    );
  }
}
