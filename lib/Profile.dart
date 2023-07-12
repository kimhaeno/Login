import 'package:flutter/material.dart';
import 'package:login/PhotoGridView.dart';
import 'package:login/db_implement.dart';
import 'package:login/main.dart';
import 'package:provider/provider.dart';
import 'package:login/ChangeInfo.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context){
  var appState = context.watch<MyAppState>();


    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 275,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 10),
                )
              ]
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    "assets/images/profbg.jpg",
                    fit: BoxFit.cover
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.black45,
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/profile_default.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: dbGetUserNameInfo(appState.getUserId()),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
                              }

                              //error가 발생하게 될 경우 반환하게 되는 부분
                              else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Text(
                                    'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                                    style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, color: Colors.white),
                                  ),
                                );
                              }

                              // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
                              else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Text(
                                    snapshot.data.toString(), // 비동기 처리를 통해 받은 데이터를 텍스트에 뿌려줌
                                    style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, color: Colors.white),
                                  ),
                                );
                              }
                            }
                          ),
                          SizedBox(height: 20),
                          FutureBuilder(
                            future: dbGetUserExpInfo(appState.getUserId()),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              //error가 발생하게 될 경우 반환하게 되는 부분
                              if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Text(
                                    'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                                    style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, color: Colors.white),
                                  ),
                                );
                              }

                              // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
                              else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Text(
                                    snapshot.data.toString(), // 비동기 처리를 통해 받은 데이터를 텍스트에 뿌려줌
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              }
                            }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    "프로필",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    icon: Icon(Icons.create),
                    color: Colors.white,
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeInfo()));
                    },
                  )
                )
              ],
            ),
          ),
          Expanded(child: PhotoGridView(userId: "todo")),
        ],
      )
    );
  }
}