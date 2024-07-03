import 'package:flutter/cupertino.dart';

extension NumExtension on num {
  Widget get w => SizedBox(width: toDouble());
  Widget get h => SizedBox(height: toDouble());
}
