import 'package:flutter/cupertino.dart';

class ZoomNotifier extends ChangeNotifier {
  bool _isZoom = false;
  int _currentIndex = 0;

  bool get isZoom => _isZoom;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  set isZoom(bool zoomed) {
    _isZoom = zoomed;
    notifyListeners();
  }
}
