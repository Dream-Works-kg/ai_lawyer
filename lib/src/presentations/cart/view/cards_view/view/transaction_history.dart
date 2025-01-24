import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTransactionItem(
          context,
          imagePath: 'assets/images/flesh.png',
          backgroundColor: darkenColor(const Color(0xffd08900), 0.2),
          title: "Gym",
          subtitle: "Payment",
          amount: "- 40.99",
          isPositive: false,
        ),
        _buildTransactionItem(
          context,
          imagePath: 'assets/images/chek.png',
          backgroundColor: darkenColor(const Color(0xFF28B73B), 0.2),
          title: "AI-Bank",
          subtitle: "Deposit",
          amount: "+ \$460.00",
          isPositive: true,
        ),
        _buildTransactionItem(
          context,
          imagePath: 'assets/images/cart.png',
          backgroundColor: darkenColor(const Color(0xFFD994C9), 0.2),
          title: "McDonald",
          subtitle: "Payment",
          amount: "- 34.10",
          isPositive: false,
        ),
        _buildTransactionItem(
          context,
          imagePath: 'assets/images/chek.png',
          backgroundColor: darkenColor(const Color(0xFF28B73B), 0.2),
          title: "Recipient",
          subtitle: "Deposit",
          amount: "+ \$320.19",
          isPositive: true,
        ),
        _buildTransactionItem(
          context,
          imagePath: 'assets/images/set.png',
          backgroundColor: darkenColor(const Color(0xFF5471AE), 0.2),
          title: "Recipient",
          subtitle: "Deposit",
          amount: "+ \$320.19",
          isPositive: true,
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    BuildContext context, {
    required String imagePath,
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required String amount,
    required bool isPositive,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.sp),
      child: Row(
        children: [
          Container(
            height: 7.h,
            width: 15.w,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Функция для затемнения цвета
  static Color darkenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final darkenedHsl =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkenedHsl.toColor();
  }
}
