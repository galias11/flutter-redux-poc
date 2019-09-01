// @Vendors
import 'package:intl/intl.dart';

// @Constants
import 'package:workshop_twitter/constants/constants.dart';

String getTimeEllapsedText(DateTime creationTime) {
  final DateTime currentTime = new DateTime.now();
  final Duration timeDiff = currentTime.difference(creationTime);
  if(timeDiff.inSeconds < 60) {
    return '1$ELLAPSED_TIME_MIN';
  }
  if(timeDiff.inMinutes < 60) {
    final int minutesEllapsed = timeDiff.inMinutes;
    return '$minutesEllapsed$ELLAPSED_TIME_MIN';
  }
  if(timeDiff.inHours < 24) {
    final int hoursEllapsed = timeDiff.inHours;
    return '$hoursEllapsed$ELLAPSED_TIME_HOUR';
  }
  final int daysEllapsed = timeDiff.inDays;
  return '$daysEllapsed$ELLAPSED_TIME_DAY';
}

String formatDate(DateTime date) {
  DateFormat formatter = new DateFormat('h:mm a dd MMM. yy');
  return formatter.format(date);
}