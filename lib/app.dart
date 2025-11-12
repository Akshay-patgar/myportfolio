import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akshay Patgar',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(color: Colors.black87),
          bodyMedium: GoogleFonts.poppins(color: Colors.grey.shade600),
          titleLarge: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.grey.shade50,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1434A4),
          secondary: Color(0xFFF0F2F5),
          surface: Colors.white,
          onSurface: Colors.black87,
        ),
        navigationBarTheme: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: Color(0xFF1434A4));
            }
            return IconThemeData(color: Colors.grey.shade600);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            return TextStyle(
              color: states.contains(WidgetState.selected)
                  ? Color(0xFF1434A4)
                  : Colors.grey.shade600,
            );
          }),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
