import 'package:ai_lawyer/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResultView extends StatelessWidget {
  final String? response;
  final VoidCallback onReset;

  const ResultView({
    required this.response,
    required this.onReset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          showArrowBackButton: true,
          title: "LawGuide.Bot",
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: SingleChildScrollView(
            child: SelectableText(
              'Ответ: $response',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        GestureDetector(
          onTap: onReset,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            child: Container(
              width: double.infinity,
              height: 6.5.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                'Вернуться',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}