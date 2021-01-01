import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  bool darkMode = false;
  void toggleDark() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
