import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFieldCard extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFieldCard({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 0.9.h),
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
