import 'package:intl/intl.dart';

String toDisplayDate(String? date) {
  if (date == null || date.isEmpty) return "";

  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(Duration(days: 1));

  DateTime inputDate = DateTime.parse(date);
  DateTime dateOnly = DateTime(inputDate.year, inputDate.month, inputDate.day);

  if (dateOnly == today) {
    return DateFormat('h:mm a').format(inputDate);
  } else if (dateOnly == yesterday) {
    return "Yesterday";
  } else {
    return DateFormat('dd/MM/yyyy').format(inputDate);
  }
}
