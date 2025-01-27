import 'dart:convert';
import 'package:http/http.dart' as http;

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

  static generateComparisonResponse(String message1, String message2) {}
}
