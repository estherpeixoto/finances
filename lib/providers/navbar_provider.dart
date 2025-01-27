import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  bool extended = true;

  void switchNavbar() {
    extended = !extended;
    notifyListeners();
  }
}