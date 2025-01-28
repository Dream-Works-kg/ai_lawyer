import 'dart:convert';

import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/models/card_info_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/widegt.dart';

class AddCard extends StatefulWidget {
  final List<CardModel> savedCards;
  const AddCard({super.key, required this.savedCards});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();

  String? selectedMonth;
  String? selectedYear;

  bool isDefaultCard = false;

  String cardNumber = '';
  String cardHolderName = '';
  String cardLogo = 'assets/images/peymont.png';

  @override
  void initState() {
    super.initState();

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        cardLogo = _getCardLogo(cardNumber);
      });
    });

    _cardHolderController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderController.text;
      });
    });
  }

  void _saveCardToCache(List<CardModel> cards) async {
    final prefs = await SharedPreferences.getInstance();
    final cardsJson = cards.map((card) => card.toMap()).toList();
    await prefs.setString('saved_cards', jsonEncode(cardsJson));
  }

  void _saveCard() {
    if (_cardNumberController.text.isEmpty ||
        _cardHolderController.text.isEmpty ||
        selectedMonth == null ||
        selectedYear == null ||
        _cvcController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Пожалуйста, заполните все поля")),
      );
      return;
    }

    final newCard = CardModel(
      cardNumber: _cardNumberController.text,
      cardHolderName: _cardHolderController.text,
      expiryMonth: selectedMonth!,
      expiryYear: selectedYear!,
      cvc: _cvcController.text,
      isDefault: isDefaultCard,
      cardLogo: cardLogo,
    );

    setState(() {
      widget.savedCards.add(newCard);
      _saveCardToCache(widget.savedCards);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Карта успешно сохранена!")),
    );

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cvcController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }

  String _getCardLogo(String cardNumber) {
    if (cardNumber.startsWith('56')) {
      return 'assets/images/peymont.png';
    } else if (cardNumber.startsWith('41')) {
      return 'assets/images/visa1.png';
    } else {
      return 'assets/images/peymont.png';
    }
  }

  final List<DropdownMenuItem<String>> monthItems = List.generate(
    12,
    (index) => DropdownMenuItem(
      value: (index + 1).toString().padLeft(2, '0'),
      child: Text(
        (index + 1).toString().padLeft(2, '0'),
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    ),
  );

  final List<DropdownMenuItem<String>> yearItems = List.generate(
    10,
    (index) => DropdownMenuItem(
      value: (DateTime.now().year + index).toString(),
      child: Text(
        (DateTime.now().year + index).toString(),
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    ),
  );

  void onMonthChanged(String? value) {
    setState(() {
      selectedMonth = value;
    });
  }

  void onYearChanged(String? value) {
    setState(() {
      selectedYear = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Добавить новую карту',
                showArrowBackButton: true,
              ),
              SizedBox(height: 2.h),
              CreditCardWidget(
                cardLogo: cardLogo,
                cardNumber: cardNumber,
                cardHolderName: cardHolderName,
              ),
              SizedBox(height: 5.4.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Введите информацию',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  CustomTextFieldCard(
                    label: 'Номер карты',
                    controller: _cardNumberController,
                    hintText: "•••• •••• •••• ••••",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        cardLogo,
                        height: 2.h,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          final formattedText = _formatNumber(newValue.text);
                          return TextEditingValue(
                            text: formattedText,
                            selection: TextSelection.collapsed(
                              offset: formattedText.length,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  CustomTextFieldCard(
                    label: 'Имя владельца',
                    controller: _cardHolderController,
                    hintText: "Имя владельца",
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    "Дата окончания срока",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildDropdownField(
                          label: "Месяц",
                          value: selectedMonth,
                          items: monthItems,
                          onChanged: onMonthChanged,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        flex: 2,
                        child: _buildDropdownField(
                          label: "Год",
                          value: selectedYear,
                          items: yearItems,
                          onChanged: onYearChanged,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        flex: 2,
                        child: CustomTextFieldCard(
                          label: 'CVC',
                          controller: _cvcController,
                          hintText: "231",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  Row(
                    children: [
                      Switch(
                        value: isDefaultCard,
                        onChanged: (value) {
                          setState(() {
                            isDefaultCard = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.grey.shade700,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey.shade800,
                      ),
                      Text(
                        'Отметить как карту по умолчанию',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  CustomButtom(title: 'Добавить новую карту', onTap: _saveCard),
                  SizedBox(height: 1.5.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumber(String input) {
    return input
        .replaceAllMapped(
          RegExp(r".{1,4}"),
          (match) => '${match.group(0)} ',
        )
        .trim();
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.sp),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            underline: const SizedBox(),
            iconEnabledColor: Colors.white,
            dropdownColor: Colors.grey.shade900,
            isExpanded: true,
            hint: Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            items: items,
          ),
        ),
      ],
    );
  }
}
