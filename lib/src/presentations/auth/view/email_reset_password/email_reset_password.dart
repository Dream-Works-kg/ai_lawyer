import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:ai_lawyer/src/presentations/auth/view/email_virify/views/email_virify_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailResetPassword extends StatelessWidget {
  const EmailResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(showArrowBackButton: true),
            SizedBox(height: 7.h),
            Text(
              'Ведите свой email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTextField(
              controller: controller,
              icon: CupertinoIcons.mail,
              hintText: 'Введите email',
              obscureText: false,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButtom(
              title: 'Дальше',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailVirifyView(
                        emailUser: controller.text,
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
