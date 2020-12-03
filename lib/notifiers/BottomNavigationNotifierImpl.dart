import 'package:architecture/notifiers/BottomNavigationNotifier.dart';
import 'package:flutter/material.dart';

class BottomNavNotifierImpl extends ChangeNotifier implements BottomNavNotifier{
  int _selected = 0;

  int get selectedPage => _selected;

  final List<GlobalKey<NavigatorState>> keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void setSelectedItem(int value) {
    print(keys[_selected].currentState);
    if (_selected == value) {
      keys[_selected].currentState.popUntil((route) => route.isFirst);
    }
    _selected = value;

    notifyListeners();
  }
}