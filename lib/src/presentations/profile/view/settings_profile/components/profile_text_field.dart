import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;
  final Widget? suffix; // Виджет для суффикса (иконка или изображение)
  final TextEditingController? controller;
  final String? errorText; // Текст ошибки
  final List<TextInputFormatter>? inputFormatters;

  const ProfileTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffix, // Новый параметр
    this.controller,
    this.errorText,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey[400]),
              SizedBox(width: 3.w),
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  controller: controller,
                  obscureText: obscureText,
                  inputFormatters: inputFormatters,
                  style: TextStyle(color: Colors.grey[200], fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (suffix != null) suffix!, // Отображаем переданный виджет
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.sp,
              ),
            ),
          ),
      ],
    );
  }
}
