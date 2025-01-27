import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatViewTitlesWidget extends StatefulWidget {
  const ChatViewTitlesWidget({super.key});

  @override
  State<ChatViewTitlesWidget> createState() => _ChatViewTitlesWidgetState();
}

class _ChatViewTitlesWidgetState extends State<ChatViewTitlesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.9.h),
        Text(
          'Ai Lawyer',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5.8.h),
        _buildInfoCard(
            'Сохраняет ранее сказанную информацию для последующего использования'),
        SizedBox(height: 2.6.h),
        _buildInfoCard('Иногда может предоставлять неточную информацию'),
        SizedBox(height: 2.6.h),
        _buildInfoCard(
            'Иногда может предоставлять рекомендации, требующие дополнительной юридической проверки'),
      ],
    );
  }

  Widget _buildInfoCard(String text) {
    return Container(
      width: double.infinity,
      height: 8.4.h,
      padding: const EdgeInsets.all(18.12),
      decoration: ShapeDecoration(
        color: const Color(0xFF232627),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.49),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFA0A0A5),
          fontSize: 14.49.sp,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
