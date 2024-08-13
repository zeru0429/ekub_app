// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:ekub_app/utils/color_convertor.dart';
import 'package:ekub_app/utils/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _check();
  }

  _check() async {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final firstTime = await LocalDataStore.getDataString('first_time');
      if (firstTime == null) {
        context.pushReplacement('/intro');
      } else {
        final token = await LocalDataStore.getDataString('token');
        if (token == null) {
          context.pushReplacement('/login');
        } else {
          context.pushReplacement('/admin_layout');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: changeColorFromHex("#7F3DFF"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Positioned(
                left: 15,
                bottom: 5,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: changeColorFromHex("#D24BEF"),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const Text(
                "Enat Ekub",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                  color: Colors.white,
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
