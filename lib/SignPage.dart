import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'db_implement.dart';

class SignPage extends StatelessWidget {
  SignPage({ Key? key }) : super(key: key);

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height:80),
                  const Text("새로운 패션의 물결,\n FAS#N에 오신 것을 환영합니다.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                      )
                  ),
                  const SizedBox(height:20),
                  const Text("별명"),
                  const SizedBox(height:10,),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: nicknameController,
                      maxLength: 20,

                    ),
                  ),
                  const SizedBox(height:10),
                  const Text("전화번호"),
                  const SizedBox(height:10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: phoneController,
                      maxLength: 11,
                    ),
                  ),
                  const SizedBox(height:10),
                  const Text("비밀번호"),
                  const SizedBox(height:10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: pwController,
                    ),
                  ),
                  const SizedBox(height:60),
                  TextButton(
                    onPressed: () async {
                      await dbCreateAccount(nicknameController.text, phoneController.text, pwController.text);
                      // TODO: => 다음에 UserProfile 대신에 메인 페이지를 입력하면 된다.
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute( // 페이지 전부 없애고 메인 페이지로 이동
                        builder: (BuildContext context) => HomePage()), (route) => false);
                    },
                    child: const Text(
                      "가입",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  )
                ]
            ),
              ),

            ]
          )
        ]
      )
    );
  }
}