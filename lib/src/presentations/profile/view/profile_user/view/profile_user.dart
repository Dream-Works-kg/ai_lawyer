import 'package:ai_lawyer/src/presentations/profile/view/customer_support/customer_support.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/views/preference/preference.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String userName = 'Том Хиллсон';
  String userEmail = 'Tomhill@mail.com';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? userName;
      userEmail = prefs.getString('userEmail') ?? userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Center(
              child: Text(
                'Профиль',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 3.5.h),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              userEmail,
              style: TextStyle(
                color: const Color(0xFF6A6A6B),
                fontSize: 15.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        Icon(Icons.settings, size: 25.sp, color: Colors.white),
                    title: Text(
                      "Предпочтения",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Preference(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 1.8.h),
                  ListTile(
                    leading: Icon(Icons.lock, size: 25.sp, color: Colors.white),
                    title: Text(
                      "Безопасность аккаунта",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white),
                    onTap: () {},
                  ),
                  SizedBox(height: 1.8.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 33.sp, vertical: 5.sp),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Colors.grey.shade600,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      minHeight: 11.5.sp,
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.sp),
                    child: Text(
                      "Отличный",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.8.h),
                  ListTile(
                    leading: Icon(Icons.help_outline,
                        size: 25.sp, color: Colors.white),
                    title: Text(
                      "Поддержка клиентов",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerSupport(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 1.8.h),
                  ListTile(
                    leading:
                        Icon(Icons.logout, size: 25.sp, color: Colors.white),
                    title: Text(
                      "Выйти",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
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
