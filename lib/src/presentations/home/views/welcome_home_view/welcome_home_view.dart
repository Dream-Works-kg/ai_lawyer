import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeHomeView extends StatefulWidget {
  const WelcomeHomeView({super.key});

  @override
  State<WelcomeHomeView> createState() => _WelcomeHomeViewState();
}

class _WelcomeHomeViewState extends State<WelcomeHomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/logo.svg',
                height: 26.h,
              ),
              SizedBox(height: 3.h),
              Text(
                'Добро пожаловать в\nAi Lawyer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Начните общаться с Ai Lawyer прямо сейчас.\nВы можете спросить меня о чем угодно.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6E6E6E),
                  fontSize: 15.5.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 9.h),
              CustomButtom(
                title: 'Начать чат',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
