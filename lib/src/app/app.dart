import 'package:ai_lawyer/src/presentations/on_bording/on_bording.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      maxMobileWidth: 450,
      builder: (p0, p1, p2) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ai Lawyer',
        theme: ThemeData.dark(),
        home: OnBordingView(),
      ),
    );
  }
}
