import 'dart:convert';

import 'package:ai_lawyer/src/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

class OpenAIService {
  static const _apiKey =
      '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';
  static const _baseUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<String> generateChatGPTResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4-turbo',
          'messages': [
            {
              'role': 'user',
              'content': userMessage,
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        // Явное декодирование UTF-8
        final decodedBody = json.decode(utf8.decode(response.bodyBytes));
        final content =
            decodedBody['choices'][0]['message']['content'] as String;
        return content.trim();
      } else {
        print('Ошибка: ${response.statusCode} ${response.body}');
        return 'Ошибка: ${response.body}';
      }
    } catch (error) {
      print('Ошибка при вызове OpenAI API: $error');
      return 'Ошибка: $error';
    }
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _response = 'Generating response...';
    });

    final result = await OpenAIService.generateChatGPTResponse(userMessage);

    setState(() {
      _response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT Flutter Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User Prompt Field
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter your prompt'),
            ),
            const SizedBox(height: 16),

            // Send Button
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Send'),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
