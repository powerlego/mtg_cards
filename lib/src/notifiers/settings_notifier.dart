import 'package:mtg_cards/src/notifiers/settings/settings_stub.dart'
    if (dart.library.io) 'package:mtg_cards/src/notifiers/settings/settings_local.dart'
    if (dart.library.html) 'package:mtg_cards/src/notifiers/settings/settings_web.dart';
import 'package:flutter/foundation.dart';

/// This class is used to notify the ui of changes to the settings
class SettingsNotifier extends ChangeNotifier {
  /// The currency used for prices
  String _currency = settings.currency;

  /// The theme of the app

  /// The currency used for prices
  String get currency => _currency;

  /// Sets the currency used for prices
  set currency(String value) {
    _currency = value;
    settings.currency = value;
    notifyListeners();
  }
}

abstract class BaseSettings {
  Future<void> saveSettings(Map<String, dynamic> settings);
  Future<Map<String, dynamic>> loadSettings();
}

/// A class that contains the settings of the app and handles saving and loading the settings from the file system and converting them to json and back. The settings are saved in a json file in the app's data directory and are loaded when the app starts and saved when the app is closed.
///
/// This class is a singleton and can be accessed using the [settings] variable
class Settings {
  Settings({
    required this.currency,
  });

  final SettingsImpl _settings = SettingsImpl();

  String currency;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
      };

  Future<void> loadSettings() async {
    final json = await _settings.loadSettings();
    currency = json["currency"] ?? "usd";
    return;
  }

  Future<void> saveSettings() async {
    await _settings.saveSettings(toJson());
    return;
  }
}

final settings = Settings(currency: 'usd');
