import 'package:ai_lawyer/src/models/card_info_models.dart';
import 'package:ai_lawyer/src/presentations/cart/view/add_card/add_card.dart';
import 'package:ai_lawyer/src/presentations/cart/view/cards_view/view/all_cards.dart';
import 'package:ai_lawyer/src/presentations/cart/view/cards_view/view/transaction_history.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  List<CardModel> savedCards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
    _saveCardsToCache();
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final cardsJson = prefs.getString('saved_cards');
    if (cardsJson != null) {
      final List<dynamic> cardsList = jsonDecode(cardsJson);
      setState(() {
        savedCards = cardsList.map((card) => CardModel.fromMap(card)).toList();
      });
    }
  }

  Future<void> _saveCardsToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cardsJson = savedCards.map((card) => card.toMap()).toList();
    await prefs.setString('saved_cards', jsonEncode(cardsJson));
  }

  Future<void> _navigateToAddCard() async {
    // Переходим на экран добавления карты и ожидаем результата
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCard(
          savedCards: savedCards,
        ),
      ),
    );

    if (result == true) {
      await _loadCards();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Мои карты",
                style: TextStyle(
                  fontSize: 23.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Container(
                    height: 6.h,
                    width: 35.5.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF232627),
                    ),
                    child: Center(
                      child: Text(
                        'Физическая карта',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.h),
                  Container(
                    height: 6.h,
                    width: 35.5.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x7F404040),
                    ),
                    child: Center(
                      child: Text(
                        'Виртуальная карта',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _navigateToAddCard();
                      },
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(15),
                        dashPattern: const [6, 4],
                        child: SizedBox(
                          width: 15.w,
                          height: 19.h,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.5.w),
                    AllCards(
                      savedCards: savedCards,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.5.h),
              Row(
                children: [
                  Text(
                    'История транзакций',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'Сегодня',
                    style: TextStyle(
                      color: Color(0xFF959595),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              TransactionHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
