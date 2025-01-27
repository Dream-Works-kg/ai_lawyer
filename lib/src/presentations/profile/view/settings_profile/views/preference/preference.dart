import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/views/information/information.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/views/invite_friends/invite_friends.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/views/my_card/my_card.dart';
import 'package:ai_lawyer/src/presentations/profile/view/settings_profile/views/password/password.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Preference extends StatelessWidget {
  const Preference({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            CustomAppBar(
              showArrowBackButton: true,
              title: "Предпочтения",
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: ListView(
                  children: [
                    buildPreferenceItem(
                      imagePath: "assets/images/user.png",
                      title: "Информация учётной записи",
                      subtitle: "Измените данные своей учётной записи",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Information(),
                          ),
                        );
                      },
                    ),
                    buildPreferenceItem(
                      imagePath: "assets/images/eyes.png",
                      title: "Пароль",
                      subtitle: "Изменить пароль",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Password(),
                          ),
                        );
                      },
                    ),
                    buildPreferenceItem(
                      imagePath: "assets/images/pey.png",
                      title: "Способы оплаты",
                      subtitle: "Добавьте свой кредит/кредитные карты",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCard(),
                          ),
                        );
                      },
                    ),
                    buildPreferenceItem(
                      imagePath: "assets/images/pen.png",
                      title: "Пригласите друзей",
                      subtitle: "Получите 3 доллара за каждое приглашение!",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InviteFriends(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Один пункт настроек
  Widget buildPreferenceItem({
    required String imagePath,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              color: Colors.white,
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
