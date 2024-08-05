// column of the table
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getDepositTableColumn() => [
      GridColumn(
        columnName: 'id',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "ID",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'amount',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Amount",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'commission',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Commission",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'createdAt',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Created At",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'lotId',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Lot Id",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'count',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Count",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'remainingAmountPerDeposit',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Remaining Amount Per Deposit",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      GridColumn(
        columnName: 'remainingCommissionPerDeposit',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: const Text(
            "Remaining Commission Per Deposit",
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];
