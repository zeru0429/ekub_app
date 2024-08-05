import 'package:ekub_app/common/constant/constant.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_bloc.dart';
import 'package:ekub_app/features/deposit/provider/deposit_provider.dart';
import 'package:ekub_app/features/deposit/repository/deposit_repository.dart';
import 'package:ekub_app/features/deposit/view/deposit_table.dart';
import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Text(
              "Deposit Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(
            child: DepositTable(
              depositBloc: depositBloc,
            ),
          ),
        ],
      ),
    );
  }
}
