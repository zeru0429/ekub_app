import 'package:ekub_app/features/deposit/bloc/deposit_bloc.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_event.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_state.dart';
import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:ekub_app/features/deposit/widget/deposit_table_column.dart';
import 'package:ekub_app/features/deposit/widget/deposit_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DepositTable extends StatefulWidget {
  const DepositTable({super.key, required this.depositBloc});
  final DepositBloc depositBloc;

  @override
  State<DepositTable> createState() => _DepositTableState();
}

class _DepositTableState extends State<DepositTable> {
  late List<DepositModel> _deposits = [];
  late DataGridSource _depositDataSource;

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocListener<DepositBloc, DepositState>(
        bloc: widget.depositBloc,
        // listener logic
        listener: (cnx, currentState) {
          print(currentState.runtimeType);
          if (currentState is LoadedDepositState) {
            _setDepositData(currentState.deposits);
          }
        },
        child: BlocBuilder<DepositBloc, DepositState>(
          bloc: widget.depositBloc,
          //builder logic
          builder: (
            BuildContext cnx,
            DepositState currentState,
          ) {
            if (currentState is InitialDepositState) {
              return const CircularProgressIndicator(
                color: Colors.amber,
              );
            } else if (currentState is ErrorDepositState) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      currentState.toString(),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _load();
                      },
                      child: FittedBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              currentState.runtimeType.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (currentState is LoadedDepositState ||
                currentState is LoadingMoreDepositState ||
                currentState is DepositEndOfPageState) {
              return SfDataGrid(
                source: _depositDataSource,
                columns: getDepositTableColumn(),
                allowSorting: true,
                rowHeight: 40,
                loadMoreViewBuilder: (cnx, loadMoreRows) {
                  // method to call LoadMoreRows Found in DataGride source
                  Future<String> loadRows() async {
                    await loadMoreRows();
                    return Future<String>.value('Completed');
                  }

                  // builder method
                  return FutureBuilder<String>(
                    initialData: 'loading',
                    future: loadRows(),
                    builder: (context, snapshot) {
                      if (snapshot.data == 'loading') {
                        return (currentState is DepositEndOfPageState)
                            ? Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "End of the List",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: ThemeData().colorScheme.error,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 60.0,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              );
                        ;
                      } else {
                        return SizedBox.fromSize(size: Size.zero);
                      }
                    },
                  );
                },
              );
            }
            return Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  currentState.runtimeType.toString(),
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // load deposit for the first time
  _load() {
    widget.depositBloc.add(LoadDepositEvent());
  }

  // load deposit data
  _setDepositData(List<DepositModel> deposits) {
    _deposits = deposits;
    _depositDataSource =
        DepositDataSource(deposits: _deposits, depositBloc: widget.depositBloc);
  }
}
