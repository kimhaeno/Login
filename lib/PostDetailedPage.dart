import 'package:flutter/material.dart';
import 'package:login/PostInfo.dart';
import 'package:login/PostView.dart';


class PostDetailedPage extends StatelessWidget {
  PostDetailedPage({super.key, required this.preinfo});

  PostPreviewInfo preinfo;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("??님의 게시물"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Image.asset(preinfo.photo, fit:BoxFit.cover),
                ),
              ),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  height: 120,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            preinfo.profile,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                preinfo.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                preinfo.date,
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
                        preinfo.body,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*ListView.builder(

              )*/
            ],
          ),
        ),
      )
    );
  }
}
