import 'package:intl/intl.dart';

class Util {
  static String formatDate(int epoch) {
    final date = DateTime.fromMillisecondsSinceEpoch(epoch);
    return DateFormat.yMMMEd().format(date);
  }
}
