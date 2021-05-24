import 'package:intl/intl.dart';

class DateHelper {

  static DateFormat _format = DateFormat('dd/MM/yyyy');

  static DateTime toDate(String date) {
    if (date == null) return null;
    if (date.isEmpty) return null;
    return _format.parse(date);
  }

  static String parse(DateTime date) {
    if (date == null) return '';
    return _format.format(date);
  }

  static String toRelativeDate(String date) {
    final duoDate = toDate(date);
    final now = DateTime.now();
    final diff = now.difference(duoDate);

    if (diff.inDays < 1) return 'hoje';
    if (diff.inDays < 30) return '${diff.inDays}d';

    return parse(duoDate);
  }
}
