import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_screen.dart';
import '../view/make_ticket_screen.dart';
import '../../my/view/my_page_screen.dart';
import 'make_ticket_controller.dart';

class MainController extends GetxController {
  List<Widget> pages = [
    const HomeScreen(),
    const MakeTicketScreen(),
    const MyPageScreen(),
  ];

  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeIndex(int index) {
    if (index == 1) Get.find<MakeTicketController>().resetTicket();

    _selectedIndex.value = index;
  }
}
