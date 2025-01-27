import 'dart:convert';

import 'package:ai_lawyer/src/models/card_info_models.dart';
import 'package:ai_lawyer/src/presentations/cart/view/add_card/widgets/card_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Example CardInfo model

/// Main AddCard screen
class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();

  // Ensure these are in the dropdown items
  String _selectedMonth = '01';
  String _selectedYear = '23'; // We'll generate '23' in the dropdown items
  bool _isDefault = false;

  String _cardLogo = 'assets/images/card.png';
  String _cardBrandName = 'Новая карта';
  String _displayCardNumber = '';

  /// Example logic for updating card logo based on first digits
  void _updateCardLogo(String input) {
    _displayCardNumber = input;
    final cleanInput = input.replaceAll(' ', '');
    if (cleanInput.startsWith('56')) {
      _cardLogo = 'assets/images/peymont.png';
      _cardBrandName = 'Mastercard';
    } else if (cleanInput.startsWith('40')) {
      _cardLogo = 'assets/images/visa1.png';
      _cardBrandName = 'Visa';
    } else {
      _cardLogo = 'assets/images/card.png';
      _cardBrandName = 'Новая карта';
    }
  }

  /// Save card info to SharedPreferences
  Future<void> saveCardInfo() async {
    final prefs = await SharedPreferences.getInstance();

    final cardInfo = CardInfo(
      cardNumber: _cardNumberController.text,
      cardHolderName: _cardHolderController.text,
      expiryMonth: _selectedMonth,
      expiryYear: _selectedYear,
      cvc: _cvcController.text,
      isDefault: _isDefault,
    );

    final cardInfoJson = jsonEncode(cardInfo.toJson());
    await prefs.setString('card_info', cardInfoJson);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Card information saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Добавить карту"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacing
                SizedBox(height: 2.h),

                // The card form widget
                CardFormWidget(
                  cardNumberController: _cardNumberController,
                  onCardNumberChanged: (value) {
                    setState(() {
                      _updateCardLogo(value);
                    });
                  },
                  cvcController: _cvcController,
                  cardHolderController: _cardHolderController,
                  selectedMonth: _selectedMonth,
                  selectedYear: _selectedYear,

                  /// Because DropdownButton<String> expects `String? val`,
                  /// we do a null-check before assigning
                  onMonthChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedMonth = val;
                      });
                    }
                  },
                  onYearChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedYear = val;
                      });
                    }
                  },
                  isDefault: _isDefault,
                  onDefaultChanged: (val) {
                    setState(() {
                      _isDefault = val;
                    });
                  },
                  cardLogo: _cardLogo,
                ),

                SizedBox(height: 3.h),

                // Save button
                GestureDetector(
                  onTap: saveCardInfo,
                  child: Container(
                    height: 8.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Сохранить",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
