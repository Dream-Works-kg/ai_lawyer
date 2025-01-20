import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:ai_lawyer/src/presentations/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    final List<String> images = [
      'assets/images/on1.png',
      'assets/images/on2.png',
      'assets/images/on3.png',
    ];
    final List<String> titles = [
      'Откройте силу\n будущего ИИ',
      'Чат с вашим\n любимым ИИ',
      'Усильте свой разум\n Сила с помощью ИИ',
    ];

    void navigateToNextView() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    }

    return CustomScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 7.h,
            right: 5.w,
            child: TextButton(
              onPressed: () {
                pageController.animateToPage(
                  images.length - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFFD6D6D6),
                  fontSize: 18.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15.h,
            child: SizedBox(
              width: 100.w,
              height: 66.1.h,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 50.h,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(35.61),
                        ),
                      ),
                      Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Пообщайтесь с самым умным ИИ\nбудущего Испытайте мощь ИИ вместе с нами',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: images.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 12.sp,
                  dotWidth: 17.sp,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 8.w,
            right: 8.w,
            child: GestureDetector(
              onTap: () {
                if (pageController.page! < images.length - 1) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  navigateToNextView();
                }
              },
              child: Container(
                width: double.infinity,
                height: 6.4.h,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.27, vertical: 17.18),
                decoration: ShapeDecoration(
                  color: Color(0x7F232627),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(95.45),
                  ),
                ),
                child: Text(
                  'Продолжить',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
