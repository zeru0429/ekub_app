import 'package:ekub_app/features/category/bloc/index.dart';
import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:ekub_app/utils/time_formate.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoryDataSource extends DataGridSource {
  final List<CategoryModel> category;
  final CategoryBloc categoryBloc;
  late List<DataGridRow> _dataGridRows = [];

  CategoryDataSource({
    required this.category,
    required this.categoryBloc,
  }) {
    _dataGridRows = category
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
                value: i.commition,
              ),
              DataGridCell(
                columnName: 'collection cycle',
                value: i.collectionCycle,
              ),
              DataGridCell(
                columnName: 'duration',
                value: i.duration,
              ),
              DataGridCell(
                columnName: 'total count',
                value: i.totalCount,
              ),
              DataGridCell(
                columnName: 'createdAt',
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
      ],
    );
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await Future.delayed(const Duration(seconds: 2));
    _loadMoreRows(category.length);
    notifyListeners();
  }

  // load more rows logic
  _loadMoreRows(int skip) {
    // if (categoryBloc.state is DepositEndOfPageState
    //     // ||
    //     // categoryBloc.state is LoadingMoreCategorytate ||
    //     // categoryBloc.state is LoadingCategorytate
    //     ) {
    //   return;
    // } else if (categoryBloc.state is InCategoryState) {
    //   //now logic of loading more rows
    //   categoryBloc.add(
    //     InMoreDepositEvent(skip: skip, currentCategory: category),
    //   );
    // } else if (categoryBloc.state is ErrorCategorytate) {
    //   categoryBloc.add(LoadDepositEvent());
    // }
  }
}
