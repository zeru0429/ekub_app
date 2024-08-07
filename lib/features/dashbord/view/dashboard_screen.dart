// ignore_for_file: must_be_immutable

import 'package:ekub_app/features/dashbord/widget/bottom_nav_bar.dart';
import 'package:ekub_app/features/dashbord/widget/profile_screen.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    Text("data 0"),
    Text("data 1"),
    Text("data 2"),
    Text("data 3"),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: navItems,
          currentIndex: _currentIndex,
          iconSize: 24,
          selectedItemColor: changeColorFromHex("#7F3DFF"),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 14,
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          selectedFontSize: 16,
          selectedIconTheme: IconThemeData(
            color: changeColorFromHex("#7F3DFF"),
          ),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: Center(child: _pages[_currentIndex]));
  }
}
