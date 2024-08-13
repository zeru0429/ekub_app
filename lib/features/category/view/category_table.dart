import 'package:ekub_app/features/category/bloc/index.dart';
import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:ekub_app/features/category/widget/category_data_source.dart';
import 'package:ekub_app/features/category/widget/category_table_columen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoryTableWidget extends StatefulWidget {
  const CategoryTableWidget({super.key});

  @override
  State<CategoryTableWidget> createState() => _CategoryTableWidgetState();
}

class _CategoryTableWidgetState extends State<CategoryTableWidget> {
  late List<CategoryModel> _category = [];
  late DataGridSource _categoryDataSource;
  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, currentState) {
        if (currentState is InCategoryState) {
          _setCategoryData(currentState.categorys);
        }
      },
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, currentState) {
          if (currentState is InCategoryState) {
            return const CircularProgressIndicator(
              color: Colors.amber,
            );
          } else if (currentState is ErrorCategoryState) {
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
          } else {
            return Container(
              margin: const EdgeInsets.all(10),
              child: SfDataGrid(
                columns: getCategoryTableColumn(),
                source: _categoryDataSource,
              ),
            );
          }
        },
      ),
    );
  }

  _load() {
    context.read<CategoryBloc>().add(FetchCategoryEvent(take: 10, skip: 0));
  }

  // load deposit data
  _setCategoryData(List<CategoryModel> category) {
    _category = category;
    _categoryDataSource = CategoryDataSource(
      category: _category,
      categoryBloc: BlocProvider.of<CategoryBloc>(context),
    );
  }
}
