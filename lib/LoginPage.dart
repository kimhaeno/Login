import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({ Key? key }) : super(key: key);
    const LoginPage(
      {Key? key,
      required this.setLoadingState,
      required this.setAuthenticatedState,
      required this.setUnauthenticatedState})
      : super(key: key);

  final VoidCallback setLoadingState;
  final VoidCallback setAuthenticatedState;
  final VoidCallback setUnauthenticatedState;

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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/loginbg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                    children: [
                      SizedBox(height: 200,),
                      Image.asset('assets/images/lightlogo4x.png', width: 200),
                      const SizedBox(height:30),
                      const Text(
                        "대한민국 최대 패션 SNS, FAS#N",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      const SizedBox(height:30),
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
                                  labelText: '전화번호',
                                )
                            ),
                            const SizedBox(height:10),
                            TextField(
                                obscureText:true,
                                controller: pwController,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '비밀번호',
                                )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () {
                              Navigator.pushNamed(context, '/home');
                              },
                            child: const Text("로그인",
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ),
                          const SizedBox(width:10),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black87),
                            ),
                            onPressed: () {

                              Navigator.pushNamed(context, '/sign');
                            },
                            child: const Text("회원가입",
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                          onPressed: () {
                            loginAction;
                          },
                          child: Text("구글 로그인")
                      ),
                    ],
                  ),
            ),
            ]
          ),
        )
    );
  }

  Future<void> loginAction() async {
    widget.setLoadingState();
    final authSuccess = await AuthService.instance.login();
    if (authSuccess) {
      widget.setAuthenticatedState();
    } else {
      widget.setUnauthenticatedState();
    }
  }
}