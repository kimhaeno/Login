import 'package:intl/intl.dart';

String dateManager (DateTime date){
  final diff = DateTime.now().difference(date);

  if(diff < Duration(days: 1)){
    int hours = diff.inHours;
    if (hours < 1) {
      int minutes = diff.inMinutes;
      return "$minutes분 전";
    } else {
      return "$hours시간 전";
    }
  } else {
    return DateFormat('yyyy년 MM월 dd일').format(date);
  }
}