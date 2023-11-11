import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';
import 'package:tickets/presentation/widget/tickets.dart';

import '../../controller/ticket_controller.dart';
import 'no_ticket_widget.dart';

class TicketsCardView extends GetView<TicketController> {
  const TicketsCardView({super.key, this.isAllTicket = false});

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
          return StackedCardCarousel(type: StackedCardCarouselType.fadeOutStack, initialOffset: 10.w, spaceBetweenItems: 595.w, items: [
            for (TicketModel ticket in ticketList) ...[
              if (ticket.ticketType == '0') ...[
                if (ticket.layoutType == "0") Ticket1Small(ticket),
                if (ticket.layoutType == "1") Ticket1Medium(ticket),
                if (ticket.layoutType == "2") Ticket1Large(ticket),
              ] else if (ticket.ticketType == '1') ...[
                if (ticket.layoutType == "0") Ticket2Small(ticket),
                if (ticket.layoutType == "1") Ticket2Medium(ticket),
                if (ticket.layoutType == "2") Ticket2Large(ticket),
              ] else if (ticket.ticketType == '2') ...[
                if (ticket.layoutType == "0") Ticket3Small(ticket),
                if (ticket.layoutType == "1") Ticket3Medium(ticket),
                if (ticket.layoutType == "2") Ticket3Large(ticket),
              ]
            ]
          ]);
        }
      },
    );
  }
}
