import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddDepositWidget extends StatefulWidget {
  const AddDepositWidget({super.key});

  @override
  State<AddDepositWidget> createState() => _AddDepositWidgetState();
}

class _AddDepositWidgetState extends State<AddDepositWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commitionController = TextEditingController();

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
              controller: _commitionController,
              label: "Commission",
              hint: "5%",
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
