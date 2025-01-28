import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/constitution/constitution_kyrgyzstan.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/reply_from_gpt/reply_from_gpt.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainLaw extends StatelessWidget {
  const MainLaw({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 9.h),
            Text(
              "Сравнивай законодательство",
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReplyFromGpt(),
                  ),
                );
              },
              child: Container(
                height: 15.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff141718),
                  border: Border.all(color: Colors.white, width: 2.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 1.sp),
                    Text(
                      "LawGuide.Bot",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Lottie.asset("assets/lottie/4.json"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "Бот, который сравнивает законы и помогает вам разобраться в них",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConstitutionKyrgyzstan(),
                  ),
                );
              },
              child: Container(
                height: 15.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff141718),
                  border: Border.all(color: Colors.white, width: 2.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 1.sp),
                    Text(
                      "Конституция.kg",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Lottie.asset("assets/lottie/6.json"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "Конституция Кыргызстана — основной закон, определяющий права граждан и устройство государства",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
