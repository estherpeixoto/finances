import 'package:flutter/material.dart';

class SidebarProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}