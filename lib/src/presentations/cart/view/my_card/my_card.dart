import 'dart:convert'; // ДОБАВЛЕНО
import 'package:shared_preferences/shared_preferences.dart'; // ДОБАВЛЕНО

import 'package:ai_lawyer/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _onlinePayment = false;
  bool _atmWithdraws = false;
  bool _international = false;

  /// Метод для удаления именно этой карты из SharedPreferences,
  /// чтобы она пропала и из экрана PaymontHone
  Future<void> _removeCurrentCard() async {
    final prefs = await SharedPreferences.getInstance();
    // Считываем существующие JSON-строки (список карт)
    final List<String> existingCards = prefs.getStringList('my_cards') ?? [];

    // Номер нашей "текущей" карты:
    final String currentCardNumber = "5562 5566 5577 1987".replaceAll(' ', '');

    // Создадим новый список, куда добавим все карты, кроме той, что хотим удалить
    final List<String> updatedCards = [];

    for (final cardJson in existingCards) {
      final map = jsonDecode(cardJson) as Map<String, dynamic>;

      final String? storedNumber = map['cardNumber']?.replaceAll(' ', '');

      // Если это не наша карта — оставляем
      if (storedNumber != currentCardNumber) {
        updatedCards.add(cardJson);
      }
    }

    // Сохраняем обновлённый список обратно
    await prefs.setStringList('my_cards', updatedCards);

    // Возвращаемся назад (к PaymontHone или любому другому экрану)
    Navigator.pop(context);
  }

  /// Метод, который показывает bottom sheet c «Удалить карту»
  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black, // или любой другой цвет
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Можно добавить "ручку" вверху для эстетики
              SizedBox(height: 12),
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              SizedBox(height: 16),

              // Пункт "Удалить карту"
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  "Удалить карту",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Сначала закрываем bottom sheet
                  _removeCurrentCard(); // Потом удаляем карту
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),

            /// ----------------------------------
            ///  AppBar
            /// ----------------------------------
            CustomAppBar(
              showArrowBackButton: true,
              title: 'Настройка карты',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.59,
              ),
              // Отключаем кнопку в AppBar, чтобы
              // удаление происходило только из bottom sheet
              showTrailingButton: false,
            ),

            SizedBox(height: 3.5.h),

            /// ----------------------------------
            ///  Заголовок "Моя карта" + иконка more_horiz
            /// ----------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Моя карта',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                GestureDetector(
                  onTap: _openBottomSheet, // Нажимаем - открываем bottom sheet
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // ------------ Карточка ------------
            Container(
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
                padding: EdgeInsets.symmetric(horizontal: 0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------------ Верхняя плашка ------------
                    Container(
                      height: 7.5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfff363636),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Иконка слева
                            Padding(
                              padding: EdgeInsets.only(top: 13.sp),
                              child: Image.asset("assets/images/card.png"),
                            ),
                            // Номер карты справа
                            Padding(
                              padding: EdgeInsets.only(right: 8.sp),
                              child: Text(
                                "5562 5566 5577 1987",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3.8.h),

                    // ------------ Данные карты ------------
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mastercard",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
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
                              Image.asset("assets/images/peymont.png"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 5.h),
            Text.rich(
              TextSpan(
                text: 'Настройки',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: ' Карты',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),

            // ---------- Online Payment ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Онлайн-платеж',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Switch(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.blue,
                  value: _onlinePayment,
                  onChanged: (val) {
                    setState(() {
                      _onlinePayment = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // ---------- ATM WithDraws ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Снятие наличных с банкомата',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Switch(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.blue,
                  value: _atmWithdraws,
                  onChanged: (val) {
                    setState(() {
                      _atmWithdraws = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // ---------- International ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Международный',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Switch(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.blue,
                  value: _international,
                  onChanged: (val) {
                    setState(() {
                      _international = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
