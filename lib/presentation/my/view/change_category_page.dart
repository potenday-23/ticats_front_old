import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/authentication/view/select_category_page.dart';
import 'package:tickets/presentation/my/controller/my_page_controller.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

class ChangeCategoryPage extends GetView<MyPageController> {
  const ChangeCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 56.w,
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
        title: Text("관심 카테고리 선택", style: AppTypeFace.smallBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            Wrap(
              spacing: 16.w,
              runSpacing: 24.h,
              children: [for (final category in CategoryType.values) _CategorySelectWidget(category)],
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TicketsButton("선택 완료", onTap: () => Get.back()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySelectWidget extends GetView<MyPageController> {
  const _CategorySelectWidget(this.category);

  final CategoryType category;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.categoryList.contains(category.name)) {
            controller.categoryList.remove(category.name);
          } else {
            controller.categoryList.add(category.name);
          }
        },
        child: controller.categoryList.contains(category.name)
            ? Stack(
                children: [
                  Image.asset('assets/categories/${category.imageName}_select.png', width: 163.w, height: 121.h, fit: BoxFit.contain),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(category.name, style: AppTypeFace.smallBold.copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Image.asset('assets/categories/${category.imageName}.png', width: 163.w, height: 121.h, fit: BoxFit.contain),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(category.name, style: AppTypeFace.smallBold),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
