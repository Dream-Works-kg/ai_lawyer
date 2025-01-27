import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_lawyer/src/presentations/cart/view/my_card/my_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCards extends StatefulWidget {
  const AllCards({super.key});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  // Здесь будем хранить карты, загруженные из SharedPreferences
  List<Map<String, dynamic>> _savedCards = [];

  // Эти две переменные показывают, нужно ли выводить ваши два "жёстко прописанных" контейнера
  bool _showStaticCard1 = false; // Для карты "5562 5566 5577 1987"
  bool _showStaticCard2 = false; // Для карты "9999 8888 7777 1411"

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> cardsList = prefs.getStringList('my_cards') ?? [];

    final List<Map<String, dynamic>> decodedCards = cardsList.map((cardJson) {
      return jsonDecode(cardJson) as Map<String, dynamic>;
    }).toList();

    setState(() {
      _savedCards = decodedCards;
    });

    final bool hasFirstCard = decodedCards.any((card) {
      final noSpaces = (card['cardNumber'] as String).replaceAll(' ', '');
      return noSpaces == '5562556655771987';
    });

    // 2) Ищем "9999 8888 7777 1411"
    final bool hasSecondCard = decodedCards.any((card) {
      final noSpaces = (card['cardNumber'] as String).replaceAll(' ', '');
      return noSpaces == '9999888877771411';
    });

    setState(() {
      _showStaticCard1 = hasFirstCard;
      _showStaticCard2 = hasSecondCard;
    });
  }

  /// Метод для удаления одной карты из SharedPreferences и из локального списка
  Future<void> _removeCard(Map<String, dynamic> card) async {
    final prefs = await SharedPreferences.getInstance();

    // Считываем текущий список JSON-строк
    final List<String> existingCards = prefs.getStringList('my_cards') ?? [];

    // Превращаем выбранную карту в JSON-строку (в том же формате, как сохраняли)
    final String jsonString = jsonEncode(card);

    // Удаляем эту JSON-строку из списка
    existingCards.remove(jsonString);

    // Сохраняем обновлённый список обратно
    await prefs.setStringList('my_cards', existingCards);

    // Удаляем карту из локального списка, чтобы обновить интерфейс
    setState(() {
      _savedCards.remove(card);
    });

    // Заодно обновим флаги показа статических карт (если вдруг удалили одну из них)
    _updateStaticCardFlags();
  }

  void _updateStaticCardFlags() {
    final bool hasFirstCard = _savedCards.any((card) {
      final noSpaces = (card['cardNumber'] as String).replaceAll(' ', '');
      return noSpaces == '5562556655771987';
    });

    final bool hasSecondCard = _savedCards.any((card) {
      final noSpaces = (card['cardNumber'] as String).replaceAll(' ', '');
      return noSpaces == '9999888877771411';
    });

    setState(() {
      _showStaticCard1 = hasFirstCard;
      _showStaticCard2 = hasSecondCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Оборачиваем ваш Row в SingleChildScrollView,
    // чтобы была горизонтальная прокрутка при многих картах
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // --- ВАШ ПЕРВЫЙ СТАТИЧЕСКИЙ КОНТЕЙНЕР ---
          if (_showStaticCard1)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyCard()));
              },
              child: Container(
                width: 50.w,
                height: 20.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF232627),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19191C32),
                      blurRadius: 30,
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.5.h),
                      Row(
                        children: [
                          SizedBox(width: 5.w),
                          Image.asset("assets/images/card.png"),
                          SizedBox(width: 10.w),
                          Text(
                            '••••',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            '1411',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 17.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mastercard',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Row(
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
                                SizedBox(width: 13.w),
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
            ),

          // Отступ между двумя статическими, если оба показываются
          if (_showStaticCard1 && _showStaticCard2) SizedBox(width: 5.5.w),

          // --- ВАШ ВТОРОЙ СТАТИЧЕСКИЙ КОНТЕЙНЕР ---
          if (_showStaticCard2)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyCard()));
              },
              child: Container(
                width: 50.w,
                height: 20.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF232627),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19191C32),
                      blurRadius: 30,
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.5.h),
                      Row(
                        children: [
                          SizedBox(width: 5.w),
                          Image.asset("assets/images/card.png"),
                          SizedBox(width: 10.w),
                          Text(
                            '••••',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            '1411',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 17.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mastercard',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Row(
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
                                SizedBox(width: 13.w),
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
            ),

          // --- ТЕПЕРЬ ДОБАВЛЯЕМ ОТОБРАЖЕНИЕ НОВЫХ КАРТ ---
          for (final card in _savedCards) ...[
            SizedBox(width: 5.5.w),
            Container(
              width: 50.w,
              height: 20.h,
              decoration: ShapeDecoration(
                color: Color(0xFF232627),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19191C32),
                    blurRadius: 30,
                    offset: Offset(0, 20),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  // Основное содержимое карты
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3.5.h),
                        Row(
                          children: [
                            SizedBox(width: 5.w),
                            // Логотип карты
                            Image.asset("assets/images/card.png"),
                            SizedBox(width: 10.w),
                            Text(
                              '••••',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            // Показываем последние 4 цифры сохранённого номера
                            Text(
                              (card['cardNumber'] as String).length >= 4
                                  ? (card['cardNumber'] as String).substring(
                                      (card['cardNumber'] as String).length - 4)
                                  : (card['cardNumber'] as String),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.5.h),
                        Padding(
                          padding: EdgeInsets.only(left: 17.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Имя держателя
                              Text(
                                card['cardHolder'] ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Row(
                                children: [
                                  Opacity(
                                    opacity: 0.80,
                                    // Здесь месяц/год
                                    child: Text(
                                      '${card['month']}/${card['year']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 13.w),
                                  Image.asset("assets/images/peymont.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Кнопка УДАЛИТЬ в правом верхнем углу
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeCard(card),
                    ),
                  ),

                  // Можно обернуть карту GestureDetector, если хотим переход
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyCard()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
