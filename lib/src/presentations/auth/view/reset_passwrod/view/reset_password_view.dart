import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(showArrowBackButton: true),
            SizedBox(height: 7.h),
            Text(
              'Сохраните свой пароль',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomTextField(
              icon: Icons.lock_outline_rounded,
              hintText: 'Пароль',
              obscureText: false,
              suffixIcon: Icons.visibility_off_outlined,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              icon: Icons.lock_outline_rounded,
              hintText: 'Пароль',
              obscureText: false,
              suffixIcon: Icons.visibility_off_outlined,
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomButtom(
                title: 'Сохранить',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomBottomNavBar(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
