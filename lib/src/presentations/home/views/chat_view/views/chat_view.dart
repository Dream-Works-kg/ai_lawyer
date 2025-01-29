import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:ai_lawyer/src/presentations/home/views/chat_view/widget/chat_view_titles_widget.dart';
import 'package:ai_lawyer/src/presentations/home/views/chat_view/widget/custom_chat_text_field.dart';
import 'package:ai_lawyer/src/service/chat_service/chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  final OpenAIService _openAIService = OpenAIService();
  final List<Map<String, String>> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  bool hasUserSentMessage = true;
  bool isLoading = false;

  final String _systemMessage =
      "Ты юридический ассистент и адвокат. Ты знаешь все законы Кыргызской Республики. Ты отвечаешь только на юридические вопросы. Если вопрос не касается юриспруденции, отвечай: 'Извините, я могу отвечать только на юридические вопросы.'";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  Future<void> _sendMessage(String userMessage) async {
    setState(() {
      _messages.add({"sender": "user", "text": userMessage});
      hasUserSentMessage = false;
      isLoading = true;
    });

    _messageController.clear();

    try {
      final aiResponse = await _openAIService.sendMessage(
        userMessage,
        systemMessage: _systemMessage,
      );
      setState(() {
        _messages.add({"sender": "ai", "text": aiResponse});
      });
    } catch (e) {
      setState(() {
        _messages.add({"sender": "ai", "text": e.toString()});
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
// 

//

// 
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SlideTransition(
              position: _animation,
              child: Column(
                children: [
                  CustomAppBar(
                    showArrowBackButton: true,
                    showTrailingButton: true,
                    onTapTrailing: () {
                      Navigator.push(
                        context,
                        CupertinoDialogRoute(
                          builder: (context) => const CardDetailsViews(),
                          context: context,
                        ),
                      );
                    },
                  ),
                  hasUserSentMessage
                      ? ChatViewTitlesWidget()
                      : const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                itemCount: _messages.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (isLoading && index == _messages.length) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 10.h,
                        width: 16.w,
                        child: Lottie.asset(
                          'assets/lottie/loading.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  final message = _messages[index];
                  final isUser = message['sender'] == "user";
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color(0xFF4C4DDC)
                            : const Color(0xFF2C2C2E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message['text'] ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomChatTextField(
              controller: _messageController,
              prefixIcononTap: () {
                if (_messageController.text.isNotEmpty) {
                  _sendMessage(_messageController.text);
                }
              },
              suffixIcon: CupertinoIcons.paperplane,
              hintText: "Отправить сообщение.",
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
