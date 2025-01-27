import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomChatTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;
  final IconData? suffixIcon;
  final Function()? prefixIcononTap;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomChatTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.prefixIcononTap,
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
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller ?? contr,
              obscureText: obscureText,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.grey[200], fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16.sp,
                ),
                prefixIcon: prefixIcon,
                border: InputBorder.none,
              ),
            ),
          ),
          if (suffixIcon != null)
            GestureDetector(
                onTap: prefixIcononTap,
                child: Icon(suffixIcon, color: Colors.grey[400])),
        ],
      ),
    );
  }
}
