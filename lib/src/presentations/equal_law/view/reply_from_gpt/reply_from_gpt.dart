// lib/src/presentations/equal_law/view/reply_from_gpt/reply_from_gpt.dart
import 'package:ai_lawyer/src/core/core.dart'; // Убедитесь, что путь правильный
import 'package:flutter/material.dart';

class ReplyFromGpt extends StatelessWidget {
  final String response;

  const ReplyFromGpt({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Ответ от GPT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            response,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
