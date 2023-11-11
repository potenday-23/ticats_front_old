import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/presentation/main/controller/ticket_controller.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';

import '../../widget/tickets.dart';
import '../../widget/tickets_dialog.dart';

class MyLikePage extends GetView<TicketController> {
  const MyLikePage({super.key});

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
        centerTitle: true,
        title: Text("좋아요한 티켓", style: AppTypeFace.smallBold),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Obx(
            () => Column(
              children: [
                Wrap(
                  spacing: 16.w,
                  children: [
                    for (TicketModel ticket in controller.likeTicketList) ...[
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
                                  ? SvgPicture.asset('assets/icons/heart_fill.svg')
                                  : SvgPicture.asset('assets/icons/heart.svg'),
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
        ),
      ),
    );
  }
}
