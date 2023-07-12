import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login/PostInfo.dart';
import 'package:login/WearInfo.dart';

//import 'login.dart';
import 'strings.dart';

// 사용자의 계정이 db에 있는지 확인
Future<dynamic> dbCheckUserAccount() async {
  Dio dio = Dio();
  int userPhone = 1; //await kakaoGetUserInfo();
  if (userPhone != 0) {
    try {
      var response = await dio.post(
          "$serverAddress/dbCheckUserAccount", data: {'userPhone': userPhone});
      if (response.statusCode == 200) {
        return response.data[0];
      }
    } catch (e) {
      print(e);
    }
  }
  return false;
}

// 처음 회원가입하는 사용자의 입력 정보를 db에 저장
Future<dynamic> dbCreateAccount(String name, String phone, String pw) async {
  Dio dio = Dio();
  try {
    var response1 = await dio.post("$serverAddress/dbCreateAccount", data: {
      'name': name,
      'phone': phone,
      'pw': pw,});
    if (response1.statusCode == 200) {
      print("dbCreateAccount : 회원 가입 성공");
    }
  } catch (e) {
    print("[error] dbCreateAccount : $e");
  }
  return false;
}

// 사용자의 이름을 db에서 가져오기
Future<String> dbGetUserNameInfo(String id) async {
  Dio dio = Dio();
  String phone = id; //await kakaoGetUserInfo();
  if (phone != 0) {
    try {
      var response = await dio.post(
      "$serverAddress/dbGetUserNameInfo", data: {'phone': phone});
      if (response.statusCode == 200) {
        return response.data[0]['name'];
      }
    } catch (e) {
      print(e);
    }
    }
  return "";
}

// 사용자의 이름을 db에서 가져오기
Future<String> dbGetUserExpInfo(String id) async {
  Dio dio = Dio();
  String phone = id; //await kakaoGetUserInfo();
  if (phone != 0) {
    try {
      var response = await dio.post(
      "$serverAddress/dbGetUserExpInfo", data: {'phone': phone});
      if (response.statusCode == 200) {
        return response.data[0]['exp'];
      }
    } catch (e) {
      print(e);
    }
    }
  return "";
}

// 게시글 정보를 db에서 가져오기
Future<PostPreviewInfo?> dbGetPreviewPostInfo(int id) async {
  Dio dio = Dio();
  int postId = id; //await kakaoGetUserInfo();
  if (postId != 0) {
    try {
      var response = await dio.post(
      "$serverAddress/dbGetPreviewPostInfo", data: {'postId': postId});
      if (response.statusCode == 200) {
        return PostPreviewInfo(
          name: response.data[0]['phone'],
          date: DateTime.parse(response.data[0]['date']),
          body: response.data[0]['content'],
          photo: 'assets/images/sample1.jpg',
          profile: 'assets/images/profile_default.png',
          succeed: true,
        );
      }
    } catch (e) {
      print(e);
    }
  }
  return PostPreviewInfo(
    name: "err",
    date: DateTime.now(),
    body: "",
    photo: 'assets/images/sample1.jpg',
    profile: 'assets/images/profile_default.png',
    succeed: false,
  );
}

// 게시글 업로드 후 postId 반환
/*Future<int> dbUploadPost(File image, String body, int postId) async {
  Dio dio = Dio();
  try {
    var response1 = await dio.post("$serverAddress/dbUploadPost", data: {
      'image': image,
      'body': body,
      'postId': postId});
    if (response1.statusCode == 200) {
      print("dbUploadPost : postId 반환 성공");
      return postId;
    }
  } catch (e) {
    print("[error] dbUploadPost : $e");
  }
  return -1;
}*/

// 게시글 내의 의상정보를 서버에 업로드
Future<void> dbUploadWear(WearInfo info, int postId) async {
  Dio dio = Dio();
  Enum wearType = info.wearType;
  String brandName = info.brandName;
  String wearName = info.wearName;
  
  try {
    var response1 = await dio.post("$serverAddress/dbUploadWear", data: {
      'wearType': wearType,
      'brandName': brandName,
      'wearName': wearName,
      'postId': postId});
    if (response1.statusCode == 200) {
      print("dbUploadWear : 의상 정보 서버 전송 성공");
    }
  } catch (e) {
    print("[error] dbUploadWear : $e");
  }
}


// loginLogic() async {
//   final db = await database;
//   var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Usuario");
//   int id = table.last["id"];
//   for(var i=1; i<id; i++){
//     var result = await db.rawQuery('SELECT username FROM Usuario WHERE id=?', [i]);
//     String Y = result.first["username"];
//     if(Y=='Roberto'){
//       return 1;
//     }
//   }
//   return 0;
// }