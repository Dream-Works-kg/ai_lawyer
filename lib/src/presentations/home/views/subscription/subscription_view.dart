import 'package:ai_lawyer/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            CustomAppBar(
              showArrowBackButton: true,
              title: 'Card Details',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6.5.h),
            Container(
              width: double.infinity,
              height: 24.h,
              decoration: ShapeDecoration(
                color: Color(0xFF232627),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.90),
                ),
              ),
              // child: ,
            ),
          ],
        ),
      ),
    );
  }
}
