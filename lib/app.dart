import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'home_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akshay Patgar — Software Developer',
      theme: AppTheme.build(),
      home: const HomeScreen(),
    );
  }
}
