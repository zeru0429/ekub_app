import 'package:ekub_app/common/widgets/button/dialog_button.dart';
import 'package:ekub_app/common/widgets/text/dialog_titile.dart';
import 'package:ekub_app/features/user/bloc/index.dart';
import 'package:ekub_app/features/user/widget/add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() {
    context.read<UserBloc>().add(FetchUserEvent(take: 10, skip: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (cnx, currentState) {
          if (currentState is UnUserState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amberAccent),
            );
          }
          if (currentState is ErrorUserState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: GestureDetector(
                    onTap: _load,
                    child: Container(
                      color: Colors.blue,
                      child: const Text('reload'),
                    ),
                  ),
                ),
              ],
            ));
          }
          if (currentState is InUserState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.users.first.firstName),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
          title: const DialogTitileWidget(title: "Add User"),
          //  styling
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: ThemeData().colorScheme.surface,
          contentPadding: const EdgeInsets.all(10),
          // context
          content: const AddUserWidget(),
        );
      },
    );
  }
}
// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "User Page",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//                 color: Colors.blueAccent,
//               ),
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 _showDialog(context);
//               },
//               child: const Icon(Icons.add),
//             )
//           ],
//         ),
//       ),
   