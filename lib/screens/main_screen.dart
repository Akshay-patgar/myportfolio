import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_page.dart';
import 'contact_page.dart';
import 'home_page.dart';
import 'projects_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AboutPage(),
    ProjectsPage(),
    ContactPage(),
  ];

  final List<String> _pageTitles = const [
    'Home',
    'About',
    'Projects',
    'Contact',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double mobileBreakpoint = 600;
    final bool isMobile = MediaQuery.of(context).size.width < mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Akshay',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(
                text: ' Patgar',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        actions: isMobile
            ? null
            : [
                const SizedBox(width: 16),
                ...List.generate(
                  _pageTitles.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () => _onItemTapped(index),
                      child: Text(
                        _pageTitles[index],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: _selectedIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black54,
                          fontWeight: _selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 900,
          ),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: isMobile
          ? NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              height: 70,
              backgroundColor: Colors.white,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'About',
                ),
                NavigationDestination(
                  icon: Icon(Icons.folder_open),
                  selectedIcon: Icon(Icons.folder),
                  label: 'Projects',
                ),
                NavigationDestination(
                  icon: Icon(Icons.contact_mail_outlined),
                  selectedIcon: Icon(Icons.contact_mail),
                  label: 'Contact',
                ),
              ],
            )
          : null,
    );
  }
}
