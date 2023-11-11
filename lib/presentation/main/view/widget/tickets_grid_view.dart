import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';
import 'package:tickets/presentation/widget/tickets.dart';
import 'package:tickets/presentation/widget/tickets_dialog.dart';

import '../../controller/ticket_controller.dart';
import 'no_ticket_widget.dart';

class TicketsGridView extends GetView<TicketController> {
  const TicketsGridView({super.key, this.isAllTicket = false});

  final bool isAllTicket;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        List<TicketModel> ticketList = isAllTicket ? controller.ticketList : controller.myTicketList;

        if (controller.isTicketLoading.value || controller.isMyTicketLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (ticketList.isEmpty) {
          return const NoTicketWidget();
        } else {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Wrap(
                spacing: 16.w,
                children: [
                  for (TicketModel ticket in ticketList) ...[
                    Stack(
                      children: [
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
                          right: 10.w,
                          child: GestureDetector(
                            onTap: () async {
                              await TicketsDio().post('/likes/${ticket.id}');

                              if (controller.likeTicketIdList.contains(ticket.id!)) {
                                controller.likeTicketIdList.remove(ticket.id);
                                controller.likeTicketList
                                    .where((e) => e.id == ticket.id)
                                    .forEach((e) => controller.likeTicketList.remove(e));
                              } else {
                                controller.likeTicketIdList.add(ticket.id!);
                                controller.likeTicketList.add(ticket);
                              }
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: controller.likeTicketIdList.contains(ticket.id)
                                  ? SvgPicture.asset('assets/icons/heart_fill.svg', width: 24.w)
                                  : SvgPicture.asset('assets/icons/heart.svg', width: 24.w),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 20.w,
                          left: 20.w,
                          child: GestureDetector(
                              onTap: () async {
                                await showReportDialog(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: SvgPicture.asset('assets/icons/report.svg', width: 20.w, height: 20.w),
                              )),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
