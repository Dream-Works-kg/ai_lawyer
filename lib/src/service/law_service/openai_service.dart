import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  // API-ключ. Лучше использовать secure storage или переменные окружения.
  static const String _apiKey = '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';
  static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  /// Метод для сравнения двух сообщений
  static Future<String> generateComparisonResponse(String message1, String message2) async {
    if (_apiKey.isEmpty) {
      return 'Ошибка: API Key не установлен.';
    }

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4-turbo',
          'messages': [
            {
              'role': 'system',
              'content': 'Вы — помощник, который сравнивает два текста и предоставляет подробный анализ их различий и сходств. Отвечайте на русском языке.'
            },
            {
              'role': 'user',
              'content': 'Сравните следующие два сообщения и предоставьте подробный анализ на русском языке:\n\nСообщение 1: $message1\n\nСообщение 2: $message2'
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final decodedBody = json.decode(utf8.decode(response.bodyBytes));
        final content = decodedBody['choices'][0]['message']['content'] as String;
        return content.trim();
      } else if (response.statusCode == 401) {
        return 'Ошибка: Неверный API-ключ.';
      } else if (response.statusCode == 429) {
        return 'Ошибка: Превышен лимит запросов.';
      } else {
        return 'Ошибка: ${response.statusCode} ${response.reasonPhrase}';
      }
    } catch (error) {
      return 'Ошибка соединения: $error';
    }
  }
}
