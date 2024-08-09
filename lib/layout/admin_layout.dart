// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/category/bloc/category_bloc.dart';
import 'package:ekub_app/features/category/bloc/category_state.dart';
import 'package:ekub_app/features/category/provider/category_provider.dart';
import 'package:ekub_app/features/category/repository/category_repository.dart';
import 'package:ekub_app/features/category/view/category_screen.dart' as view;
import 'package:ekub_app/features/dashbord/view/dashboard_screen.dart';
import 'package:ekub_app/features/dashbord/widget/bottom_nav_bar.dart';
import 'package:ekub_app/features/dashbord/widget/profile_screen.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_bloc.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_state.dart';
import 'package:ekub_app/features/deposit/provider/deposit_provider.dart';
import 'package:ekub_app/features/deposit/repository/deposit_repository.dart';
import 'package:ekub_app/features/deposit/view/deposit_screen.dart';
import 'package:ekub_app/features/loan/bloc/index.dart';
import 'package:ekub_app/features/loan/provider/loan_provider.dart';
import 'package:ekub_app/features/loan/repository/loan_repository.dart';
import 'package:ekub_app/features/loan/view/loan_screen.dart';
import 'package:ekub_app/features/lottery/bloc/index.dart';
import 'package:ekub_app/features/lottery/provider/lottery_provider.dart';
import 'package:ekub_app/features/lottery/repository/lottory_repository.dart';
import 'package:ekub_app/features/lottery/view/lottery_screen.dart';
import 'package:ekub_app/features/user/bloc/index.dart';
import 'package:ekub_app/features/user/bloc/user_bloc.dart';
import 'package:ekub_app/features/user/provider/user_provider.dart';
import 'package:ekub_app/features/user/repository/user_repository.dart';
import 'package:ekub_app/features/user/view/user_screen.dart';
import 'package:ekub_app/features/winner/bloc/index.dart';
import 'package:ekub_app/features/winner/provider/winner_provider.dart';
import 'package:ekub_app/features/winner/repository/winner_repository.dart';
import 'package:ekub_app/features/winner/view/winner_screen.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  late http.Client _client;
  // category
  late CategoryProvider _categoryProvider;
  late CategoryRepository _categoryRepository;
  // deposit
  // loan
  late LoanProvider _loanProvider;
  late LoanRepository _loanRepository;

  // winner
  late WinnerProvider _winnerProvider;
  late WinnerRepository _winnerRepository;

  //  user
  late UserProvider _userProvider;
  late UserRepository _userRepository;

  // lottery
  late LotteryProvider _lotteryProvider;
  late LottoryRepository _lotteryRepository;
  // deposit
  late DepositProvider _depositProvider;
  late DepositRepository _depositRepository;

  int _currentIndex = 0;
  final List<Widget> _pages = [
    const DashboardScreen(),
    const view.CategoryScreen(),
    const LoanScreen(),
    const Text("data"),
    const DepositScreen(),
    const WinnerScreen(),
    const ProfileScreen(),
    const LotteryScreen(),
    const UserScreen(),
  ];

  @override
  void initState() {
    _client = http.Client();
    // category
    _categoryProvider = CategoryProvider(client: _client);
    _categoryRepository =
        CategoryRepository(categoryProvider: _categoryProvider);
    // user
    _userProvider = UserProvider(clien: _client);
    _userRepository = UserRepository(userProvider: _userProvider);

    // winner
    _winnerProvider = WinnerProvider(client: _client);
    _winnerRepository = WinnerRepository(winnerProvider: _winnerProvider);
    // lottory
    _lotteryProvider = LotteryProvider(client: _client);
    _lotteryRepository = LottoryRepository(lotteryProvider: _lotteryProvider);
    // loan
    _loanProvider = LoanProvider(client: _client);
    _loanRepository = LoanRepository(loanProvider: _loanProvider);

    // deposit
    _depositProvider = DepositProvider(client: _client);
    _depositRepository = DepositRepository(depositProvider: _depositProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(
            const UnCategoryState(),
            categoryRepository: _categoryRepository,
          ),
        ),
        BlocProvider(
          create: (context) =>
              UserBloc(const UnUserState(), userRepository: _userRepository),
        ),
        BlocProvider(
          create: (context) => WinnerBloc(const UnWinnerState(),
              winnerRepository: _winnerRepository),
        ),
        BlocProvider(
          create: (context) =>
              LoanBloc(const UnLoanState(), loanRepository: _loanRepository),
        ),
        BlocProvider(
          create: (context) => LotteryBloc(
            const UnLotteryState(),
            lotteryRepository: _lotteryRepository,
          ),
        ),
        BlocProvider(
          create: (context) => DepositBloc(
            depositRepository: _depositRepository,
          ),
        ),
      ],
      child: Scaffold(
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
          body: Center(child: _pages[_currentIndex])),
    );
  }
}
