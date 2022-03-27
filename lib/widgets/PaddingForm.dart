import 'package:flutter/material.dart';

class PaddingForm extends StatelessWidget {
  const PaddingForm({
    Key? key,
    required this.hintText,
    required this.newHabitFormMap,
    required this.valueField,
    required this.allowEmptyField
  }) : super(key: key);

  final String hintText;
  final Map<String, String> newHabitFormMap;
  final String valueField;
  final bool allowEmptyField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: this.hintText,
        ),
        validator: (String? value) {
          if (!allowEmptyField && (value == null || value.isEmpty)) {
            return 'Please enter some text';
          }
          this.newHabitFormMap.putIfAbsent(this.valueField, () => value!);
          return null;
        },
      ),
    );
  }
}