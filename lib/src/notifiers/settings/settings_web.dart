// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:mtg_cards/notifiers.dart';
import 'dart:html';

class SettingsImpl extends BaseSettings {
  SettingsImpl();

  @override
  Future<Map<String, dynamic>> loadSettings() async {
    Map<String, dynamic> settings = {};
    for (var key in window.localStorage.keys) {
      settings[key] = window.localStorage[key];
    }
    return settings;
  }

  @override
  Future<void> saveSettings(Map<String, dynamic> settings) async {
    for (var key in settings.keys) {
      window.localStorage[key] = settings[key];
    }
    return;
  }
}
