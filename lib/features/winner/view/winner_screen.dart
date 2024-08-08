import 'package:ekub_app/common/widgets/button/dialog_button.dart';
import 'package:ekub_app/common/widgets/text/dialog_titile.dart';
import 'package:ekub_app/features/winner/widget/add_winner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Winner page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blueAccent,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // actions of the dialog box
          actions: [
            DialogButtonWidget(
              titile: "save",
              onTap: () {},
              color: Colors.blue,
            ),
            DialogButtonWidget(
              titile: "cancel",
              onTap: () {
                context.pop();
              },
              color: Colors.redAccent,
            ),
          ],
          //  title
          title: const DialogTitileWidget(title: "Add Winner"),
          //  styling
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: ThemeData().colorScheme.surface,
          contentPadding: const EdgeInsets.all(10),
          // context
          content: const AddWinnerWidget(),
        );
      },
    );
  }
}
