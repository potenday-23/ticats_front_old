import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import 'widget/tickets_bottom_nav_bar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(onWillPop: () => Future.value(false), child: Obx(() => controller.pages[controller.selectedIndex])),
      bottomNavigationBar: const TicketsBottomNavBar(),
    );
  }
}
