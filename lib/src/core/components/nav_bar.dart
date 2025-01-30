import 'package:ai_lawyer/src/presentations/equal_law/view/main_law/main_law.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:ai_lawyer/src/presentations/profile/view/profile_user/view/profile_user.dart';
import 'package:ai_lawyer/src/presentations/cart/view/cards_view/cards_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  List<Widget> views = [
    HomeView(),
    CardsView(),
    MainLaw(),
    ProfileUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141718),
      body: views[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF232627),
          border: Border(
            top: BorderSide(
              color: const Color(0xFF2C2C2C),
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF232627),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFFACADB9),
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 23.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                size: 23.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_vert,
                size: 23.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 23.sp,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
