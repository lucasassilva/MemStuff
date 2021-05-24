import 'package:flutter/material.dart';
import 'package:memstuff/helpers/validator_name_helper.dart';

class NameInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onSaved;
  final IconData icon;

  const NameInputField({
    Key key,
    this.label,
    this.initialValue,
    this.onSaved,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: ValidatorName.isNotEmptyValue,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
