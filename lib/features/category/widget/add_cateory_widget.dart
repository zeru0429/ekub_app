import 'package:ekub_app/common/widgets/drop_down/dialog_drop_down.dart';
import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddCateoryWidget extends StatefulWidget {
  const AddCateoryWidget({
    super.key,
    required this.nameController,
    required this.amountController,
    required this.commitionController,
    required this.totalCountController,
    required this.durationController,
    required this.formKey,
    this.onChangedcollectionCycle,
  });

  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController commitionController;
  final TextEditingController totalCountController;
  final TextEditingController durationController;
  final GlobalKey formKey;
  final Function(String)? onChangedcollectionCycle;
  @override
  State<AddCateoryWidget> createState() => _AddCateoryWidgetState();
}

class _AddCateoryWidgetState extends State<AddCateoryWidget> {
  final _formKey = GlobalKey<FormState>();
  String cycle = "Daily";

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
              controller: widget.nameController,
              label: "Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            // Amount
            TextInputFieldWidget(
              controller: widget.amountController,
              label: "Amount",
              hint: "100",
              textInputType: TextInputType.number,
            ),
            // Commission
            TextInputFieldWidget(
              controller: widget.commitionController,
              label: "Commission",
              hint: "5%",
              textInputType: TextInputType.number,
            ),
            // Total Count
            TextInputFieldWidget(
              controller: widget.totalCountController,
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
                widget.onChangedcollectionCycle!(cycle);
              },
            ),
            // Duration
            TextInputFieldWidget(
              controller: widget.durationController,
              label: "Duration",
              hint: "1 year",
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
