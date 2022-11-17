import 'dart:io';

class Constants {
  static String appData = Platform.isWindows
      ? Platform.environment['APPDATA']!
      : Platform.isMacOS
          ? '${Platform.environment['HOME']}/Library/Application Support'
          : Platform.isLinux
              ? '${Platform.environment['HOME']}/.config'
              : '';
  static String appDataPath = '$appData/mtg_cards';
  static String settingsPath = '$appDataPath/settings.json';
  static String cachePath = '$appDataPath/cache';
}
