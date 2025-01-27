import 'package:ai_lawyer/src/core/components/components.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 19.h,
              ),
              SvgPicture.asset('assets/svg/logo.svg'),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Добро пожаловать в\n AI Lawyer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButtom(
                containerColor: Color(0x7F232627),
                title: 'Log in',
                radius: BorderRadius.circular(90),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButtom(
                containerColor: Color(0xFF232627),
                radius: BorderRadius.circular(90),
                title: 'Sing up',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingUpView(),
                    ),
                  );
                },
                textColor: Color(0xFFB1B1B1),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Продолжить с аккаунтами',
                style: TextStyle(
                  color: Color(0xFFACADB9),
                  fontSize: 15.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GoogleAndFacebookButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
