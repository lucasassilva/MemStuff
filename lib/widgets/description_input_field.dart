import 'package:flutter/material.dart';
import 'package:memstuff/helpers/validator_description_helper.dart';

class DescriptionInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onSaved;
  final IconData icon;

  const DescriptionInputField({
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
      validator: ValidatorDescription.isNotEmptyValue,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
