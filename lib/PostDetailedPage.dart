import 'package:flutter/material.dart';
import 'package:login/PostInfo.dart';
import 'package:login/PostView.dart';
import 'package:login/FeedBack.dart';


class PostDetailedPage extends StatefulWidget {
  PostDetailedPage({super.key, required this.preinfo});

  PostPreviewInfo preinfo;

  @override
  State<PostDetailedPage> createState() => _PostDetailedPageState();
}

class _PostDetailedPageState extends State<PostDetailedPage> {
  //List<FeedBack> feedbackList = List.empty(growable: true);
  List<FeedBack> feedbackList = [
    FeedBack(commenter: "anon", date: "2023.07.10", rate: Rate.good, comment: "아주좋군"),
    FeedBack(commenter: "anon", date: "2023.07.10", rate: Rate.bad),
    FeedBack(commenter: "anon", date: "2023.07.11", rate: Rate.bad, comment: "넌 어디가서 옷 좋아한다고 하지 마라"),
    FeedBack(commenter: "anon", date: "2023.07.11", rate: Rate.good, comment: "윗댓 왤케화남? 난 좋기만하구만 ㅋㅋㅋㅋ"),
    FeedBack(commenter: "anon", date: "2023.07.12", rate: Rate.bad),
  ];
  late List<bool> isSelected;
  bool isFire = true;
  bool isIce = false;
  String comment = '';
  final commentController = TextEditingController();

  @override
  void initState(){
    isSelected = [isFire, isIce];
    super.initState();
  }

  void toggleSelect(value) {
    if (value == 0) {
      isFire = true;
      isIce = false;
    }
    else{
      isFire = false;
      isIce = true;
    }
    setState(() {
      isSelected = [isFire, isIce];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("${widget.preinfo.name}님의 게시물"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Image.asset(widget.preinfo.photo, fit:BoxFit.cover),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.preinfo.profile,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.preinfo.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                widget.preinfo.date,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        widget.preinfo.body,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width *0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  child: FittedBox(
                    fit:BoxFit.fitWidth,
                    child: ToggleButtons(

                      isSelected: isSelected,
                      onPressed: toggleSelect,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/images/fire.png',
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(width: 15,),
                              const Text(
                                "Fire!",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                )
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/images/ice.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(width: 15,),
                              Text(
                                  "Ice....",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(20),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("댓글",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        maxLength: 150,
                        keyboardType: TextInputType.multiline,
                        controller: commentController,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: '댓글을 남겨 주세요!',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if(true) {
                            //db사용해서 isSelected, commentController.text,
                            // 그리고 현재 userid를 보내면 됨
                          }
                        },
                        child: Text("평가 입력",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: feedbackList.length,
                  itemBuilder: (BuildContext context, int index){

                    if(feedbackList[index].comment == null){
                      return commentLessFeedback(
                        name: feedbackList[index].commenter,
                        date: feedbackList[index].date,
                        rate: feedbackList[index].rate,
                        profilepic: 'assets/images/profile_default.png',
                      );
                    }
                    else{
                      return commentFeedback(
                        name: feedbackList[index].commenter,
                        date: feedbackList[index].date,
                        rate: feedbackList[index].rate,
                        profilepic: 'assets/images/profile_default.png',
                        comment: feedbackList[index].comment!,
                      );
                    }


                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class commentLessFeedback extends StatelessWidget {

  commentLessFeedback({super.key,
    required this.profilepic,
    required this.name,
    required this.date,
    required this.rate,
  });

  String profilepic;
  Rate rate;
  String date;
  String name;

  @override
  Widget build(BuildContext context){

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 80,
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  profilepic,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:5),
                      Text(name),
                      SizedBox(height:10),
                      Text(date),
                    ],
                  ),
                ),
                SizedBox(width: 80,),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: rate == Rate.good ? Image.asset(
                      'assets/images/fire.png',
                      width: 50,
                      height: 50,
                    ) :Image.asset(
                      'assets/images/ice.png',
                      width: 50,
                      height: 50,
                    )
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}

class commentFeedback extends StatelessWidget {
  commentFeedback({super.key,
    required this.profilepic,
    required this.name,
    required this.date,
    required this.rate,
    required this.comment,
  });

  String profilepic;
  Rate rate;
  String date;
  String name;
  String comment;

  @override
  Widget build(BuildContext context){

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                height: 80,
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(
                      profilepic,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:5),
                          Text(name),
                          SizedBox(height:10),
                          Text(date),
                        ],
                      ),
                    ),
                    SizedBox(width: 80,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: rate == Rate.good ? Image.asset(
                          'assets/images/fire.png',
                          width: 50,
                          height: 50,
                        ) :Image.asset(
                          'assets/images/ice.png',
                          width: 50,
                          height: 50,
                        )
                      ),
                    ),
                  ],
                )
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                comment,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

