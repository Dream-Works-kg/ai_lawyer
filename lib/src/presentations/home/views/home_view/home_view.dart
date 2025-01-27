import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/home/home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isFirstTimeUser = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const WelcomeHomeView(),
    );
  }
}
