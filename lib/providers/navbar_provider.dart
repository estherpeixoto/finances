import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  bool extended = true;
  VoidCallback? addFunction;

  void switchNavbar() {
    extended = !extended;
    notifyListeners();
  }
}