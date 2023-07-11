import 'package:flutter/material.dart';
import 'package:login/PhotoGridView.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context){

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
                          Text(
                            "김현호",
                            style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "락시크, R&B, 운동 좋아합니다",
                            style: TextStyle(fontSize: 15),
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
                    "누군가의 프로필",
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
                    onPressed: (){
                      //(context) => ChangeInfo();
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