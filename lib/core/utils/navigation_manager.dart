import 'package:flutter/material.dart';

extension NavigationMethods on BuildContext {
  void pop() {
    Navigator.pop(this);
  }


  void push(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  void pushAndRemove(Widget screen) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}
