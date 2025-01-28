import 'package:ai_lawyer/src/app/app.dart';
import 'package:ai_lawyer/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:math';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(App());
}

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.title});
  final String title;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<types.Message> _messages = [];
  final types.User _currentUser =
      const types.User(id: '12345', firstName: 'You');

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          bottom: 3.h,
        ),
        child: Column(
          children: [
            CustomAppBar(
              backgroundColor: Colors.white,
              title: widget.title,
              showArrowBackButton: true,
              textStyle: TextStyle(
                color: const Color(0xFF0F0F0F),
                fontSize: 16.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Chat(
                messages: _messages,
                onSendPressed: _handleSendPressed,
                user: _currentUser,
                customBottomWidget: Container(
                  width: double.infinity,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF6F6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Введите сообщение...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFA1A1A1),
                              fontSize: 16.sp,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_messageController.text.isNotEmpty) {
                            _handleSendPressed(
                              types.PartialText(text: _messageController.text),
                            );
                            _messageController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send_rounded,
                          color: Color(0xFF4C4DDC),
                        ),
                      ),
                    ],
                  ),
                ),
                theme: DefaultChatTheme(
                  inputTextColor: Colors.black,
                  inputContainerDecoration: const BoxDecoration(
                    color: Color(0xFFEAEAEA),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  inputTextStyle: TextStyle(fontSize: 18.sp),
                  primaryColor: const Color(0xFF0044FF),
                  secondaryColor: const Color(0xFFEAEAEA),
                  sentMessageBodyTextStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                  receivedMessageBodyTextStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                inputOptions: const InputOptions(
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final newMessage = types.TextMessage(
      author: _currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Random().nextInt(10000).toString(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, newMessage);
    });
  }
}
