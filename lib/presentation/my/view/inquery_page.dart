import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

class InqueryPage extends StatelessWidget {
  const InqueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close, size: 24.w)),
          ),
        ],
        centerTitle: true,
        title: Text("문의하기", style: AppTypeFace.smallBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            Text('"wonhee0619@gmail.com"', style: AppTypeFace.mediumBold),
            SizedBox(height: 24.h),
            Text("앱에 대한 문의 및 건의사항을\n보내주세요 :)", style: AppTypeFace.mediumBold, textAlign: TextAlign.center),
            SizedBox(height: 117.h),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 31.16.w),
                  child: SvgPicture.asset('assets/cats/cat_inquery.svg', width: 88.83.w, height: 143.43497.h),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.w),
          child: _CopyEmailWidget(),
        ),
      ),
    );
  }
}

class _CopyEmailWidget extends StatefulWidget {
  _CopyEmailWidget();

  @override
  State<_CopyEmailWidget> createState() => _CopyEmailWidgetState();
}

class _CopyEmailWidgetState extends State<_CopyEmailWidget> {
  String text = "이메일 주소 복사";

  Color? color = AppColor.grayC7;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TicketsButton(
        text,
        onTap: () {
          Clipboard.setData(const ClipboardData(text: "wonhee0619@gmail.com"));
          setState(() {
            text = "복사 완료!";
            color = null;
          });
        },
        color: color,
      ),
    );
  }
}
