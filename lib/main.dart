import 'package:flutter/material.dart';
import  'package:login/AddPost.dart';
import 'package:login/HomePage.dart';
import 'package:login/SignPage.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';

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
  var userId = "id5";

  void setUserId(String id){
    userId = id;
    notifyListeners();
  }

  String getUserId(){
    return userId;
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
          '/': (context) => LoginPage(setAuthenticatedState: () { Null; }, setLoadingState: () { Null; }, setUnauthenticatedState: () { Null; },),
          '/sign': (context) => SignPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}