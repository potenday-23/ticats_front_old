import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home_screen.dart';
import '../view/make_ticket_screen.dart';
import '../view/my_page_screen.dart';

class MainController extends GetxController {
  List<Widget> pages = [
    HomeScreen(),
    MakeTicketScreen(),
    MyPageScreen(),
  ];

  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }
}
