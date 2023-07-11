
enum Rate {
  bad,
  soso,
  good,
}

class FeedBack {
  late String commenter;
  String? comment;
  late Rate rate;
  late String date;

  FeedBack({
    required this.commenter,
    required this.date,
    required this.rate,
    this.comment,
  });

}