import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';
import 'package:tickets/presentation/widget/tickets.dart';
import 'package:tickets/presentation/widget/tickets_dialog.dart';

import '../../controller/ticket_controller.dart';
import 'no_ticket_widget.dart';

class TicketsCardView extends GetView<TicketController> {
  TicketsCardView({super.key, this.isAllTicket = false});

  final PageController pageController = PageController();

  final bool isAllTicket;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        List<TicketModel> ticketList = isAllTicket ? controller.ticketList : controller.myTicketList;

        if (isAllTicket && controller.isTicketLoading.value || (!isAllTicket && controller.isMyTicketLoading.value)) {
          return const Center(child: CircularProgressIndicator());
        } else if (ticketList.isEmpty) {
          return const NoTicketWidget();
        } else {
          return StackedCardCarousel(
            type: StackedCardCarouselType.fadeOutStack,
            pageController: pageController,
            initialOffset: 10.w,
            spaceBetweenItems: 595.h,
            items: [
              for (TicketModel ticket in ticketList) ...[
                SizedBox(
                  width: 365.w,
                  height: 611.h,
                  child: Stack(
                    children: [
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
                      ],
                      Positioned.fill(
                        top: 60.h,
                        right: 30.w,
                        child: GestureDetector(
                          onTap: () async {
                            await TicketsDio().post('/likes/${ticket.id}');

                            if (controller.likeTicketIdList.contains(ticket.id!)) {
                              controller.likeTicketIdList.remove(ticket.id);
                              controller.likeTicketList.remove(ticket);
                            } else {
                              controller.likeTicketIdList.add(ticket.id!);
                              controller.likeTicketList.add(ticket);
                              controller.likeTicketList.sort((a, b) => a.id!.compareTo(b.id!));
                            }
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: controller.likeTicketIdList.contains(ticket.id)
                                ? SvgPicture.asset(
                                    'assets/icons/heart_fill.svg',
                                    width: 24.w,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/heart.svg',
                                    height: 24.w,
                                  ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: 60.w,
                        left: 40.w,
                        child: GestureDetector(
                            onTap: () async {
                              await showReportDialog(context, ticket);
                            },
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: SvgPicture.asset(
                                  'assets/icons/report.svg',
                                  width: 20.w,
                                  height: 20.w,
                                ))),
                      ),
                    ],
                  ),
                )
              ],
            ],
          );
        }
      },
    );
  }
}
