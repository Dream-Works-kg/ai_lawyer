import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// The card form widget
class CardFormWidget extends StatelessWidget {
  final TextEditingController cardNumberController;
  final ValueChanged<String> onCardNumberChanged;
  final TextEditingController cvcController;
  final TextEditingController cardHolderController;
  final String selectedMonth;
  final String selectedYear;
  final ValueChanged<String?> onMonthChanged; // must accept nullable
  final ValueChanged<String?> onYearChanged;  // must accept nullable
  final bool isDefault;
  final ValueChanged<bool> onDefaultChanged;
  final String cardLogo;

  const CardFormWidget({
    Key? key,
    required this.cardNumberController,
    required this.onCardNumberChanged,
    required this.cvcController,
    required this.cardHolderController,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onMonthChanged,
    required this.onYearChanged,
    required this.isDefault,
    required this.onDefaultChanged,
    required this.cardLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// We generate month items from 01 to 12
    final monthItems = List.generate(
      12,
      (index) {
        final month = (index + 1).toString().padLeft(2, '0');
        return DropdownMenuItem(
          value: month,
          child: Text(month, style: const TextStyle(color: Colors.white)),
        );
      },
    );

    /// We generate year items from 2023 to 2032 
    /// (or however many you want)
    final yearItems = List.generate(
      10,
      (index) {
        // Starting from 2023
        final yearInt = 2023 + index; 
        // .substring(2) will give "23", "24", ...
        final yearStr = yearInt.toString().substring(2);
        return DropdownMenuItem(
          value: yearStr,
          child: Text(yearStr, style: const TextStyle(color: Colors.white)),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CARD NUMBER
        Text(
          "Номер карты",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        SizedBox(height: 1.h),
        TextField(
          controller: cardNumberController,
          onChanged: onCardNumberChanged,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
          ],
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            hintText: "•••• •••• ••••",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(cardLogo, height: 24),
            ),
          ),
        ),

        SizedBox(height: 2.h),

        // CARD HOLDER
        Text(
          "Держатель карты",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        SizedBox(height: 1.h),
        TextField(
          controller: cardHolderController,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            hintText: "Имя владельца",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),

        SizedBox(height: 2.h),

        // EXPIRY & CVC
        Row(
          children: [
            // MONTH
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Месяц",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedMonth, // must be in monthItems
                      onChanged: onMonthChanged,
                      underline: const SizedBox(),
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.grey.shade900,
                      isExpanded: true,
                      items: monthItems,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 3.w),

            // YEAR
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Год",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedYear, // must be in yearItems
                      onChanged: onYearChanged,
                      underline: const SizedBox(),
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.grey.shade900,
                      isExpanded: true,
                      items: yearItems,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 3.w),

            // CVC
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CVC",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 1.h),
                  TextField(
                    controller: cvcController,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
                      hintText: "123",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 2.h),

        // DEFAULT SWITCH
        Row(
          children: [
            Switch(
              value: isDefault,
              onChanged: onDefaultChanged,
              activeColor: Colors.blue,
            ),
            Flexible(
              child: Text(
                "Сделать картой по умолчанию",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
