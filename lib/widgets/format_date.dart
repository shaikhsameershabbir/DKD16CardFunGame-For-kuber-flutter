import 'package:intl/intl.dart';

class FormatDate {
  static String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat("yyyy-mm-dd").format(dateTime);
  }
}
