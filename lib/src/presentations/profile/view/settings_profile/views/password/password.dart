import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/profile/view/profile_user/view/profile_user.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? errorText;

  void validatePasswords() {
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      setState(() {
        errorText = 'Пароли не совпадают';
      });
    } else {
      setState(() {
        errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              CustomAppBar(
                showArrowBackButton: true,
              ),
              SizedBox(height: 4.h),
              Text(
                'Сохраните свой\nпароль',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              ProfileTextField(
                icon: Icons.lock_outline_rounded,
                hintText: 'Пароль',
                controller: passwordController,
                suffix: const Icon(Icons.visibility_off_outlined),
              ),
              SizedBox(height: 2.h),
              ProfileTextField(
                icon: Icons.lock_outline_rounded,
                hintText: 'Повторите пароль',
                controller: confirmPasswordController,
                suffix: const Icon(Icons.visibility_off_outlined),
                errorText: errorText, 
              ),
              SizedBox(height: 3.h),
              GestureDetector(
                onTap: () {
                  validatePasswords();
                  if (errorText == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileUser(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 8.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1B1E20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'ПРОВЕРИТЬ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.48,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
