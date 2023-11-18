import 'package:flutter/foundation.dart';

class ChangeCartVal with ChangeNotifier {
  int val = 1;

  int get value => val;

  void setVal(int value) {
    val = value;
    notifyListeners();
  }
}
