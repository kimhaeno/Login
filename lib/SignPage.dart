import 'package:flutter/material.dart';


class SignPage extends StatelessWidget {
  SignPage({ Key? key }) : super(key: key);

  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height:60),
                const Text("새로운 패션의 물결,\n FaSNS에 오신 것을 환영합니다.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue
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
                const Text("이메일"),
                const SizedBox(height:10),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: mailController,
                  ),
                ),
                const SizedBox(height:60),
                TextButton(

                  onPressed: (){

                  },
                  child: const Text(
                    "가입",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                )
              ]
            ),
          )
        ]
      )
    );
  }
}