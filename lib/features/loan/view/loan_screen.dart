import 'package:ekub_app/common/widgets/button/dialog_button.dart';
import 'package:ekub_app/common/widgets/text/dialog_titile.dart';
import 'package:ekub_app/features/loan/bloc/index.dart';
import 'package:ekub_app/features/loan/widget/add_loan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
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
    context.read<LoanBloc>().add(FetchLoanEvent(take: 10, skip: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
      ),
      body: BlocBuilder<LoanBloc, LoanState>(
        builder: (cnx, currentState) {
          if (currentState is UnLoanState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amberAccent),
            );
          }
          if (currentState is ErrorLoanState) {
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
          if (currentState is InLoanState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.loans.first.amount.toString()),
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
          title: const DialogTitileWidget(title: "Give Loan"),
          //  styling
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: ThemeData().colorScheme.surface,
          contentPadding: const EdgeInsets.all(10),
          // context
          content: const AddLoanWidget(),
        );
      },
    );
  }
}
