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
            height: 285,
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
                Positioned(
                  top: 150,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "assets/images/profile_default.png",
                          height: 100,
                          width: 100,
                        )
                      ),
                      SizedBox(height: 10),
                      Text("김현호"),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
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
              ],
            ),
          ),
          Expanded(child: PhotoGridView()),
        ],
      )
    );
  }
}