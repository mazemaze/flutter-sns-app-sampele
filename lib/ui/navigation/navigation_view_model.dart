import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationVMProvider =
    ChangeNotifierProvider((ref) => NavigationViewModel());

class NavigationViewModel with ChangeNotifier {
  int _currentIdx = 0;
  int get currentIdx => _currentIdx;

  void onTap(int index) {
    _currentIdx = index;
    notifyListeners();
  }
}
