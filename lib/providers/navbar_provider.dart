import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  bool extended = false;

  void switchNavbar() {
    extended = !extended;
    notifyListeners();
  }
}