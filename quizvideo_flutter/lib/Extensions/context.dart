import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future to(Widget widget) {
    return Navigator.push(this, redirect(widget));
  }

  Future toReplace(Widget widget) {
    return Navigator.pushReplacement(this, redirect(widget));
  }

  Future toRemove(Widget widget) {
    return Navigator.pushAndRemoveUntil(this, redirect(widget), (route) => false);
  }

  back() {
    return Navigator.pop(this);
  }

  MaterialPageRoute<dynamic> redirect(Widget widget) => MaterialPageRoute(builder: (context) => widget);
}
