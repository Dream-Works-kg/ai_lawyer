import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardDetailsViews extends StatefulWidget {
  const CardDetailsViews({super.key});

  @override
  State<CardDetailsViews> createState() => _CardDetailsViewsState();
}

class _CardDetailsViewsState extends State<CardDetailsViews> {
  final List<Map<String, String>> transactions = [
    {
      'name': 'FiftyBot',
      'date': '26 .9 .2025  -  5:15 AM',
      'amount': '50\$',
      'image': 'assets/images/on1.png',
    },
    {
      'name': 'JusticeBot',
      'date': '21 .11 .2025  -  2:15 PM',
      'amount': '100\$',
      'image': 'assets/images/on2.png',
    },
    {
      'name': 'LawBot',
      'date': '19 .1 .2026  -  4:35 AM',
      'amount': '199\$',
      'image': 'assets/images/on3.png',
    },
    {
      'name': 'ProLawyer',
      'date': '13 .11 .2026  -  1:13 PM',
      'amount': '299\$',
      'image': 'assets/images/on1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 3.6.h),
            Text(
              'Транзакции',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 45.h,
              child: ListView.builder(
                itemCount: transactions.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.sp),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionView(),
                          ),
                        );
                      },
                      child: TransactionCard(
                        name: transaction['name']!,
                        date: transaction['date']!,
                        amount: transaction['amount']!,
                        image: transaction['image']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
