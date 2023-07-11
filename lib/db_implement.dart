import 'package:dio/dio.dart';

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

// 처음 회원가입하는 사용자의 입력 정보를 db에 저장
Future<dynamic> dbGetUserNameInfo() async {
  Dio dio = Dio();
  int userPhone = 1; //await kakaoGetUserInfo();
  if (userPhone != 0) {
    try {
      var response = await dio.post(
          "$serverAddress/dbGetUserNameInfo", data: {'userPhone': userPhone});
      if (response.statusCode == 200) {
        return response.data[0]['name'];
      }
    } catch (e) {
      print(e);
    }
  }
  return false;
}