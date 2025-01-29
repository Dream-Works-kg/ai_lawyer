import 'package:dio/dio.dart';

class OpenAIService {
  static const String openAiApiKey =
      "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"; // Replace with your key.

  final Dio _dio;
  OpenAIService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://api.openai.com/v1",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $openAiApiKey",
            },
          ),
        );

  Future<String> sendMessage(String userMessage,
      {required String systemMessage}) async {
    try {
      final response = await _dio.post(
        "/chat/completions",
        data: {
          "model":
              "gpt-3.5-turbo", // Change to "gpt-4-turbo" if you have access.
          "messages": [
            {"role": "system", "content": systemMessage},
            {"role": "user", "content": userMessage},
          ],
        },
      );

      if (response.statusCode == 200) {
        return response.data['choices'][0]['message']['content'];
      } else {
        throw Exception("Ошибка: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Ошибка сети: ${e.toString()}");
    }
  }
}
