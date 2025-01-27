import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Не удалось открыть телефон для номера $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141718),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 15.sp),
                Image.asset("assets/images/bot.png"),
                SizedBox(width: 15.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Полезно",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    _makePhoneCall('+996505582244');
                  },
                  child: CircleAvatar(
                    radius: 22.sp,
                    backgroundColor: const Color(0xFF2B2D30),
                    child: const Icon(Icons.phone, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Divider(
              color: Colors.white,
              thickness: 3.sp,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff141718),
        child: Row(
          children: [
            // Иконка галерии
            Container(
              width: 14.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: Color(0xff2B2D30),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.image, color: Colors.white),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15.sp),
                height: 8.h,
                decoration: BoxDecoration(
                  color: Color(0xff2B2D30),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFFACADB9),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: Color(0xFFACADB9),
                    decoration: InputDecoration(
                      hintText: 'Напишите сейчас…',
                      suffixIcon: Icon(Icons.send, color: Color(0xFFACADB9)),
                      hintStyle: TextStyle(
                        color: Color(0xFFACADB9),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
