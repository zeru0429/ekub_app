import 'package:ekub_app/features/category/view/category_screen.dart';
import 'package:ekub_app/features/dashbord/view/dashboard_screen.dart';
import 'package:ekub_app/features/dashbord/widget/bottom_nav_bar.dart';
import 'package:ekub_app/features/dashbord/widget/profile_screen.dart';
import 'package:ekub_app/features/deposit/view/deposit_screen.dart';
import 'package:ekub_app/features/loan/view/loan_screen.dart';
import 'package:ekub_app/features/lottery/view/lottery_screen.dart';
import 'package:ekub_app/features/user/view/user_screen.dart';
import 'package:ekub_app/features/winner/view/winner_screen.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    DashboardScreen(),
    CategoryScreen(),
    LoanScreen(),
    Text("data"),
    DepositScreen(),
    WinnerScreen(),
    ProfileScreen(),
    LotteryScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User layout"),
        ),
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
