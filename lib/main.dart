import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:tickets/app/config/app_binding.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/config/routes/routes.dart';

void main() async {
  runApp(const MainApp());

  // Load .env file
  await dotenv.load(fileName: ".env");

  // Initialize Kakao SDK
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!);
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
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0.0),
            scaffoldBackgroundColor: Colors.white,
          ),
          initialBinding: AppBinding(),
          initialRoute: RoutePath.login,
          getPages: Routes.routes,
        );
      },
    );
  }
}
