import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/presentation/authentication/view/term_detail_page.dart';
import 'package:tickets/presentation/main/controller/ticket_controller.dart';
import 'package:tickets/presentation/widget/tickets_dialog.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 56.h,
        title: const Text("마이페이지"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: Column(
        children: [
          const _MyProfileWidget(),
          SizedBox(height: 24.h),
          const Divider(thickness: 1, color: AppColor.grayE5),
          const _MyPageListView()
        ],
      ),
    );
  }
}

class _MyPageListView extends StatelessWidget {
  const _MyPageListView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MyPageTile(
          "공지사항",
          icon: "notice",
          onTap: () => Get.toNamed(RoutePath.notice),
        ),
        _MyPageTile(
          "문의하기",
          icon: "inquery",
          onTap: () => Get.toNamed(RoutePath.inquery),
        ),
        _MyPageTile(
          "서비스 이용 약관",
          icon: "doc",
          onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.termOfUse),
        ),
        _MyPageTile(
          "개인정보 수집 및 이용",
          icon: "user_privacy",
          onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.privacyPolicy),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/exchange.svg', width: 24.w, height: 24.w),
                SizedBox(width: 12.w),
                Text("버전 정보", style: AppTypeFace.xsmallMedium),
                SizedBox(width: 14.w),
                Text("1.0.0", style: AppTypeFace.xsmallSemiBold.copyWith(color: AppColor.gray63)),
                const Spacer(),
                Text("최신 버전입니다.", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray98)),
              ],
            ),
          ),
        ),
        _MyPageTile(
          "로그아웃",
          icon: "logout",
          onTap: () async => showLogoutDialog(context),
        ),
        _MyPageTile(
          "탈퇴하기",
          icon: "quit",
          onTap: () => Get.toNamed(RoutePath.resign),
        ),
      ],
    );
  }
}

class _MyPageTile extends StatelessWidget {
  const _MyPageTile(this.title, {required this.icon, this.onTap});

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/$icon.svg', width: 24.w, height: 24.w),
              SizedBox(width: 12.w),
              Text(title, style: AppTypeFace.xsmallMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyProfileWidget extends StatelessWidget {
  const _MyProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: AuthService.to.user!.member!.profileUrl!,
                  width: 56.w,
                  height: 56.w,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return SvgPicture.asset('assets/icons/user.svg', width: 56.w, height: 56.w);
                  },
                ),
              ),
              SizedBox(width: 18.w),
              SizedBox(
                height: 56.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AuthService.to.user!.member!.nickname!, style: AppTypeFace.smallSemiBold),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Get.toNamed(RoutePath.editMyProfile),
                      child: Row(
                        children: [
                          Text("프로필 수정", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                          SizedBox(width: 8.w),
                          SvgPicture.asset('assets/icons/edit.svg', width: 16.w, height: 16.w),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.w),
          Container(
            height: 56.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: AppColor.grayF2),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("내 티켓", style: AppTypeFace.xsmallBold.copyWith(color: AppColor.gray63)),
                      Text(Get.find<TicketController>().myTicketList.length.toString(), style: AppTypeFace.xsmallBold),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const VerticalDivider(thickness: 1, color: AppColor.grayC7),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(RoutePath.myStatistics),
                    child: Center(child: Text("통계 보기", style: AppTypeFace.xsmallBold.copyWith(color: AppColor.gray63))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const VerticalDivider(thickness: 1, color: AppColor.grayC7),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Get.toNamed(RoutePath.myLike),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("좋아요한 티켓", style: AppTypeFace.xsmallBold.copyWith(color: AppColor.gray63)),
                        Text(Get.find<TicketController>().likeTicketList.length.toString(), style: AppTypeFace.xsmallBold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
