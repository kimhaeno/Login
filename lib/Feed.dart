import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/FeedProvider.dart';

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
                          child: Image.network(
                            value.items[index],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width - 60,
                            height: MediaQuery.of(context).size.width - 60,
                          ),
                        ),
                      ),
                      if (value.isMore && value.currentIndex == index + 1) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: CircularProgressIndicator(
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ],
                  );
                }),
          ),
        );
      }),
    );
  }


}