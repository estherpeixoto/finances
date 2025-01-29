import 'package:flutter/material.dart';

class AccountCreate<T> extends PopupRoute<T> {
  @override
  Color? get barrierColor => Colors.black.withAlpha(90);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => 'Create account';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Center(
      child: Text('test'),
    );
  }

  @override
  Duration get transitionDuration => const Duration(microseconds: 150);
}