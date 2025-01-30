import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/profile/view/profile_user/view/profile_user.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? emailError;

  Future<void> saveChanges() async {
    if (!validateEmail(emailController.text.trim())) {
      setState(() {
        emailError = 'Некорректный email';
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', nameController.text.trim());
    await prefs.setString('userEmail', emailController.text.trim());

    // Переход на страницу профиля после сохранения
    Navigator.pop(
      context,
    );
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(height: 1.h),
              CustomAppBar(
                title: 'Редактировать',
                showArrowBackButton: true,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              ProfileTextField(
                icon: Icons.person_outline,
                hintText: 'Полное имя',
                controller: nameController,
                suffix: Image.asset(
                  'assets/images/red.png',
                ),
              ),
              SizedBox(height: 2.h),
              ProfileTextField(
                icon: Icons.email_outlined,
                hintText: 'Введите email',
                controller: emailController,
                suffix: Image.asset(
                  'assets/images/red.png',
                ),
                errorText: emailError,
              ),
              SizedBox(height: 2.h),
              ProfileTextField(
                icon: Icons.lock_outline_rounded,
                hintText: 'Пароль',
                suffix: Image.asset(
                  'assets/images/red.png',
                ),
              ),
              SizedBox(height: 3.h),
              GestureDetector(
                onTap: saveChanges, // Сохранение данных
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
                      'СОХРАНИТЬ ИЗМЕНЕНИЯ',
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
