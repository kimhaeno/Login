import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:login/SignPage.dart';
import 'package:login/HomePage.dart';
import 'package:login/LoginPage.dart';
import  'package:login/AddPost.dart';

import 'dart:io';

void main() {
  //이거 수상함
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
        providers: [
          Provider(
            //맞는지 모르겠음
            create: (context) => AddPostState(),
          )
        ],
        child: MyApp()
    )
  );
}

class MyAppState extends ChangeNotifier {
  var id = "";

  void getId(){
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'MadCamp',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/sign': (context) => SignPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}









