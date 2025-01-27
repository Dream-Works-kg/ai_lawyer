import 'dart:convert';

import 'package:ai_lawyer/src/app/app.dart';
import 'package:ai_lawyer/src/presentations/cart/view/cards_view/view/all_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await CardStorage.saveSampleCardsToPrefs();
  runApp(App());
}


class CardStorage {
  // This key is where we store the list of card JSON strings in SharedPreferences
  static const String myCardsKey = 'my_cards';

  /// Save two sample cards for testing:
  /// 1) "5562 5566 5577 1987"
  /// 2) "9999 8888 7777 1411"
  ///
  /// In a real app, you'd save real user-entered data.
  static Future<void> saveSampleCardsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // We create two sample cards with different card numbers
    final card1 = {
      "cardNumber": "5562 5566 5577 1987",
      "cardHolder": "John Doe",
      "month": "05",
      "year": "24",
      "cvc": "123",
      "isDefault": false
    };
    final card2 = {
      "cardNumber": "9999 8888 7777 1411",
      "cardHolder": "Jane Smith",
      "month": "06",
      "year": "25",
      "cvc": "987",
      "isDefault": false
    };

    // Turn each map into a JSON string
    final card1Json = jsonEncode(card1);
    final card2Json = jsonEncode(card2);

    // Load current cards (if any) and add these two
    final existing = prefs.getStringList(myCardsKey) ?? [];

    // Add each card if it isn't already in the list
    if (!existing.contains(card1Json)) {
      existing.add(card1Json);
    }
    if (!existing.contains(card2Json)) {
      existing.add(card2Json);
    }

    await prefs.setStringList(myCardsKey, existing);
  }
}
