import 'package:fluent_ui/fluent_ui.dart';

class CollectionNotifier extends ChangeNotifier {
  String _sortValue = 'Name';

  String get sortValue => _sortValue;

  set sortValue(String value) {
    _sortValue = value;
    notifyListeners();
  }

  String _sortDirection = 'Ascending';

  String get sortDirection => _sortDirection;

  set sortDirection(String value) {
    _sortDirection = value;
    notifyListeners();
  }

  bool _reversed = false;

  bool get reversed => _reversed;

  set reversed(bool value) {
    _reversed = value;
    notifyListeners();
  }
}
