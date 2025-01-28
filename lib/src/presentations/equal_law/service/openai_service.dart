// lib/src/services/openai_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  // Правильное обращение к переменной окружения
  static final String _apiKey = dotenv.env['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'] ?? '';
  static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<String> generateComparisonResponse(
      String message1, String message2) async {
    if (_apiKey.isEmpty) {
      return 'API Key is not set. Please check your .env file.';
    }

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
              'role': 'system',
              'content':
                  'You are an assistant that compares two pieces of text and provides a detailed analysis of their differences and similarities.'
            },
            {
              'role': 'user',
              'content':
                  'Compare the following two messages and provide a detailed analysis:\n\nMessage 1: $message1\n\nMessage 2: $message2'
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final decodedBody = json.decode(utf8.decode(response.bodyBytes));
        final content = decodedBody['choices'][0]['message']['content'] as String;
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
