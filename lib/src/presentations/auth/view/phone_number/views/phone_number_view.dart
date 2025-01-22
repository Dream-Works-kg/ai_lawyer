import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/auth/auth.dart';
import 'package:ai_lawyer/src/presentations/auth/view/phone_verify/views/phone_virify.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({super.key});

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
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
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              showArrowBackButton: true,
            ),
            SizedBox(height: 3.h),
            Text(
              'Введите номер\nтелефона',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),
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
              height: 4.h,
            ),
            CustomButtom(
              title: 'Проверка',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhoneVirifyView(
                      isResetPhoneVerify: false,
                      phoneNumber: _phoneController.text,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomButtom(
              title: 'Позже',
              onTap: () {},
              containerColor: Color(0xFF232627),
            ),
          ],
        ),
      ),
    );
  }
}
