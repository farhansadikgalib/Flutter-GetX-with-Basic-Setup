
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  String getCurrentDate(
      {isWeekDayNameOnly = false,
      dateTime,
      isDateOnly = true,
      isPrevDate = false,
      isNextDate = false}) {
    if (isWeekDayNameOnly) {
      return DateFormat('EEEE').format(DateTime.now());
    } else if (isDateOnly) {
      var dateTime = isPrevDate
          ? DateTime.now().subtract(const Duration(days: 1))
          : isNextDate
              ? DateTime.now().add(const Duration(days: 1))
              : DateTime.now();
      return DateFormat('dd MMM, yyyy').format(dateTime);
    }
    return DateFormat('EE, dd MMM, yyyy').format(DateTime.now());
  }

  String getFormattedDate(dateTime) {
    return DateFormat('dd MMM, yyyy').format(dateTime);
  }

  String getFullFormattedDate(dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String calculateTimeDuration(String startTime, String endTime) {
    List<String> startParts = startTime.split(':');
    List<String> endParts = endTime.split(':');

    int startHour = int.parse(startParts[0]);
    int startMinute = int.parse(startParts[1]);

    int endHour = int.parse(endParts[0]);
    int endMinute = int.parse(endParts[1]);

    int durationHour;
    int durationMinute;

    if (endMinute >= startMinute) {
      durationHour = endHour - startHour;
      durationMinute = endMinute - startMinute;
    } else {
      durationHour = endHour - startHour - 1;
      durationMinute = 60 - startMinute + endMinute;
    }

    // printLog('Duration: $durationHour hour(s) $durationMinute minute(s)');

    String totalTime = "";

    if (durationHour == 0) {
      totalTime = '$durationMinute min';
    } else if (durationMinute == 0) {
      totalTime = '$durationHour hr';
    } else {
      totalTime = '$durationHour hr $durationMinute min';
    }
    return totalTime;
  }
}
