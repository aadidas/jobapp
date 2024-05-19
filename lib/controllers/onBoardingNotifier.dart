import 'package:flutter/cupertino.dart';

class OnBoardingNotifier extends ChangeNotifier {
  bool _isLastPage = false;

  bool get isLastPage => _isLastPage;

  set isLastPage(bool lastPage) {
    _isLastPage = lastPage;
    notifyListeners();
  }
}
