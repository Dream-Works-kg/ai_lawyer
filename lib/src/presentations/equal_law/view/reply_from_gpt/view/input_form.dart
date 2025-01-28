import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/reply_from_gpt/view/input_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputForm extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final bool isGenerating;
  final VoidCallback onSendMessages;

  const InputForm({
    required this.controller1,
    required this.controller2,
    required this.isGenerating,
    required this.onSendMessages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            showArrowBackButton: true,
            title: "LawGuide.Bot",
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.h),
          InputField(controller: controller1, hintText: "Тест:1"),
          SizedBox(height: 1.h),
          Icon(
            Icons.swap_vert,
            size: 20.sp,
            color: Colors.white,
          ),
          SizedBox(height: 1.h),
          InputField(controller: controller2, hintText: "Тест:2"),
          SizedBox(height: 35.h),
          GestureDetector(
            onTap: isGenerating ? null : onSendMessages,
            child: Container(
              width: double.infinity,
              height: 7.h,
              decoration: BoxDecoration(
                color: isGenerating ? Colors.grey : Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                'Сравнить',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
