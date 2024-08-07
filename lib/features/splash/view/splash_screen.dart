import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  _check() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      context.pushReplacement('/intro');
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
