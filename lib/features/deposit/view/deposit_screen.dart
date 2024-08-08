import 'package:ekub_app/common/constant/constant.dart';
import 'package:ekub_app/common/widgets/button/dialog_button.dart';
import 'package:ekub_app/common/widgets/text/dialog_titile.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_bloc.dart';
import 'package:ekub_app/features/deposit/provider/deposit_provider.dart';
import 'package:ekub_app/features/deposit/repository/deposit_repository.dart';
import 'package:ekub_app/features/deposit/view/deposit_table.dart';
import 'package:ekub_app/features/deposit/widget/add_deposit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  // provider
  late DepositProvider depositProvider;
  // repository
  late DepositRepository depositRepository;
  late DepositBloc depositBloc;
  @override
  void initState() {
    depositProvider = DepositProvider(client: ApiClient.getClient());
    depositRepository = DepositRepository(depositProvider: depositProvider);
    depositBloc = DepositBloc(depositRepository: depositRepository);
    super.initState();
  }

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
              "Deposit Page",
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
          title: const DialogTitileWidget(title: "Deposit now"),
          //  styling
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: ThemeData().colorScheme.surface,
          contentPadding: const EdgeInsets.all(10),
          // context
          content: const AddDepositWidget(),
        );
      },
    );
  }
}
