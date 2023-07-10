import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/FeedProvider.dart';
import 'package:login/PostView.dart';

class Feed extends StatefulWidget {
  Feed({ Key? key }) : super(key: key);

  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedProvider>(
      create: (_) => FeedProvider()..started(),
      child: Consumer<FeedProvider>(builder: (context, value, child) {
        return Scaffold(
          body: NotificationListener<ScrollUpdateNotification>(
            onNotification: (ScrollUpdateNotification notification) {
              value.listner(notification);
              return false;
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.1 + 20,
                    width: MediaQuery.of(context).size.width*0.8 + 20,
                    color: Colors.greenAccent,
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7 - 10,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              color: Colors.black,
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(

                      itemCount: value.items.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: PostView(),
                              ),
                            ),
                            if (value.isMore && value.currentIndex == index + 1) ...[
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 40),
                                child: CircularProgressIndicator(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ],
                        );
                      }


                      ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


}