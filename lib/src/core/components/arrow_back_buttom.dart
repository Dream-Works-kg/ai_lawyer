import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrowBackButtom extends StatelessWidget {
  const ArrowBackButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 25.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF232627),
      ),
      child: Icon(Icons.arrow_back_ios_new),
    );
  }
}
