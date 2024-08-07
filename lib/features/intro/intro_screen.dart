import 'package:ekub_app/common/widgets/button/custom_button.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //image container
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Image.asset(
                'assets/images/intro1.png',
                fit: BoxFit.fill,
              ),
            ),
            // titile text Container
            Container(
              width: 240,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Wrap(
                    children: [
                      Text(
                        "Gain total control of your money",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Become your own money manager and make every cent count",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //dote container
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: changeColorFromHex("#7F3DFF"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // sign up button
            RectangularButtonWidget(
              titile: "SignUp",
              onTap: () {},
              textColor: Colors.white,
              bgColor: changeColorFromHex("#7F3DFF"),
            ),
            RectangularButtonWidget(
              titile: "Login",
              onTap: () {
                context.push('/login');
              },
              textColor: changeColorFromHex("#7F3DFF"),
              bgColor: changeColorFromHex("#EEE5FF"),
            ),
          ],
        ),
      ),
    );
  }
}
