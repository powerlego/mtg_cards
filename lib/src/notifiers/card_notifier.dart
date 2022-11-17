import 'package:flutter/foundation.dart';

/// This class is used to notify the ui of a change in the card's side
class CardNotifier extends ChangeNotifier {
  bool _isFlipped = false;

  bool get isFlipped => _isFlipped;

  set isFlipped(bool value) {
    _isFlipped = value;
    notifyListeners();
  }

  void flip() {
    _isFlipped = !_isFlipped;
    notifyListeners();
  }
}
