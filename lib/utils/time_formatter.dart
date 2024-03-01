import 'package:intl/intl.dart';

String formatTimestamp(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  return DateFormat('h:mm a').format(dateTime);
}
