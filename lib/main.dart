import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/config/routes/routes.dart';
import 'package:tickets/presentation/home/controller/home_binding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'SUIT',
        useMaterial3: true,
      ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      getPages: Routes.routes,
    );
  }
}
