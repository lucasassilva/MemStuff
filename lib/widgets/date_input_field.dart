import 'package:flutter/material.dart';
import 'package:memstuff/helpers/date_helper.dart';
import 'package:memstuff/helpers/validator_date_helper.dart';

class DateInputField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String) onSaved;

  const DateInputField({
    Key key,
    this.label,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  TextEditingController _controller;
  DateTime _selectedDate;

  @override
  void initState() {
    if (widget.initialValue == null || widget.initialValue.isEmpty) {
      _selectedDate = DateTime.now();
    } else {
      _selectedDate = DateHelper.toDate(widget.initialValue);
    }

    _controller = TextEditingController(text: DateHelper.parse(_selectedDate));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      validator: ValidatorDate.isNotEmptyValue,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(Icons.date_range),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap: () => _onSelectDate(context),
    );
  }

  _onSelectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      errorFormatText: 'Insira uma data válida',
      errorInvalidText: 'Insira a data em um intervalo válido',
    );

    if (date != null && date != _selectedDate) {
      setState(() {
        _selectedDate = date;
      });
      _controller.text = DateHelper.parse(_selectedDate);
    }
  }
}
