import 'package:ekub_app/common/widgets/drop_down/dialog_drop_down.dart';
import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddCateoryWidget extends StatefulWidget {
  const AddCateoryWidget({super.key});

  @override
  State<AddCateoryWidget> createState() => _AddCateoryWidgetState();
}

class _AddCateoryWidgetState extends State<AddCateoryWidget> {
  final _formKey = GlobalKey<FormState>();
  String cycle = "Daily"; // Ensure this matches one of the initial values
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commitionController = TextEditingController();
  final TextEditingController _totalCountController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Name
            TextInputFieldWidget(
              controller: _nameController,
              label: "Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
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
            // Total Count
            TextInputFieldWidget(
              controller: _totalCountController,
              label: "Total Count",
              hint: "366",
              textInputType: TextInputType.number,
            ),
            // Collection Cycle
            DialogDropDownWidget(
              items: const ["Daily", "Weekly", "Monthly", "Yearly"],
              hint: "Select cycle",
              label: "Collection Cycle",
              initialValue: cycle,
              onChanged: (val) {
                setState(() {
                  cycle = val ?? "Daily";
                });
              },
            ),
            // Duration
            TextInputFieldWidget(
              controller: _durationController,
              label: "Duration",
              hint: "1 year",
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
