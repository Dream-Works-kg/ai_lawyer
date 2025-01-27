import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this package for PIN input functionality

class PhoneVirifyView extends StatefulWidget {
  const PhoneVirifyView(
      {super.key, required this.phoneNumber, required this.isResetPhoneVerify});
  final String phoneNumber;
  final bool isResetPhoneVerify;

  @override
  State<PhoneVirifyView> createState() => _PhoneVirifyViewState();
}

class _PhoneVirifyViewState extends State<PhoneVirifyView> {
  Future<void> _saveAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSaved', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CustomBottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xFF232627),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            CustomAppBar(
              backgroundColor: const Color(0xFF232627),
              showArrowBackButton: true,
              lidingButtomColor: const Color(0xFF141718),
            ),
            SizedBox(height: 7.h),
            Container(
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
              decoration: ShapeDecoration(
                color: const Color(0xFF141718),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x0C241F2F),
                    blurRadius: 55.48,
                    offset: Offset(0, 13.32),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Подтвердите номер телефона',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Мы отправили код на ваш номер телефона',
                    style: TextStyle(
                      color: const Color(0xFFACADB9),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    widget.phoneNumber,
                    style: TextStyle(
                      color: const Color(0xFFACADB9),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Pin input
                  Pinput(
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 14.w,
                      height: 14.w,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFACADB9)),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF232627),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 14.w,
                      height: 14.w,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF232627),
                      ),
                    ),
                    showCursor: true,
                    onChanged: (value) {
                      // Handle code input
                    },
                  ),
                  SizedBox(height: 4.h),
                  CustomButtom(
                    title: 'Проверка',
                    onTap: () {
                      if (widget.isResetPhoneVerify == false) {
                        _saveAndNavigate();
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordView(),
                            ));
                      }
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomButtom(
                    title: 'Отправить еще раз',
                    onTap: () {
                      // Resend the code
                    },
                    containerColor: const Color(0xFF232627),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
