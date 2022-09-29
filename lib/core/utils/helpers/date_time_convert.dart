import 'package:intl/intl.dart';

String ampmTo24(String time) {
  DateTime date= DateFormat.jm().parse(time);//input example "6:45 PM"
  return DateFormat("HH:mm").format(date);// out put "18:45"
}

String time24ToAmPm(String time) {
  DateTime date= DateFormat.Hms().parse(time);//input example "18:45"
  return DateFormat("hh:mm a").format(date);// out put "6:45 PM"
}


DateTime toLocalDate(String date){
 return DateTime.parse(date).toLocal();
}

DateTime toDateTime(String date){
  return DateTime.parse(date);
}


