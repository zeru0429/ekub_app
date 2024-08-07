import 'package:ekub_app/features/dashbord/widget/single_row.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: changeColorFromHex("#F6F6F6"),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
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
                      SingleRowWidgetInProfile(
                        iconColor: changeColorFromHex("#7F3DFF"),
                        iconBg: changeColorFromHex("#EEE5FF"),
                        title: "Account",
                        iconData: Icons.menu_book,
                      ),
                      SingleRowWidgetInProfile(
                        iconColor: changeColorFromHex("#7F3DFF"),
                        iconBg: changeColorFromHex("#EEE5FF"),
                        title: "Setting",
                        iconData: Icons.settings,
                      ),
                      SingleRowWidgetInProfile(
                        iconColor: changeColorFromHex("#7F3DFF"),
                        iconBg: changeColorFromHex("#EEE5FF"),
                        title: "Export",
                        iconData: Icons.upload,
                      ),
                      SingleRowWidgetInProfile(
                        iconColor: changeColorFromHex("#FD4654"),
                        iconBg: changeColorFromHex("#FFE2E4"),
                        title: "Logout",
                        iconData: Icons.logout,
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
