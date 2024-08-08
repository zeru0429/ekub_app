import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddWinnerWidget extends StatefulWidget {
  const AddWinnerWidget({super.key});

  @override
  State<AddWinnerWidget> createState() => _AddWinnerWidgetState();
}

class _AddWinnerWidgetState extends State<AddWinnerWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextInputFieldWidget(
              controller: _countController,
              label: "count",
              hint: "5%",
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
