import 'package:intl/intl.dart';
class ValidatorDate {
  static String isNotEmptyValue(String text) {

    final now = DateTime.now();
    final date = DateFormat('dd/MM/yyyy').parse(text);

    if(date.isAfter(now)) return 'Data inválida';

    return null;
  }
}


