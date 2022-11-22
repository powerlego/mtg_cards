// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'package:mtg_cards/databases.dart';
import 'dart:html';

import 'package:mtg_cards/keys.dart';

class CurrencyDatabaseImpl extends Database {
  final String _connectionString = '$webConnectionString/currency';

  CurrencyDatabaseImpl();

  /// Connects to the database
  ///
  /// Throws an exception if the connection fails
  @override
  Future<void> connect() async {
    return;
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection() async {
    Console console = window.console;

    final response = await HttpRequest.request("$_connectionString/collection/", method: 'GET').then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw 'Failed to get collection. Status: ${response.status}. Error: ${response.statusText}';
        }
      },
    ).catchError((error) {
      console.log(error);
      return "";
    });
    if (response.isNotEmpty) {
      List<dynamic> json = jsonDecode(jsonDecode(response));
      List<Map<String, dynamic>> entries = json.map((e) => CurrencyEntry.fromJson(e).toJson()).toList();
      return entries;
    } else {
      return [];
    }
  }

  @override
  Future<void> insert(dynamic document) async {
    Console console = window.console;
    CurrencyEntry entry = document as CurrencyEntry;
    await HttpRequest.request(
      "$_connectionString/insert/",
      method: "POST",
      sendData: jsonEncode(entry.toJson()),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw 'Failed to insert currency. Status: ${response.status}. Error: ${response.statusText}';
      }
    }).catchError((error) {
      console.log(error);
      return;
    });
    return;
  }

  @override
  Future<void> insertAll(List<dynamic> documents) async {
    Console console = window.console;
    List<Map<String, dynamic>> entries = [];
    for (var document in documents) {
      CurrencyEntry entry = document as CurrencyEntry;
      entries.add(entry.toJson());
    }
    await HttpRequest.request(
      "$_connectionString/insert_all/",
      method: "POST",
      sendData: jsonEncode(entries),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw 'Failed to insert currencies. Status: ${response.status}. Error: ${response.statusText}';
      }
    }).catchError((error) {
      console.log(error);
      return;
    });
    return;
  }

  @override
  Future<void> update(Map<String, dynamic> filter, dynamic update) async {
    Console console = window.console;
    CurrencyEntry entry = update as CurrencyEntry;
    final payload = {
      "filter": filter,
      "update": entry.toJson(),
    };
    await HttpRequest.request(
      "$_connectionString/update/",
      method: "POST",
      sendData: jsonEncode(payload),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw 'Failed to update currency. Status: ${response.status}. Error: ${response.statusText}';
      }
    }).catchError((error) {
      console.log(error);
      return;
    });
    return;
  }

  @override
  Future<void> delete(dynamic document) async {
    Console console = window.console;
    CurrencyEntry entry = document as CurrencyEntry;
    await HttpRequest.request(
      "$_connectionString/delete/",
      method: "POST",
      sendData: jsonEncode(entry.toJson()),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw 'Failed to delete currency. Status: ${response.status}. Error: ${response.statusText}';
      }
    }).catchError((error) {
      console.log(error);
      return;
    });
    return;
  }

  @override
  Future<void> disconnect() async {
    return;
  }

  Future<CurrencyEntry> getCurrency(String currency) async {
    Console console = window.console;
    final response =
        await HttpRequest.request("$_connectionString/get_currency/?currency=${currency.toLowerCase()}", method: "GET")
            .then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return response.response as String;
      } else {
        throw 'Failed to get currency. Status: ${response.status}. Error: ${response.statusText}';
      }
    }).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isEmpty) {
      return CurrencyEntry.empty();
    } else {
      Map<String, dynamic> json = jsonDecode(jsonDecode(response));
      CurrencyEntry entry = CurrencyEntry.fromJson(json);
      return entry;
    }
  }
}
