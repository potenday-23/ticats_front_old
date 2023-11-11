import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/presentation/main/controller/ticket_controller.dart';
import 'package:tickets/presentation/widget/tickets.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';
import 'package:tickets/presentation/widget/tickets_dialog.dart';

import '../controller/ticket_search_controller.dart';
import '../data/model/ticket_model.dart';

class TicketSearchResultPage extends GetView<TicketSearchController> {
  const TicketSearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Misc
        automaticallyImplyLeading: false,
        toolbarHeight: 56.w,
        scrolledUnderElevation: 0,

        // Empty leading
        leadingWidth: 0,

        // Title
        title: const _FilterTitleTextField(),
        titleSpacing: 0,

        // Actions
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 24.w, 16.h),
            child: GestureDetector(
              onTap: () => Get.offNamedUntil(
                RoutePath.main,
                (route) => route.isFirst,
              ),
              child: Icon(Icons.close, size: 24.w),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.searchResultList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "검색 결과가 없어요.\n다른 티켓을 검색해보세요!",
                    style: AppTypeFace.mediumBold.copyWith(color: AppColor.gray98),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 70.h),
                  SvgPicture.asset(
                    'assets/cats/cat_empty.svg',
                    width: 105.99336.w,
                    height: 170.99687.h,
                  )
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("내 티켓만 보기", style: AppTypeFace.smallSemiBold),
                        Obx(
                          () => CupertinoSwitch(
                            activeColor: AppColor.primaryDark,
                            value: controller.isOnlyMyTicket.value,
                            onChanged: (value) => controller.isOnlyMyTicket.value = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 16.w,
                      children: [
                        for (TicketModel ticket in controller.searchResultList) ...[
                          if (!controller.isOnlyMyTicket.value || ticket.member!.id! == AuthService.to.user!.member!.id!)
                            Stack(children: [
                              if (ticket.ticketType == '0') ...[
                                if (ticket.layoutType == "0") Ticket1Small(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "1") Ticket1Medium(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "2") Ticket1Large(ticket, width: 163.w, height: 273.w),
                              ] else if (ticket.ticketType == '1') ...[
                                if (ticket.layoutType == "0") Ticket2Small(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "1") Ticket2Medium(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "2") Ticket2Large(ticket, width: 163.w, height: 273.w),
                              ] else if (ticket.ticketType == '2') ...[
                                if (ticket.layoutType == "0") Ticket3Small(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "1") Ticket3Medium(ticket, width: 163.w, height: 273.w),
                                if (ticket.layoutType == "2") Ticket3Large(ticket, width: 163.w, height: 273.w),
                              ],
                              Positioned.fill(
                                top: 30.h,
                                right: 20.w,
                                child: GestureDetector(
                                  onTap: () async {
                                    await TicketsDio().post('/likes/${ticket.id}');

                                    if (Get.find<TicketController>().likeTicketIdList.contains(ticket.id!)) {
                                      Get.find<TicketController>().likeTicketIdList.remove(ticket.id);
                                      Get.find<TicketController>().likeTicketList.remove(ticket);
                                    } else {
                                      Get.find<TicketController>().likeTicketIdList.add(ticket.id!);
                                      Get.find<TicketController>().likeTicketList.add(ticket);
                                      Get.find<TicketController>().likeTicketList.sort((a, b) => a.id!.compareTo(b.id!));
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Get.find<TicketController>().likeTicketIdList.contains(ticket.id!)
                                        ? SvgPicture.asset('assets/icons/heart_fill.svg', width: 24.w)
                                        : SvgPicture.asset('assets/icons/heart.svg', width: 24.w),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                bottom: 20.h,
                                left: 20.w,
                                child: GestureDetector(
                                    onTap: () async {
                                      await showReportDialog(context, ticket);
                                    },
                                    child: Align(alignment: Alignment.bottomLeft, child: SvgPicture.asset('assets/icons/report.svg'))),
                              ),
                            ]),
                        ],
                      ],
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: TicketsButton(
          "다시 검색",
          onTap: () => Get.back(),
          color: AppColor.primaryNormal,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _FilterTitleTextField extends GetView<TicketSearchController> {
  const _FilterTitleTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SizedBox(
        height: 48.h,
        child: TextField(
          controller: controller.searchTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColor.grayF2,
            hintText: '티켓을 검색해보세요!',
            hintStyle: AppTypeFace.xsmallSemiBold.copyWith(color: AppColor.gray8E),
            prefixIconConstraints: BoxConstraints(minWidth: 60.w),
            prefixIcon: Icon(Icons.search, size: 24.w),
            prefixIconColor: Colors.black,
            contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 11.h),
          ),
          style: AppTypeFace.xsmallSemiBold,
        ),
      ),
    );
  }
}
