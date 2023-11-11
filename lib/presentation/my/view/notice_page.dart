import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';

import '../data/model/notice_model.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  Future<List<NoticeModel>?> getNotice() async {
    var response = await TicketsDio().get("/notices");

    if (response.statusCode == 200) {
      return response.data.map<NoticeModel>((e) => NoticeModel.fromJson(e)).toList();
    }
    return null;
  }

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
        centerTitle: true,
        title: Text("공지사항", style: AppTypeFace.smallBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: FutureBuilder(
          future: getNotice(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
            if (snapshot.hasError) return const Center(child: Text("에러가 발생했습니다."));

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data[index].title, style: AppTypeFace.smallSemiBold),
                                  const SizedBox(height: 20),
                                  Text(snapshot.data[index].content, style: AppTypeFace.xsmallMedium),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 11.h),
                          child: Text(
                            snapshot.data[index].title,
                            style: AppTypeFace.xsmallSemiBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(thickness: 1, color: AppColor.grayE5),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
