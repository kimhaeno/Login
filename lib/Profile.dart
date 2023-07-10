import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: const Text("나의 프로필"),),
      body:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.asset(
              "assets/images/profbg.jpg",
              fit: BoxFit.cover
            ),
          ),
          Positioned.fill(
            top: 200,
            child: Align(
              alignment:Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset("assets/images/profile_default.png",
                  width: 100,
                )
              ),
            ),
          )
        ],
      )
    );
  }
}