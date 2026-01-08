import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 색상을 관리하는 뷰모델
class ColorState {
  Color color;
  ColorState(this.color);
}

class ColorViewModel extends Notifier<ColorState> {
  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

// Notifier는 똑같음
final colorViewModel = NotifierProvider<ColorViewModel, ColorState>(() {
  return ColorViewModel();
});

// AutoDisposeNotifier
final colorViewModel2 = NotifierProvider<ColorViewModel, ColorState>(() {
  return ColorViewModel();
}, isAutoDispose: true);

//FamilyNotifier
class ColorViewModel2 extends Notifier<ColorState> {
  final String pageName;
  ColorViewModel2(this.pageName);

  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

final colorViewModel3 =
    NotifierProvider.family<ColorViewModel2, ColorState, String>((String arg) {
      return ColorViewModel2(arg);
    }, isAutoDispose: true);
    // true 하면 AutoDisposeFamilyNotifier
    // false 하면 FamilyNotifier
