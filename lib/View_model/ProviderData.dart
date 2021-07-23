import 'package:flutter/cupertino.dart';

class Data extends ChangeNotifier {
  int currentIndex = 0;
  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
