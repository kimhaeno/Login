import 'package:flutter/material.dart';
import 'package:login/PostInfo.dart';

class FeedProvider extends ChangeNotifier {
  List<PostPreviewInfo> items = [];
  int currentIndex = 0;
  bool isMore = false;

  Future<void> pageViewItems({
    bool isStart = true,
  }) async {
    if (!isMore) {
      isMore = true;
      notifyListeners();
      Future.delayed(Duration(milliseconds: isStart ? 0 : 2000), () {
        for (int i = 0; i < 3; i++) {
          items.add(PostPreviewInfo(
              photo: 'assets/images/sample1.jpg',
              profile: 'assets/images/profile_default.png',
              name: '김현호',
              date: '2023.07.11',
              body: '내용을 입력'
          ));
        }
        currentIndex = currentIndex + 3;
        isMore = false;
        notifyListeners();
      });
    }
  }

  Future<void> changedPage(int index) async {
    if (index == currentIndex) {
      pageViewItems(isStart: false);
    }
  }

  Future<void> started() async {
    for (int i = 0; i < 10; i++) {
      items.add(PostPreviewInfo(
          photo: 'assets/images/sample1.jpg',
          profile: 'assets/images/profile_default.png',
          name: '김현호',
          date: '2023.07.11',
          body: '내용을 입력'
      ));
    }
    currentIndex = 10;
  }

  Future<void> _addItem() async {
    if (!isMore) {
      isMore = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 3000), () {
        for (int i = 0; i < 10; i++) {
          items.add(PostPreviewInfo(
              photo: 'assets/images/sample1.jpg',
              profile: 'assets/images/profile_default.png',
              name: '김현호',
              date: '2023.07.11',
              body: '내용을 입력'
          ));
        }
        currentIndex = currentIndex + 10;
        isMore = false;
        notifyListeners();
      });
    }
  }

  void listner(ScrollUpdateNotification notification) {
    if (notification.metrics.maxScrollExtent * 0.85 <
        notification.metrics.pixels) {
      _addItem();
    }
  }
}