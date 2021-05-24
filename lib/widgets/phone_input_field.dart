import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memstuff/helpers/validator_phone_helper.dart';

class PhoneInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onSaved;
  final IconData icon;

  const PhoneInputField({
    Key key,
    this.label,
    this.initialValue,
    this.onSaved,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      initialValue: initialValue,
      onSaved: onSaved,
      validator: ValidatorPhone.isNotEmptyValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
