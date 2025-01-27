import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Color(0xFF141718),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    showArrowBackButton: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Создайте свой\nаккаунт',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextField(
                    icon: Icons.person_outline,
                    hintText: 'Полное имя',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    hintText: 'Введите email',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    hintText: 'Пароль',
                    obscureText: false,
                    suffixIcon: Icons.visibility_off_outlined,
                  ),
                  SizedBox(height: 2.h),
                  CustomButtom(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneNumberView(),
                        ),
                      );
                    },
                    title: 'Регистрация',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'У вас уже есть аккаунт? ',
                        style: TextStyle(
                          color: Color(0xFFACADB9),
                          fontSize: 15.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Divider(),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Продолжить с аккаунтами',
              style: TextStyle(
                color: Color(0xFFACADB9),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GoogleAndFacebookButtons(),
          ],
        ),
      ),
    );
  }
}
