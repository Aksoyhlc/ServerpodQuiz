import 'package:flutter/material.dart';

extension ListExtension on List {
  List<Widget> seperatedBy(Widget value) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(this[i]);
      if (i != length - 1) {
        list.add(value);
      }
    }
    return list;
  }
}
