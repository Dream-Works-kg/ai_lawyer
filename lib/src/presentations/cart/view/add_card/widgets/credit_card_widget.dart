import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String cardLogo;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardLogo,
  });

  String _formatCardNumber(String input) {
    if (input.isEmpty) {
      return '••••    ••••    ••••    ••••';
    }
    return input
        .replaceAllMapped(
          RegExp(r'.{1,4}'),
          (match) => '${match.group(0)}',
        )
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
      height: 23.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF232627),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/card.png'),
              Icon(
                Icons.more_horiz,
                size: 25.sp,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 1.6.h),
          Text(
            _formatCardNumber(cardNumber),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.5.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cardHolderName.isEmpty ? 'Name Here' : cardHolderName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Image.asset(
                cardLogo,
                fit: BoxFit.fill,
              )
            ],
          ),
        ],
      ),
    );
  }
}
