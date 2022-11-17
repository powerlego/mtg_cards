import 'package:flutter/foundation.dart';

/// This class is used to notify the ui to refresh all of the cards' data
class UpdateNotifier extends ChangeNotifier {
  bool _update = false;
  bool get update => _update;
  set update(bool value) {
    _update = value;
    notifyListeners();
  }
}
