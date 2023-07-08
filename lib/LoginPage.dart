import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:provider/provider.dart';
import 'package:login/SignPage.dart';
import 'package:login/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 200, height: 200),
              const SizedBox(height:10),
              Text("로그인"),
              const SizedBox(height:10),
              Container(
                width: 300,
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: Column(
                  children: [
                    TextField(
                        controller: idController,
                        maxLength: 20,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        )
                    ),
                    const SizedBox(height:10),
                    TextField(
                        obscureText:true,
                        controller: pwController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        )
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                  onPressed: () {
                      Navigator.pushNamed(context, '/home');
                      },
                    child: const Text("Sign in"),
                  ),
                  const SizedBox(width:10),
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.pushNamed(context, '/sign');
                    },
                    child: const Text("Sign up"),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}