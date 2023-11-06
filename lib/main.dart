import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:tickets/app/config/app_binding.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/config/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: 'SUIT',
            useMaterial3: true,
          ),
          initialBinding: AppBinding(),
          initialRoute: RoutePath.login,
          getPages: Routes.routes,
        );
      },
    );
  }
}
