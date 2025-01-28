// lib/src/screens/main_law.dart
import 'package:ai_lawyer/src/core/core.dart'; // Убедитесь, что путь правильный
import 'package:ai_lawyer/src/service/open_aI_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainLaw extends StatefulWidget {
  const MainLaw({super.key});

  @override
  State<MainLaw> createState() => _MainLawState();
}
class _MainLawState extends State<MainLaw> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _isGenerating = false;
  String? _response; // Поле для отображения ответа

  Future<void> _sendMessages() async {
    final message1 = _controller1.text.trim();
    final message2 = _controller2.text.trim();

    if (message1.isEmpty || message2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, заполните оба поля.')),
      );
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      final result =
          await OpenAIService.generateComparisonResponse(message1, message2);

      setState(() {
        _response = result; // Сохраняем результат для отображения
      });

      // Очистка полей ввода
      _controller1.clear();
      _controller2.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    } finally {
      setState(() {
        _isGenerating = false;
      });
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            // Первое поле ввода сообщения
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'Введите первое сообщение',
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            // Второе поле ввода сообщения
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'Введите второе сообщение',
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            // Кнопка отправки
            ElevatedButton(
              onPressed:   _sendMessages,
              child: _isGenerating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Сравнить'),
            ),
            const SizedBox(height: 16),
            // Отображение ответа
            if (_response != null)
              Text(
                'Ответ: $_response',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
