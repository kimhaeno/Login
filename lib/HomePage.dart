import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/Feed.dart';
import 'package:login/Profile.dart';
import 'package:login/AddPost.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);



  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  int tabIndex = 0;
  List<Widget> tabList = [Feed(), Profile()];

  DateTime? _currentBackPressTime;

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('뒤로가기 버튼을 한 번 더 누르면 종료됩니다.')),
      );
      return false;
    }
    SystemNavigator.pop();
    return true;
  }

  @override
  Widget build (BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadPhotoScreen()),
            );
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