import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(
            child: SlideTransition(
              position: _animation,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomAppBar(
                        showArrowBackButton: true,
                        showTrailingButton: true,
                        onTapTrailing: () {
                          Navigator.push(
                            context,
                            CupertinoDialogRoute(
                              builder: (context) => CardDetailsViews(),
                              context: context,
                            ),
                          );
                        },
                      ),
                      ChatViewTitlesWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: CustomChatTextField(
              prefixIcononTap: () {},
              suffixIcon: CupertinoIcons.paperplane,
              hintText: "Отправить сообщение.",
            ),
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
