import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final EdgeInsets padding;

  const PrimaryButton({
    Key key,
    this.label,
    this.onPressed,
    this.padding = const EdgeInsets.only(top: 40),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label?.toUpperCase() ?? ''),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(52),
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
