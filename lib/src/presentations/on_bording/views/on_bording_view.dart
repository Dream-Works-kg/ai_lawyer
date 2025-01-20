import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 7.h,
            right: 5.w,
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
          Positioned(
            top: 15.h,
            child: Container(
              width: 100.w,
              height: 60.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/shadovs.png'),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.61),
                ),
              ),
            ),
          ),
          Positioned(
            left: 8.w,
            top: 15.h,
            child: Container(
              width: 80.w,
              height: 50.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/on1.png'),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.61),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:ai_lawyer/src/core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBordingView extends StatelessWidget {
//   const OnBordingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PageController pageController = PageController();

//     return CustomScaffold(
//       body: Stack(
//         children: [
//           // Skip button
//           Positioned(
//             top: 7.h,
//             right: 5.w,
//             child: Text(
//               'Skip',
//               style: TextStyle(
//                 color: Color(0xFFD6D6D6),
//                 fontSize: 18.sp,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           // Main content with PageView
//           Positioned(
//             top: 15.h,
//             child: SizedBox(
//               width: 100.w,
//               height: 60.h,
//               child: PageView(
//                 controller: pageController,
//                 children: [
//                   // First image
//                   Container(
//                     width: 80.w,
//                     height: 50.h,
//                     margin: EdgeInsets.symmetric(horizontal: 8.w),
//                     decoration: ShapeDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/on1.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(35.61),
//                       ),
//                     ),
//                   ),
//                   // Second placeholder image
//                   Container(
//                     width: 80.w,
//                     height: 50.h,
//                     margin: EdgeInsets.symmetric(horizontal: 8.w),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[800],
//                       borderRadius: BorderRadius.circular(35.61),
//                     ),
//                   ),
//                   // Third placeholder image
//                   Container(
//                     width: 80.w,
//                     height: 50.h,
//                     margin: EdgeInsets.symmetric(horizontal: 8.w),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[600],
//                       borderRadius: BorderRadius.circular(35.61),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // SmoothPageIndicator
//           Positioned(
//             bottom: 12.h,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: SmoothPageIndicator(
//                 controller: pageController, // PageController
//                 count: 3,
//                 effect: ExpandingDotsEffect(
//                   dotHeight: 10.sp,
//                   dotWidth: 10.sp,
//                   activeDotColor: Colors.white,
//                   dotColor: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           // Title and description
//           Positioned(
//             bottom: 7.h,
//             left: 8.w,
//             right: 8.w,
//             child: Column(
//               children: [
//                 Text(
//                   'Откройте силу\nбудущего ИИ',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22.sp,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 Text(
//                   'Пообщайтесь с самым умным ИИ\nбудущего Испытайте мощь ИИ вместе с нами',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontFamily: 'Poppins',
//                     color: Colors.grey[400],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Navigation buttons
//           Positioned(
//             bottom: 3.h,
//             left: 8.w,
//             right: 8.w,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     if (pageController.page! > 0) {
//                       pageController.previousPage(
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                       );
//                     }
//                   },
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     if (pageController.page! < 2) {
//                       pageController.nextPage(
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                       );
//                     }
//                   },
//                   icon: Icon(Icons.arrow_forward, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

