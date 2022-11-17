// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'package:mtg_cards/databases.dart';
import 'dart:html';
import 'package:mtg_cards/keys.dart';

/// A database for storing the collection of Magic: The Gathering cards
class CardDatabaseImpl extends Database {
  final String connectionString = '$webConnectionString/cards';

  CardDatabaseImpl();

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
    final response = await HttpRequest.request("$connectionString/collection/", method: 'GET').then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw Exception('Failed to get collection. Status: ${response.status}. Error: ${response.statusText}');
        }
      },
    ).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isNotEmpty) {
      List<dynamic> json = jsonDecode(jsonDecode(response));
      List<Map<String, dynamic>> entries = json.map((e) => CardEntry.fromJson(e).toJson()).toList();
      return entries;
    } else {
      return [];
    }
  }

  @override
  Future<void> insert(dynamic document) async {
    Console console = window.console;
    CardEntry entry = document as CardEntry;
    await HttpRequest.request(
      "$connectionString/insert/",
      method: "POST",
      sendData: jsonEncode(entry.toJson()),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw Exception('Failed to insert card. Status: ${response.status}. Error: ${response.statusText}');
      }
    }).catchError((error) {
      console.error(error);
      return;
    });
    return;
  }

  @override
  Future<void> insertAll(List<dynamic> documents) async {
    Console console = window.console;
    List<Map<String, dynamic>> entries = [];
    for (var document in documents) {
      CardEntry entry = document as CardEntry;
      entries.add(entry.toJson());
    }
    await HttpRequest.request(
      "$connectionString/insert_all/",
      method: "POST",
      sendData: jsonEncode(entries),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw Exception('Failed to insert cards. Status: ${response.status}. Error: ${response.statusText}');
      }
    }).catchError((error) {
      console.error(error);
      return;
    });
    return;
  }

  @override
  Future<void> update(Map<String, dynamic> filter, dynamic update) async {
    Console console = window.console;
    CardEntry entry = update as CardEntry;
    final payload = {
      "filter": filter,
      "update": entry.toJson(),
    };
    await HttpRequest.request(
      "$connectionString/update/",
      method: "POST",
      sendData: jsonEncode(payload),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw Exception('Failed to update card. Status: ${response.status}. Error: ${response.statusText}');
      }
    }).catchError((error) {
      console.error(error);
      return;
    });
    return;
  }

  @override
  Future<void> delete(dynamic document) async {
    Console console = window.console;
    CardEntry entry = document as CardEntry;
    await HttpRequest.request(
      "$connectionString/delete/",
      method: "POST",
      sendData: jsonEncode(entry.toJson()),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        return;
      } else {
        throw Exception('Failed to delete card. Status: ${response.status}. Error: ${response.statusText}');
      }
    }).catchError((error) {
      console.error(error);
      return;
    });
    return;
  }

  @override
  Future<void> disconnect() async {
    return;
  }

  Future<int> totalCardCount() async {
    Console console = window.console;
    final response = await HttpRequest.request("$connectionString/get_total_card_count/", method: "GET").then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw Exception('Failed to get total card count. Status: ${response.status}. Error: ${response.statusText}');
        }
      },
    ).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isNotEmpty) {
      return jsonDecode(jsonDecode(response))['result'];
    } else {
      return 0;
    }
  }

  Future<bool> checkDuplicate(CardEntry card) async {
    Console console = window.console;
    final result = await HttpRequest.request(
      "$connectionString/check_duplicates/",
      method: "POST",
      sendData: jsonEncode(card.toJson()),
      requestHeaders: {"Content-Type": "application/json"},
    ).then((HttpRequest response) {
      if (response.status == HttpStatus.ok) {
        final json = jsonDecode(jsonDecode(response.response));
        return json['result'];
      } else {
        throw Exception('Failed to check duplicates. Status: ${response.status}. Error: ${response.statusText}');
      }
    }).catchError((error) {
      console.error(error);
      return true;
    });
    return result;
  }

  /// Gets the most expensive card in the database
  Future<CardEntry> getMostExpensiveCard() async {
    Console console = window.console;
    String response = await HttpRequest.request("$connectionString/get_most_expensive_card/", method: "GET").then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw Exception(
              'Failed to get most expensive card. Status: ${response.status}. Error: ${response.statusText}');
        }
      },
    ).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isNotEmpty) {
      return CardEntry.fromJson(jsonDecode(jsonDecode(response))[0]);
    } else {
      return CardEntry.empty();
    }
  }

  Future<String> getTotalCollectionPrice() async {
    Console console = window.console;
    String response = await HttpRequest.request("$connectionString/get_total_collection_price/", method: "GET").then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw Exception(
              'Failed to get total collection price. Status: ${response.status}. Error: ${response.statusText}');
        }
      },
    ).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isNotEmpty) {
      return jsonDecode(jsonDecode(response))[0]['total']['\$numberDecimal'];
    } else {
      return "";
    }
  }

  Future<Map<String, int>> getColorCount() async {
    Console console = window.console;
    String response = await HttpRequest.request("$connectionString/get_color_count/", method: "GET").then(
      (HttpRequest response) {
        if (response.status == HttpStatus.ok) {
          return response.response as String;
        } else {
          throw Exception('Failed to get color count. Status: ${response.status}. Error: ${response.statusText}');
        }
      },
    ).catchError((error) {
      console.error(error);
      return "";
    });
    if (response.isNotEmpty) {
      return Map<String, int>.from(jsonDecode(jsonDecode(response)));
    } else {
      return {};
    }
  }
}
