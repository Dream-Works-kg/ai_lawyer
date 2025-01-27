import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/on_bording/on_bording.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool getStatus = false;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedStatus = prefs.getBool('isSaved') ?? false;

      setState(() {
        getStatus = savedStatus;
      });
    } catch (e) {
      debugPrint('Ошибка при чтении SharedPreferences: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      maxMobileWidth: 450,
      builder: (p0, p1, p2) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ai Lawyer',
        theme: ThemeData.dark(),
        home: getStatus ? CustomBottomNavBar() : OnBordingView(),
      ),
    );
  }
}
