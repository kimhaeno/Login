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
              value.listener(notification);
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.items.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: PostView(idx: value.items[index]),

                            ),
                            if (value.isMore && value.currentIndex == index + 1) ...[
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
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