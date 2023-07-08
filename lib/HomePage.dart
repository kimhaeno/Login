import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/Feed.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  int tabIndex = 0;
  List<Widget> tabList = [Feed(), Text('프로필')];

  @override
  Widget build (BuildContext context) {
    return Scaffold(
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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
    );
  }
}