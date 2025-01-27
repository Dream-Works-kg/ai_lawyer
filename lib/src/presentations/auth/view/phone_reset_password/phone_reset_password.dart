import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:ai_lawyer/src/presentations/auth/view/phone_verify/phone_verify.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneResetPassword extends StatefulWidget {
  const PhoneResetPassword({super.key});

  @override
  State<PhoneResetPassword> createState() => _PhoneResetPasswordState();
}

class _PhoneResetPasswordState extends State<PhoneResetPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _phoneFocusNode.addListener(() {
      if (_phoneFocusNode.hasFocus && _phoneController.text.isEmpty) {
        _phoneController.text = '+996 ';
        _phoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: _phoneController.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(showArrowBackButton: true),
            SizedBox(height: 7.h),
            Text(
              'Ведите свой номер',
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
              controller: _phoneController,
              focusNode: _phoneFocusNode,
              icon: Icons.phone_outlined,
              hintText: 'Номер телефона',
              obscureText: false,
              inputFormatters: [
                PhoneNumberFormatter(),
              ],
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
                        builder: (context) => PhoneVirifyView(
                          phoneNumber: _phoneController.text,
                          isResetPhoneVerify: true,
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
