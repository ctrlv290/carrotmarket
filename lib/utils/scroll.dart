import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//마우스 스와이프
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
