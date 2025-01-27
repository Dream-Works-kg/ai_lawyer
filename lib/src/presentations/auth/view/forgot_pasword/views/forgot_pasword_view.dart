import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPaswordView extends StatefulWidget {
  const ForgotPaswordView({super.key});

  @override
  State<ForgotPaswordView> createState() => _ForgotPaswordViewState();
}

class _ForgotPaswordViewState extends State<ForgotPaswordView> {
  String selectedOption = '';

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
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
              'Забыли пароль?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Выберите, какие контактные данные мы должны использовать для сброса вашего пароля',
              style: TextStyle(
                color: const Color(0xFFACADB9),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 2.2.h),
            buildOption(
              option: 'email',
              icon: CupertinoIcons.mail,
              title: 'Email',
              subtitle: 'Код на email',
            ),
            SizedBox(height: 1.h),
            buildOption(
              option: 'phone',
              icon: CupertinoIcons.phone_solid,
              title: 'Phone',
              subtitle: 'Отправить код на телефон',
            ),
            SizedBox(height: 4.h),
            CustomButtom(
              title: 'дальше',
              onTap: handleNext,
            ),
          ],
        ),
      ),
    );
  }

  void handleNext() {
    if (selectedOption.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Выберите одно из вариантов',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF232627),
        ),
      );
      return;
    }

    Widget nextPage = selectedOption == 'email'
        ? const EmailResetPassword()
        : const PhoneResetPassword();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  Widget buildOption({
    required String option,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () => selectOption(option),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        width: double.infinity,
        height: 8.h,
        decoration: BoxDecoration(
          color: const Color(0xFF232627),
          border: Border.all(
            color: selectedOption == option ? Colors.white : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 30,
              offset: Offset(0, 20),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 13.w,
              height: 6.h,
              decoration: const BoxDecoration(
                color: Color(0x7F516A95),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.73.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0xFFACADB9),
                    fontSize: 14.83.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
