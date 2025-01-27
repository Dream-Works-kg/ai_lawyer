import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GoogleAndFacebookButtons extends StatelessWidget {
  const GoogleAndFacebookButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildButton(String text, Color color, Color textColor) {
      return Container(
        width: 36.w,
        height: 57,
        decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(
          'GOOGLE',
          const Color(0xFFD44638),
          const Color(0xFFD44638),
        ),
        SizedBox(width: 3.w),
        buildButton(
          'FACEBOOK',
          const Color(0xFF4267B2),
          const Color(0xFF4267B2),
        ),
      ],
    );
  }
}
