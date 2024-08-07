import 'package:ekub_app/features/category/view/category_screen.dart';
import 'package:ekub_app/features/dashbord/view/dashboard_screen.dart';
import 'package:ekub_app/features/deposit/view/deposit_page.dart';
import 'package:ekub_app/features/intro/intro_screen.dart';
import 'package:ekub_app/features/loan/view/loan_screen.dart';
import 'package:ekub_app/features/forget_password/view/forget_password.dart';
import 'package:ekub_app/features/login/view/login_screen.dart';
import 'package:ekub_app/features/reset_password/view/new_password.dart';
import 'package:ekub_app/features/remaning_payment/view/remaining_payment_screen.dart';
import 'package:ekub_app/features/splash/view/splash_screen.dart';
import 'package:ekub_app/features/winner/view/winner_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter = GoRouter(
  //initial location
  initialLocation: '/',
  //redirect
  redirect: (context, state) {},
  // all app routes
  routes: [
    GoRoute(
      path: '/',
      name: 'splash screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/intro',
      name: 'intro screen',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login screen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/forget_password',
      name: 'forget password screen',
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(
      path: '/reset_password',
      name: 'new password screen',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard screen',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/category',
      name: 'category screen',
      builder: (context, state) => const CategoryScreen(),
    ),
    GoRoute(
      path: '/lottery',
      name: 'lottery screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/deposit',
      name: 'deposit screen',
      builder: (context, state) => const DepositPage(),
    ),
    GoRoute(
      path: '/loan',
      name: 'loan screen',
      builder: (context, state) => const LoanScreen(),
    ),
    GoRoute(
      path: '/winner',
      name: 'winner screen',
      builder: (context, state) => const WinnerScreen(),
    ),
    GoRoute(
      path: '/remaining payment',
      name: 'remaining payment screen',
      builder: (context, state) => const RemainingPaymentScreen(),
    ),
  ],
);
