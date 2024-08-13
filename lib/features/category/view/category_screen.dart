import 'package:ekub_app/common/messager/scaffold_messager.dart';
import 'package:ekub_app/common/widgets/button/dialog_button.dart';
import 'package:ekub_app/common/widgets/text/dialog_titile.dart';
import 'package:ekub_app/features/category/bloc/index.dart';
import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:ekub_app/features/category/widget/add_cateory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// ignore: unnecessary_import
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  String cycle = "Daily";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commitionController = TextEditingController();
  final TextEditingController _totalCountController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
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
    context.read<CategoryBloc>().add(FetchCategoryEvent(take: 10, skip: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, currentState) {
        if (currentState is SucessCategoryState) {
          _nameController.text = "";
          _amountController.text = "";
          _commitionController.text = "";
          _totalCountController.text = "";
          _durationController.text = "";
          showMessage(currentState.message, context, MESSAGE_TYPE.SUCCESS);
          context.pop();
        } else if (currentState is ErrorCategoryState) {
          showMessage(currentState.errorMessage, context, MESSAGE_TYPE.FAILURE);
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, currentState) {
                return const Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("OOOOOO Category tableOOOOOOO"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
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
              onTap: () {
                final CategoryModel newCategory = CategoryModel(
                  id: 0,
                  name: _nameController.text,
                  amount: int.parse(_amountController.text),
                  commition: double.parse(_commitionController.text),
                  createdAt: DateTime.now(),
                  totalCount: int.parse(_totalCountController.text),
                  totalAmount: 0,
                  totalCommition: 0,
                  collectionCycle: cycle,
                  duration: _durationController.text,
                );
                _handleSubmit(newCategory);
              },
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
          title: const DialogTitileWidget(title: "Add new Ekub"),
          //  styling
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: ThemeData().colorScheme.surface,
          contentPadding: const EdgeInsets.all(10),
          // content
          content: AddCateoryWidget(
            key: UniqueKey(),
            amountController: _amountController,
            commitionController: _commitionController,
            durationController: _durationController,
            formKey: _formKey,
            nameController: _nameController,
            totalCountController: _totalCountController,
            onChangedcollectionCycle: (val) {
              setState(() {
                cycle = val;
              });
            },
          ),
        );
      },
    );
  }

  _handleSubmit(newCategory) {
    context.read<CategoryBloc>().add(AddCategoryEvent(category: newCategory));
  }
}

// body: BlocBuilder<CategoryBloc, CategoryState>(
//   builder: (cnx, currentState) {
//     if (currentState is UnCategoryState) {
//       return const Center(
//         child: CircularProgressIndicator(color: Colors.amberAccent),
//       );
//     }
//     if (currentState is ErrorCategoryState) {
//       return Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(currentState.errorMessage),
//           Padding(
//             padding: const EdgeInsets.only(top: 32.0),
//             child: GestureDetector(
//               onTap: _load,
//               child: Container(
//                 color: Colors.blue,
//                 child: const Text('reload'),
//               ),
//             ),
//           ),
//         ],
//       ));
//     }
//     if (currentState is InCategoryState) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const CategoryTableWidget(),
//             Text(currentState.categorys.first.name),
//           ],
//         ),
//       );
//     }
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   },
// ),
