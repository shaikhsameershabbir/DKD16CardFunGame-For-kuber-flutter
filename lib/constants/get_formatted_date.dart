import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate).toLocal();
  return DateFormat("dd-MM-yyyy").format(dateTime);
}

String getCurrentDateTime() {
  String formattedDateTime =
      DateFormat("dd-MM-yyyy hh:mm:ss a").format(DateTime.now());

  return formattedDateTime;
}
