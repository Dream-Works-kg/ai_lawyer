import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// --------------------------------
/// "Карточка-обложка" вверху
/// --------------------------------
class CardHeaderWidget extends StatelessWidget {
  final String displayCardNumber;
  final String cardLogo;
  final String cardBrandName;

  const CardHeaderWidget({
    super.key,
    required this.displayCardNumber,
    required this.cardLogo,
    required this.cardBrandName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 23.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF232627),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x19191C32),
            blurRadius: 30,
            offset: const Offset(0, 20),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.5.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14.sp),
                  child: Image.asset("assets/images/card.png"),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            Text(
              displayCardNumber.isEmpty
                  ? '••••    ••••    ••••    ••••'
                  : displayCardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 3.5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.80,
                      child: Text(
                        'Platinum',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Image.asset(cardLogo),
                  ],
                ),
                Text(
                  cardBrandName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
