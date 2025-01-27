import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  Future<void> _saveAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSaved', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CustomBottomNavBar()),
    );
  }

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
                  _saveAndNavigate();
                })
          ],
        ),
      ),
    );
  }
}
