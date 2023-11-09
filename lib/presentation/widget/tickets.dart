import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/data/enum/color.dart';

import '../main/data/model/ticket_model.dart';
import 'masked_image.dart';

class Ticket1Small extends StatelessWidget {
  const Ticket1Small(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_1.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 36.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 254.w,
                        height: 338.w,
                        child: Stack(
                          children: [
                            MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_1_small.png',
                            ),
                            Positioned.fill(
                              top: 14.w,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Text(ticket.title,
                                      style: AppTypeFace.xsmallSemiBold.copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: 6.w,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                                  child: Text(DateFormat("yy.MM.dd").format(ticket.ticketDate),
                                      style: AppTypeFace.xsmallMedium.copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 54.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket.location ?? "", style: AppTypeFace.smallSemiBold),
                          SizedBox(width: 8.w),
                          _RatingStarWidget(ticket.rating),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      SizedBox(width: 238.w, height: 68.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket1Medium extends StatelessWidget {
  const Ticket1Medium(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_1.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 26.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 296.w,
                        height: 344.w,
                        child: MaskedImage(
                          imageUrl: ticket.imageUrl,
                          imagePath: ticket.imagePath,
                          mask: 'assets/tickets/mask_1_medium.png',
                        ),
                      ),
                      SizedBox(height: 60.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _RatingStarWidget(ticket.rating),
                          SizedBox(height: 11.w),
                          SizedBox(width: 139.w, height: 68.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                right: 35.w,
                bottom: 85.86.w,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/tickets/barcode.svg', width: 140.w, height: 77.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket1Large extends StatelessWidget {
  const Ticket1Large(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_1.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 6.5.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 343.w,
                            height: 388.w,
                            child: MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_1_large.png',
                            ),
                          ),
                          Positioned.fill(
                            top: 24.w,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                child: Text(ticket.title,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorType.values[int.parse(ticket.color)].color)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.w),
                      SizedBox(
                        width: 240.w,
                        child: Column(
                          children: [
                            Text(ticket.title, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
                            SizedBox(height: 11.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat("yy.MM.dd").format(ticket.ticketDate), style: AppTypeFace.smallSemiBold),
                                _RatingStarWidget(ticket.rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket2Small extends StatelessWidget {
  const Ticket2Small(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 364.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 364.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_2.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 51.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 254.w,
                        height: 338.w,
                        child: Stack(
                          children: [
                            MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_2_small.png',
                            ),
                            Positioned.fill(
                              top: 14.w,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Text(ticket.title,
                                      style: AppTypeFace.xsmallSemiBold.copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: 6.w,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                                  child: Text(DateFormat("yy.MM.dd").format(ticket.ticketDate),
                                      style: AppTypeFace.xsmallMedium.copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket.location ?? "", style: AppTypeFace.smallSemiBold),
                          SizedBox(width: 8.w),
                          _RatingStarWidget(ticket.rating),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      SizedBox(width: 238.w, height: 68.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket2Medium extends StatelessWidget {
  const Ticket2Medium(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 364.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 364.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_2.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 36.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 304.w,
                        height: 354.w,
                        child: MaskedImage(
                          imageUrl: ticket.imageUrl,
                          imagePath: ticket.imagePath,
                          mask: 'assets/tickets/mask_2_medium.png',
                        ),
                      ),
                      SizedBox(height: 50.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _RatingStarWidget(ticket.rating),
                          SizedBox(height: 11.w),
                          SizedBox(width: 139.w, height: 68.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                right: 35.w,
                bottom: 85.86.w,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/tickets/barcode.svg', width: 140.w, height: 77.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket2Large extends StatelessWidget {
  const Ticket2Large(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 364.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 364.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_2.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 7.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 342.w,
                            height: 408.w,
                            child: MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_2_large.png',
                            ),
                          ),
                          Positioned.fill(
                            top: 48.w,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                child: Text(ticket.title,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorType.values[int.parse(ticket.color)].color)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.w),
                      SizedBox(
                        width: 240.w,
                        child: Column(
                          children: [
                            Text(ticket.title, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
                            SizedBox(height: 11.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat("yy.MM.dd").format(ticket.ticketDate), style: AppTypeFace.smallSemiBold),
                                _RatingStarWidget(ticket.rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket3Small extends StatelessWidget {
  const Ticket3Small(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_3.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 75.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 254.w,
                        height: 338.w,
                        child: Stack(
                          children: [
                            MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_3_small.png',
                            ),
                            Positioned.fill(
                              top: 14.w,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Text(ticket.title,
                                      style: AppTypeFace.xsmallSemiBold
                                          .copyWith(color: Colors.white)
                                          .copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: 6.w,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                                  child: Text(DateFormat("yy.MM.dd").format(ticket.ticketDate),
                                      style: AppTypeFace.xsmallMedium.copyWith(color: ColorType.values[int.parse(ticket.color)].color)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 45.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket.location ?? "", style: AppTypeFace.smallSemiBold),
                          SizedBox(width: 8.w),
                          _RatingStarWidget(ticket.rating),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      SizedBox(width: 238.w, height: 51.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket3Medium extends StatelessWidget {
  const Ticket3Medium(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_3.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 75.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 302.w,
                        height: 345.w,
                        child: MaskedImage(
                          imageUrl: ticket.imageUrl,
                          imagePath: ticket.imagePath,
                          mask: 'assets/tickets/mask_3_medium.png',
                        ),
                      ),
                      SizedBox(height: 31.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: _RatingStarWidget(ticket.rating),
                          ),
                          SizedBox(height: 11.w),
                          SizedBox(width: 139.w, height: 68.w, child: Text(ticket.memo ?? "", style: AppTypeFace.xsmallSmall)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                right: 35.w,
                bottom: 65.86.w,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/tickets/barcode.svg', width: 140.w, height: 77.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket3Large extends StatelessWidget {
  const Ticket3Large(this.ticket, {super.key, this.width, this.height});

  final TicketModel ticket;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 365.w,
      height: height ?? 611.w,
      child: FittedBox(
        child: SizedBox(
          width: 365.w,
          height: 611.w,
          child: Stack(
            children: [
              Image.asset(
                'assets/tickets/ticket_3.png',
                width: 364.w,
                height: 599.w,
              ),
              Positioned.fill(
                top: 0.w,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 337.w,
                            height: 414.w,
                            child: MaskedImage(
                              imageUrl: ticket.imageUrl,
                              imagePath: ticket.imagePath,
                              mask: 'assets/tickets/mask_3_large.png',
                            ),
                          ),
                          Positioned.fill(
                            top: 72.w,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                child: Text(ticket.title,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorType.values[int.parse(ticket.color)].color)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 21.w),
                      SizedBox(
                        width: 240.w,
                        child: Column(
                          children: [
                            Text(ticket.title, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
                            SizedBox(height: 11.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat("yy.MM.dd").format(ticket.ticketDate), style: AppTypeFace.smallSemiBold),
                                _RatingStarWidget(ticket.rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingStarWidget extends StatelessWidget {
  const _RatingStarWidget(this.rating);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++) ...[
          if (i < rating.floor()) ...[
            SvgPicture.asset('assets/tickets/star_full.svg', width: 24.w, height: 24.w),
          ] else if (i == rating.floor() && rating % 1 != 0) ...[
            SvgPicture.asset('assets/tickets/star_half.svg', width: 24.w, height: 24.w),
          ] else ...[
            SvgPicture.asset('assets/tickets/star_empty.svg', width: 24.w, height: 24.w),
          ]
        ]
      ],
    );
  }
}
