import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddLoanWidget extends StatefulWidget {
  const AddLoanWidget({super.key});

  @override
  State<AddLoanWidget> createState() => _AddLoanWidgetState();
}

class _AddLoanWidgetState extends State<AddLoanWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Amount
            TextInputFieldWidget(
              controller: _amountController,
              label: "Amount",
              hint: "100",
              textInputType: TextInputType.number,
            ),
            // Commission
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
