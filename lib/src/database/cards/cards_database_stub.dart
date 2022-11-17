import 'package:mtg_cards/src/database/database.dart';
import 'package:mtg_cards/src/database/entries.dart';

class CardDatabaseImpl extends Database {
  CardDatabaseImpl();

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

  Future<int> totalCardCount() async {
    throw Exception("Stub Implementation");
  }

  Future<bool> checkDuplicate(CardEntry card) async {
    throw Exception("Stub Implementation");
  }

  Future<CardEntry> getMostExpensiveCard() async {
    throw Exception("Stub Implementation");
  }

  Future<String> getTotalCollectionPrice() async {
    throw Exception("Stub Implementation");
  }

  Future<Map<String, int>> getColorCount() async {
    throw Exception("Stub Implementation");
  }
}
