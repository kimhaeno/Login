import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/Feed.dart';
import 'package:login/Profile.dart';
import 'package:login/AddPost.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  int tabIndex = 0;
  List<Widget> tabList = [Feed(), Profile()];

  @override
  Widget build (BuildContext context) {
    return WillPopScope(
      onWillPop: ()  {
        return Future(() => false); //뒤로가기 막음
      },
      child: Scaffold(
          body: tabList[tabIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
            ],
            onTap: (value) {
              setState((){
                tabIndex = value;
              });
            },
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.grey,
          ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {/*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPost()),
            );*/
          },
          backgroundColor: const Color(0xffffffff),
          foregroundColor: Colors.greenAccent,

          child: Icon(Icons.add_a_photo),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}