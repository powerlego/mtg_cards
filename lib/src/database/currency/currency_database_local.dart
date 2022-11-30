import 'package:mongo_dart/mongo_dart.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/keys.dart';

class CurrencyDatabaseImpl extends Database {
  final String _connectionString = localConnectionString;

  final String _databaseName = 'cards';
  final String _collectionName = 'currency';

  late Db db;
  late DbCollection collection;

  CurrencyDatabaseImpl();

  /// Connects to the database
  ///
  /// Throws an exception if the connection fails
  @override
  Future<void> connect() async {
    db = await Db.create(_connectionString + _databaseName);
    await db.open();
    collection = db.collection(_collectionName);
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection() async {
    try {
      final entries = await collection.find().toList();
      return entries;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> insert(dynamic document) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CurrencyEntry entry = document as CurrencyEntry;
    await collection.insertAll([entry.toJson()]);
  }

  @override
  Future<void> insertAll(List<dynamic> documents) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    List<Map<String, dynamic>> entries = [];
    for (var document in documents) {
      CurrencyEntry entry = document as CurrencyEntry;
      entries.add(entry.toJson());
    }
    await collection.insertAll(entries);
  }

  @override
  Future<void> update(Map<String, dynamic> filter, dynamic update) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CurrencyEntry entry = update as CurrencyEntry;
    await collection.update(filter, entry.toJson());
  }

  @override
  Future<void> delete(dynamic document) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CurrencyEntry entry = document as CurrencyEntry;
    await collection.remove({'_id': entry.id});
  }

  @override
  Future<void> deleteAll(List<dynamic> documents) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    List<Map<String, dynamic>> entries = [];
    for (var document in documents) {
      CurrencyEntry entry = document as CurrencyEntry;
      entries.add({'_id': entry.id});
    }
    await collection.remove(entries);
  }

  @override
  Future<void> disconnect() async {
    await db.close();
  }

  Future<CurrencyEntry> getCurrency(String currency) async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(Match(where.eq('currency', currency).map['\$query']))
        .addStage(Sort({'date': -1}))
        .addStage(Limit(1))
        .build();

    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await collection.modernAggregate(pipeline).toList();
    return (result.isEmpty) ? CurrencyEntry.empty() : CurrencyEntry.fromJson(result[0]);
  }
}
