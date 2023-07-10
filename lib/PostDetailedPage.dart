import 'package:flutter/material.dart';
import 'package:login/PostView.dart';


class PostDetailedPage extends StatefulWidget {
  const PostDetailedPage({super.key});

  @override
  State<PostDetailedPage> createState() => _PostDetailedPageState();
}

class _PostDetailedPageState extends State<PostDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("??님의 게시물"),
      ),
      body: Column(

      )
    );
  }
}
