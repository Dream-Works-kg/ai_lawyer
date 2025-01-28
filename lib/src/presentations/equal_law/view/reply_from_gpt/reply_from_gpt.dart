import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/reply_from_gpt/view/input_field.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/reply_from_gpt/view/input_form.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/reply_from_gpt/view/result_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ai_lawyer/src/service/law_service/openai_service.dart';

class ReplyFromGpt extends StatefulWidget {
  const ReplyFromGpt({super.key});

  @override
  State<ReplyFromGpt> createState() => _ReplyFromGptState();
}

class _ReplyFromGptState extends State<ReplyFromGpt> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _isGenerating = false;
  bool _showResult = false;
  String? _response;

  Future<void> _sendMessages() async {
    final message1 = _controller1.text.trim();
    final message2 = _controller2.text.trim();

    if (message1.isEmpty || message2.isEmpty) {
      showErrorSnackbar(context, 'Пожалуйста, заполните оба поля.');
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      final result =
          await OpenAIService.generateComparisonResponse(message1, message2);
      setState(() {
        _response = result;
        _showResult = true;
      });
    } catch (e) {
      showErrorSnackbar(context, 'Ошибка: $e');
    } finally {
      setState(() {
        _isGenerating = false;
      });
    }
  }

  void _reset() {
    setState(() {
      _showResult = false;
      _response = null;
      _controller1.clear();
      _controller2.clear();
    });
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
      body: Stack(
        children: [
          if (!_isGenerating)
            Padding(
              padding: const EdgeInsets.all(16),
              child: _showResult
                  ? ResultView(response: _response, onReset: _reset)
                  : InputForm(
                      controller1: _controller1,
                      controller2: _controller2,
                      isGenerating: _isGenerating,
                      onSendMessages: _sendMessages,
                    ),
            ),
          if (_isGenerating)
            Center(
              child: Lottie.asset(
                "assets/lottie/5.json",
                height: 35.h,
              ),
            ),
        ],
      ),
    );
  }
}