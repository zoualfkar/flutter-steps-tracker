import 'package:intl/intl.dart';

String formatDate(DateTime? expiration) {
  var formatter = DateFormat('DD-Mon-YYYY', 'en');
  return formatter.format(expiration ?? DateTime.now());
}

String formatDate1(DateTime dateTime) {
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime );
}


formatStringDate(String dateTime){
  var date = DateTime.parse(dateTime);
  final DateFormat format =  DateFormat("MMMM dd,yyyy");
  return format.format(date);
}

formatStringDate1(String dateTime){
  var date = DateTime.parse(dateTime);
  final DateFormat format =  DateFormat("EEEE");
  return format.format(date);
}