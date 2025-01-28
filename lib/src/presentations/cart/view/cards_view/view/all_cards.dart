import 'dart:convert';

import 'package:ai_lawyer/src/models/card_info_models.dart';
import 'package:ai_lawyer/src/presentations/cart/view/my_card/my_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCards extends StatefulWidget {
  final List<CardModel> savedCards;

  const AllCards({super.key, required this.savedCards});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  Future<void> _saveCardsToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cardsJson = widget.savedCards.map((card) => card.toMap()).toList();
    await prefs.setString('saved_cards', jsonEncode(cardsJson));
  }

  void _deleteCard(CardModel card) {
    setState(() {
      widget.savedCards.remove(card);
      _saveCardsToCache();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.savedCards.map((card) {
          return _buildCard(card);
        }).toList(),
      ),
    );
  }

  Widget _buildCard(CardModel card) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyCard(
              onDelete: _deleteCard,
              cardModel: card,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
        width: 50.w,
        height: 20.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF232627),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19191C32),
              blurRadius: 30,
              offset: Offset(0, 20),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(card.cardLogo), // Логотип карты
                Text(
                  '•••• ${card.cardNumber.substring(card.cardNumber.length - 4)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.cardHolderName.isNotEmpty
                      ? card.cardHolderName
                      : 'Имя не указано',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.5.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Платина', // Например, статус карты
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.5.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(card.cardLogo), // Логотип карты
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
