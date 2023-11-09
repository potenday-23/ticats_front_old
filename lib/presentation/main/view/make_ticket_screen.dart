import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/make_ticket_controller.dart';

class MakeTicketScreen extends GetView<MakeTicketController> {
  const MakeTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
    );
  }
}
