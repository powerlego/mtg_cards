import 'dart:convert';
import 'dart:io';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/src/constants.dart';

import 'dart:developer' as developer;

class SettingsImpl extends BaseSettings {
  SettingsImpl();

  @override
  Future<Map<String, dynamic>> loadSettings() async {
    try {
      final file = File(Constants.settingsPath);
      final contents = await file.readAsString();
      final json = jsonDecode(contents);
      return json;
    } catch (e) {
      developer.log('Error loading settings: $e');
      return {};
    }
  }

  @override
  Future<void> saveSettings(Map<String, dynamic> settings) async {
    if (Directory(Constants.appDataPath).existsSync() == false) {
      Directory(Constants.appDataPath).createSync();
    }
    try {
      final file = File(Constants.settingsPath);
      final contents = jsonEncode(settings);
      await file.writeAsString(contents);
      return;
    } catch (e) {
      developer.log('Error saving settings: $e');
      return;
    }
  }
}
