import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/models.dart';

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

  bool _filteringRarity = false;

  bool get filteringRarity => _filteringRarity;

  set filteringRarity(bool value) {
    _filteringRarity = value;
    notifyListeners();
  }

  Map<MTGRarity, bool> _rarityFilter = {
    MTGRarity.common: false,
    MTGRarity.uncommon: false,
    MTGRarity.rare: false,
    MTGRarity.mythic: false,
  };

  Map<MTGRarity, bool> get rarityFilter => _rarityFilter;

  void setRarityFilterFromDisplay(String key, bool value) {
    _rarityFilter[MTGRarity.fromDisplay(key)] = value;
    for (var i in _rarityFilter.values) {
      if (i) {
        _filteringRarity = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  void setRarityFilterFromName(String key, bool value) {
    _rarityFilter[MTGRarity.fromName(key)] = value;
    for (var i in _rarityFilter.values) {
      if (i) {
        _filteringRarity = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  void setRarityFilter(MTGRarity key, bool value) {
    _rarityFilter[key] = value;
    for (var i in _rarityFilter.values) {
      if (i) {
        _filteringRarity = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  set rarityFilter(Map<MTGRarity, bool> value) {
    _rarityFilter = value;
    if (value.values.contains(true)) {
      _filteringRarity = true;
    } else {
      _filteringRarity = false;
    }
    notifyListeners();
  }

  Map<MTGColor, bool> _colorFilter = {
    MTGColor.white: false,
    MTGColor.blue: false,
    MTGColor.black: false,
    MTGColor.red: false,
    MTGColor.green: false,
    MTGColor.colorless: false,
  };

  bool _filteringColor = false;

  bool get filteringColor => _filteringColor;

  set filteringColor(bool value) {
    _filteringColor = value;
    notifyListeners();
  }

  void setColorFilterFromDisplay(String key, bool value) {
    _colorFilter[MTGColor.fromDisplay(key)] = value;
    for (var i in _colorFilter.values) {
      if (i) {
        _filteringColor = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  void setColorFilterFromName(String key, bool value) {
    _colorFilter[MTGColor.fromName(key)] = value;
    for (var i in _colorFilter.values) {
      if (i) {
        _filteringColor = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  void setColorFilter(MTGColor key, bool value) {
    _colorFilter[key] = value;
    for (var i in _colorFilter.values) {
      if (i) {
        _filteringColor = true;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

  Map<MTGColor, bool> get colorFilter => _colorFilter;

  set colorFilter(Map<MTGColor, bool> value) {
    _colorFilter = value;
    if (_colorFilter.values.contains(true)) {
      _filteringColor = true;
    } else {
      _filteringColor = false;
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> _filters = [];

  List<Map<String, dynamic>> get filters => _filters;

  set filters(List<Map<String, dynamic>> value) {
    _filters = value;
    notifyListeners();
  }
}
