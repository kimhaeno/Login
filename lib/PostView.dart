import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/PostDetailedPage.dart';
import 'package:login/PostPreviewInfo.dart';

import 'db_implement.dart';

void uploadImage(File imageFile) async {
  try {
    String url = 'http://172.10.5.170/upload'; // 실제 서버 주소로 변경

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path),
    });

    Dio dio = Dio();
    Response response = await dio.post(url, data: formData);

    if (response.statusCode == 200) {
      // 파일 저장 경로와 파일명을 서버로부터 받아옴
      final filename = response.data['filename'];
      final path = response.data['path'];
    } else {
      print('Image upload failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Image upload error: $e');
  }
}


class PostView extends StatelessWidget {
  PostView({
    Key? key,
    required this.idx
  }) : super(key: key);

  late int idx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailedPage()),
        );
      },
      child: FutureBuilder(

        future: dbGetPreviewPostInfo(idx),
        builder: (context, snapshot) {
          
          PostPreviewInfo info;
          if (snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          

          if(snapshot.hasData)
            info = snapshot.data!;
          else
            info = PostPreviewInfo(
              name: "",
              date: "",
              body: "",
              photo: 'assets/images/sample1.jpg',
              profile: 'assets/images/profile_default.png',
              succeed: false,
            );
          


          return Container(
          //alignment: Alignment.center,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height *0.85,
                  child: Image.asset(info.photo, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: MediaQuery.of(context).size.height *0.15,
                    width: MediaQuery.of(context).size.width *0.8,
                    color: const Color(0xc0ffffff),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              info.profile,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  info.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  info.date,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          info.body,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );},
      ),
    );
  }
}