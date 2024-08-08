import 'package:ekub_app/common/widgets/drop_down/dialog_drop_down.dart';
import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddLotteryWidget extends StatefulWidget {
  const AddLotteryWidget({super.key});

  @override
  State<AddLotteryWidget> createState() => _AddLotteryWidgetState();
}

class _AddLotteryWidgetState extends State<AddLotteryWidget> {
  final _formKey = GlobalKey<FormState>();
  String gender = "MALE"; // Ensure this matches one of the initial values
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // First Name
            TextInputFieldWidget(
              controller: _firstNameController,
              label: "First Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            // Middle Name
            TextInputFieldWidget(
              controller: _middleNameController,
              label: "Middle Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            // Last Name
            TextInputFieldWidget(
              controller: _lastNameController,
              label: "Last Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            //Gender
            DialogDropDownWidget(
              items: const ["MALE", "FEMALE"],
              hint: "Select Gender",
              label: "Gender",
              initialValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val ?? "MALE";
                });
              },
            ),
            // City
            TextInputFieldWidget(
              controller: _cityController,
              label: "City",
              hint: "Addis Ababa",
              textInputType: TextInputType.name,
            ),
            // Street
            TextInputFieldWidget(
              controller: _streetController,
              label: "Street",
              hint: "bole bras",
              textInputType: TextInputType.name,
            ),
          ],
        ),
      ),
    );
  }
}
