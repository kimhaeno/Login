import 'package:flutter/material.dart';


class SignPage extends StatelessWidget {
  SignPage({ Key? key }) : super(key: key);

  final String serverUrl = "";

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("회원가입"),
          const SizedBox(height:10),
          Container(
            width: 300,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("별명"),
                const SizedBox(height:10),
                TextField(
                  controller: nicknameController,
                  maxLength: 20,
                ),
                const SizedBox(height:10),
                Text("전화번호"),
                const SizedBox(height:10),
                TextField(
                  controller: phoneController,
                  maxLength: 11,
                ),
                const SizedBox(height:10),
                Text("이메일"),
                const SizedBox(height:10),
                TextField(
                  controller: mailController,
                ),
                const SizedBox(height:10),
                OutlinedButton(
                  onPressed: (){

                  },
                  child: Text("가입"),
                )
              ]
            ),
          )
        ]
      )
    );
  }
}