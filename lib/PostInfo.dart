import 'package:login/WearInfo.dart';
import 'package:login/FeedBack.dart';

class PostPreviewInfo {
  late String photo;
  late String profile;
  late String name;
  late String date;
  late String body;
  late String postId;


  PostPreviewInfo ({required this.photo,
    required this.profile,
    required this.name,
    required this.date,
    required this.body,
    this.postId = "any",
  });

}

class PostInfo {
  late String photo;
  late String uploader;
  late String date;
  late String body;
  late String postId;
  late List<WearInfo> wearList;
  List<FeedBack> feedBackList = List.empty(growable: true);


  PostInfo ({required this.photo,
    required this.uploader,
    required this.date,
    required this.body,
    required this.wearList,
    this.postId = "any",
  });

}