import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: changeColorFromHex("#F6F6F6"),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1722929606674-73c6e0bf7b17?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "test@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Abebe Melese",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 27,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //first row
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: changeColorFromHex("#EEE5FF"),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.menu_book,
                                size: 30,
                                color: changeColorFromHex("#7F3DFF"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Account",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //second row
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: changeColorFromHex("#EEE5FF"),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.settings,
                                size: 30,
                                color: changeColorFromHex("#7F3DFF"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Setting",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 3rd row
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: changeColorFromHex("#EEE5FF"),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.settings,
                                size: 30,
                                color: changeColorFromHex("#7F3DFF"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Setting",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // logout
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: changeColorFromHex("#FFE2E4"),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.logout,
                                size: 30,
                                color: changeColorFromHex("#FD4654"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
