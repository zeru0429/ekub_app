import 'package:intl/intl.dart';

class TimeFormate {
  static String formatDateTimeOne(DateTime dateTime) {
    final formatter = DateFormat('hh:mm a EEE, MMM d yyyy');
    return formatter.format(dateTime);
  }

  static String formatTimePassedOne(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d yyyy').format(dateTime);
    }
  }
}
