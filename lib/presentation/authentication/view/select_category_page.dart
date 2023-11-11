import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/authentication/view/widget/register_app_bar.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import '../controller/register_controller.dart';

enum CategoryType {
  movie("영화", imageName: "movie"),
  book("독서", imageName: "book"),
  musical("뮤지컬", imageName: "musical"),
  exhibition("전시회", imageName: "exhibition"),
  drama("드라마", imageName: "drama"),
  popup("팝업스토어", imageName: "popup"),
  sports("스포츠", imageName: "sports"),
  etc("기타", imageName: "etc");

  final String name;
  final String imageName;
  const CategoryType(this.name, {required this.imageName});
}

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 36.h),
                Text("관심 있는 카테고리를 선택해주세요.", style: AppTypeFace.smallBold),
                SizedBox(height: 40.h),
                Wrap(
                  spacing: 16.w,
                  runSpacing: 24.h,
                  children: [for (final category in CategoryType.values) _CategorySelectWidget(category)],
                ),
                SizedBox(height: 23.h),
                TicketsButton(
                  "티켓 만들기",
                  onTap: () async => await Get.find<RegisterController>().saveCategories(),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF683BB), Color(0xFFFE6565)],
                  ),
                ),
                SizedBox(height: 29.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategorySelectWidget extends GetView<RegisterController> {
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
