import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:ai_lawyer/src/presentations/auth/view/forgot_pasword/views/forgot_pasword_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Color(0xFF141718),
      body: Column(
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
                  'Войдите в свою\nучетную запись',
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
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPaswordView(),
                        ),
                      );
                    },
                    child: Text(
                      'Забыли пароль?',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CustomButtom(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomNavBar(),
                      ),
                    );
                  },
                  title: 'Войти',
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Новый аккаунт? ',
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
                            builder: (context) => SingUpView(),
                          ),
                        );
                      },
                      child: Text(
                        'Регистрация',
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
    );
  }
}
