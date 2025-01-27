import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? containerColor;
  final BorderRadius? radius;
  const CustomButtom(
      {super.key,
      required this.title,
      required this.onTap,
      this.textColor,
      this.radius,
      this.containerColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 6.4.h,
        decoration: ShapeDecoration(
          color: containerColor ?? Color(0xFF1B1E20),
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(14),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
