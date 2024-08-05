import 'package:ekub_app/features/deposit/bloc/deposit_bloc.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_event.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_state.dart';
import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:ekub_app/utils/time_formate.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DepositDataSource extends DataGridSource {
  final List<DepositModel> deposits;
  final DepositBloc depositBloc;
  late List<DataGridRow> _dataGridRows = [];

  DepositDataSource({required this.deposits, required this.depositBloc}) {
    _dataGridRows = deposits
        .map(
          (i) => DataGridRow(
            cells: [
              DataGridCell(
                columnName: 'id',
                value: i.id,
              ),
              DataGridCell(
                columnName: 'amount',
                value: i.amount,
              ),
              DataGridCell(
                columnName: 'commission',
                value: i.commission,
              ),
              DataGridCell(
                columnName: 'createdAt',
                value: TimeFormate.formatTimePassedOne(i.createdAt),
              ),
              DataGridCell(
                columnName: 'lotId',
                value: i.id,
              ),
              DataGridCell(
                columnName: 'count',
                value: i.amount,
              ),
              DataGridCell(
                columnName: 'remainingAmountPerDeposit',
                value: i.commission,
              ),
              DataGridCell(
                columnName: 'remainingCommissionPerDeposit',
                value: TimeFormate.formatTimePassedOne(i.createdAt),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[0].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[1].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[2].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[3].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[4].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[5].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[6].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            row.getCells()[7].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await Future.delayed(const Duration(seconds: 2));
    _loadMoreRows(deposits.length);
    notifyListeners();
  }

  // load more rows logic
  _loadMoreRows(int skip) {
    if (depositBloc.state is DepositEndOfPageState ||
        depositBloc.state is LoadingMoreDepositState ||
        depositBloc.state is LoadingDepositState) {
      return;
    } else if (depositBloc.state is LoadedDepositState) {
      //now logic of loading more rows
      depositBloc.add(
        LoadMoreDepositEvent(skip: skip, currentDeposits: deposits),
      );
    } else if (depositBloc.state is ErrorDepositState) {
      depositBloc.add(LoadDepositEvent());
    }
  }
}
