import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final contr = TextEditingController();
    return Container(
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
              controller: controller ?? contr,
              obscureText: obscureText,
              keyboardType: TextInputType.phone,
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
          if (suffixIcon != null) Icon(suffixIcon, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
