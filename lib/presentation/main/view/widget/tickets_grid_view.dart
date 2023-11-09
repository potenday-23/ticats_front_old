import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';
import 'package:tickets/presentation/widget/tickets.dart';

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
          return Center(child: CircularProgressIndicator());
        } else if (ticketList.isEmpty) {
          return NoTicketWidget();
        } else {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Wrap(
                spacing: 16.w,
                children: [
                  for (TicketModel ticket in ticketList) ...[
                    if (ticket.ticketType == '1') ...[
                      if (ticket.layoutType == "small") Ticket1Small(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "medium") Ticket1Medium(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "large") Ticket1Large(ticket, width: 163.w, height: 273.w),
                    ] else if (ticket.ticketType == '2') ...[
                      if (ticket.layoutType == "small") Ticket2Small(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "medium") Ticket2Medium(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "large") Ticket2Large(ticket, width: 163.w, height: 273.w),
                    ] else if (ticket.ticketType == '3') ...[
                      if (ticket.layoutType == "small") Ticket3Small(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "medium") Ticket3Medium(ticket, width: 163.w, height: 273.w),
                      if (ticket.layoutType == "large") Ticket3Large(ticket, width: 163.w, height: 273.w),
                    ]
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
