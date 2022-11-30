import 'package:mtg_cards/src/database/cards/cards_database_stub.dart'
    if (dart.library.io) 'package:mtg_cards/src/database/cards/cards_database_local.dart'
    if (dart.library.html) 'package:mtg_cards/src/database/cards/cards_database_web.dart';

import 'package:mtg_cards/src/database/currency/currency_database_stub.dart'
    if (dart.library.io) 'package:mtg_cards/src/database/currency/currency_database_local.dart'
    if (dart.library.html) 'package:mtg_cards/src/database/currency/currency_database_web.dart';
import 'package:mtg_cards/src/database/entries.dart';

final cardDatabase = CardDatabase();
final currencyDatabase = CurrencyDatabase();

abstract class Database {
  /// Connects to the database
  Future<void> connect();

  /// Returns a list of all documents in the collection
  Future<List<Map<String, dynamic>>> getCollection();

  /// Inserts a single document into the collection
  /// * [document] the document to insert
  Future<void> insert(dynamic document);

  /// Inserts multiple documents into the collection
  /// * [documents] The documents to insert
  Future<void> insertAll(List<dynamic> documents);

  /// Updates a single document in the collection
  /// * [filter] is the document to update
  /// * [update] is the document to replace the old document with
  Future<void> update(Map<String, dynamic> filter, dynamic update);

  /// Deletes a single document in the collection
  /// * [document] is the document to delete
  Future<void> delete(dynamic document);

  /// Deletes multiple documents in the collection
  /// * [documents] is the list of documents to delete
  Future<void> deleteAll(List<dynamic> documents);

  /// Disconnects from the database
  Future<void> disconnect();
}

/// A database for storing the collection of Magic: The Gathering cards
class CardDatabase {
  final CardDatabaseImpl _impl = CardDatabaseImpl();

  CardDatabase();

  /// Connects to the database
  Future<void> connect() async {
    _impl.connect();
  }

  /// Gets the collection of cards
  Future<List<Map<String, dynamic>>> getCollection() async {
    return _impl.getCollection();
  }

  /// Inserts a single card into the collection
  /// * [card] the card to insert
  Future<void> insert(CardEntry card) async {
    _impl.insert(card);
  }

  /// Inserts a list of cards into the collection
  /// * [cards] the cards to insert
  Future<void> insertAll(List<CardEntry> cards) async {
    _impl.insertAll(cards);
  }

  /// Updates a card in the collection
  /// * [update] the update to apply to the card
  Future<void> update(CardEntry update) async {
    _impl.update({"_id": update.id}, update);
  }

  /// Deletes a card from the collection
  /// * [card] the card to delete
  Future<void> delete(CardEntry card) async {
    _impl.delete(card);
  }

  /// Disconnects from the database
  Future<void> disconnect() async {
    _impl.disconnect();
  }

  Future<int> totalCardCount() async {
    return _impl.totalCardCount();
  }

  Future<bool> checkDuplicate(CardEntry card) async {
    return _impl.checkDuplicate(card);
  }

  /// Gets the most expensive card in the database
  Future<CardEntry> getMostExpensiveCard() async {
    return _impl.getMostExpensiveCard();
  }

  Future<String> getTotalCollectionPrice() async {
    return _impl.getTotalCollectionPrice();
  }

  Future<Map<String, int>> getColorCount() async {
    return _impl.getColorCount();
  }
}

class CurrencyDatabase {
  final CurrencyDatabaseImpl _impl = CurrencyDatabaseImpl();

  CurrencyDatabase();

  /// Connects to the database
  Future<void> connect() async {
    _impl.connect();
  }

  /// Gets the collection of currencies
  Future<List<Map<String, dynamic>>> getCollection() async {
    return _impl.getCollection();
  }

  /// Inserts a single currency into the collection
  /// * [currency] the currency to insert
  Future<void> insert(CurrencyEntry currency) async {
    _impl.insert(currency);
  }

  /// Inserts a list of currencies into the collection
  /// * [currencies] the currencies to insert
  Future<void> insertAll(List<CurrencyEntry> currencies) async {
    _impl.insertAll(currencies);
  }

  /// Updates a currency in the collection
  /// * [update] the update to apply to the card
  Future<void> update(CurrencyEntry update) async {
    _impl.update({"_id": update.id}, update);
  }

  /// Deletes a currency from the collection
  /// * [card] the card to delete
  Future<void> delete(CurrencyEntry currency) async {
    _impl.delete(currency);
  }

  /// Disconnects from the database
  Future<void> disconnect() async {
    _impl.disconnect();
  }

  Future<CurrencyEntry> getCurrency(String currency) async {
    return _impl.getCurrency(currency);
  }
}
