import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum TermType {
  locationTermOfUse("서비스 알림 수신 동의", fileName: "location_term_of_use"),
  marketingConsent("마케팅 정보 수신 및 이용 동의", fileName: "marketing_consent"),
  privacyPolicy("개인정보 처리방침 및 수집이용 동의", fileName: "privacy_policy"),
  termOfUse("서비스 이용약관", fileName: "term_of_use");

  final String termName;
  final String fileName;
  const TermType(this.termName, {required this.fileName});
}

class TermDetailPage extends StatelessWidget {
  TermDetailPage({super.key});

  final TermType termType = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close, size: 24.w)),
          ),
        ],
        title: Text(termType.termName, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700)),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("assets/terms/${termType.fileName}.md"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Markdown(
                data: snapshot.data,
                padding: EdgeInsets.all(20.w),
                physics: const ClampingScrollPhysics(),
                styleSheet: MarkdownStyleSheet(
                  h1: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.5),
                  h2: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.5),
                  p: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 1.5),
                  listBullet: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, height: 1.5),
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
