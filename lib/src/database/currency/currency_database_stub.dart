import 'package:mtg_cards/src/database/database.dart';
import 'package:mtg_cards/src/database/entries.dart';

class CurrencyDatabaseImpl extends Database {
  CurrencyDatabaseImpl();

  @override
  Future<void> connect() {
    throw Exception("Stub Implementation");
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection() {
    throw Exception("Stub Implementation");
  }

  @override
  Future<void> insert(dynamic document) {
    throw Exception("Stub Implementation");
  }

  @override
  Future<void> insertAll(List<dynamic> documents) {
    throw Exception("Stub Implementation");
  }

  @override
  Future<void> update(Map<String, dynamic> filter, dynamic update) {
    throw Exception("Stub Implementation");
  }

  @override
  Future<void> delete(dynamic document) {
    throw Exception("Stub Implementation");
  }

  @override
  Future<void> disconnect() {
    throw Exception("Stub Implementation");
  }

  Future<CurrencyEntry> getCurrency(String currency) async {
    throw Exception("Stub Implementation");
  }
}
