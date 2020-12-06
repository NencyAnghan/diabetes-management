import 'package:diabetes_management/constants/strings.dart';

class DateTimeUtils {
  static String getPaddedDateMonthYearRep(DateTime dateTime) {
    String day = dateTime.day < 10 ? "0${dateTime.day}" : "${dateTime.day}";
    String month = Strings.monthsShort[dateTime.month];
    String year = "${dateTime.year}";
    return day + "-" + month + "-" + year;
  }

  static DateTime dateTimeFrom2D3M4Y(String dateTimeRep) {
    List<String> components = dateTimeRep.split("-");
    return DateTime(int.parse(components[2]),
        Strings.monthsShort.indexOf(components[1]), int.parse(components[0]));
  }
}
