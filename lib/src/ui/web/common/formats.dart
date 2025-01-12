import 'package:intl/intl.dart';

class Formats {
  NumberFormat priceFormat() {
    return NumberFormat('#,##0.00', 'en_US');
  }

  String formattedDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}
