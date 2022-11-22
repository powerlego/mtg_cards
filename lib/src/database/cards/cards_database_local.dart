import 'package:mongo_dart/mongo_dart.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/keys.dart';

/// A database for storing the collection of Magic: The Gathering cards
class CardDatabaseImpl extends Database {
  final String _connectionString = localConnectionString;
  final String _databaseName = 'cards';
  final String _collectionName = 'cards';

  late Db _db;
  late DbCollection _collection;

  CardDatabaseImpl();

  /// Connects to the database
  ///
  /// Throws an exception if the connection fails
  @override
  Future<void> connect() async {
    _db = await Db.create(_connectionString + _databaseName);
    await _db.open();
    _collection = _db.collection(_collectionName);
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection() async {
    try {
      final entries = await _collection.find().toList();
      return entries;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> insert(dynamic document) async {
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CardEntry entry = document as CardEntry;
    await _collection.insertAll([entry.toJson()]);
  }

  @override
  Future<void> insertAll(List<dynamic> documents) async {
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    List<Map<String, dynamic>> entries = [];
    for (var document in documents) {
      CardEntry entry = document as CardEntry;
      entries.add(entry.toJson());
    }
    await _collection.insertAll(entries);
  }

  @override
  Future<void> update(Map<String, dynamic> filter, dynamic update) async {
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CardEntry entry = update as CardEntry;
    await _collection.update(filter, entry.toJson());
  }

  @override
  Future<void> delete(dynamic document) async {
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    CardEntry entry = document as CardEntry;
    await _collection.remove({'_id': entry.id});
  }

  @override
  Future<void> disconnect() async {
    await _db.close();
  }

  Future<int> totalCardCount() async {
    final pipeline =
        AggregationPipelineBuilder().addStage(Group(fields: {'total': Sum('\$quantity')}, id: BsonNull())).build();
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await _collection.modernAggregate(pipeline).toList();
    return (result.isEmpty) ? 0 : result[0]['total'] ?? 0;
  }

  Future<bool> checkDuplicate(CardEntry card) async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(
          Match(
            where
                .eq('card.set', card.card.set)
                .and(where.eq('card.collectorNumber', card.card.collectorNumber))
                .map['\$query'],
          ),
        )
        .build();
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await _collection.modernAggregate(pipeline).toList();
    return result.isNotEmpty;
  }

  /// Gets the most expensive card in the database
  Future<CardEntry> getMostExpensiveCard() async {
    final pipeline = AggregationPipelineBuilder().addStage(Sort({'price': -1})).build();
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await _collection.modernAggregate(pipeline).toList();
    return (result.isEmpty) ? CardEntry.empty() : CardEntry.fromJson(result[0]);
  }

  Future<String> getTotalCollectionPrice() async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(
          Project({
            '_id': 1,
            'name': '\$card.name',
            'finish': 1,
            'currency': 1,
            'total_price': Multiply([ToDecimal('\$price'), '\$quantity']),
          }),
        )
        .addStage(
          Group(id: '\$currency', fields: {'total': Sum('\$total_price')}),
        )
        .build();
    if (!_db.isConnected) {
      await _db.open();
    }

    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await _collection.modernAggregate(pipeline).toList();

    return result[0]['total'].toString();
  }

  Future<Map<String, int>> getColorCount() async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(
          Group(
            id: BsonNull(),
            fields: {
              'white': Sum(Cond(ifExpr: In('W', '\$card.colorIdentity'), thenExpr: 1, elseExpr: 0)),
              'blue': Sum(Cond(ifExpr: In('U', '\$card.colorIdentity'), thenExpr: 1, elseExpr: 0)),
              'black': Sum(Cond(ifExpr: In('B', '\$card.colorIdentity'), thenExpr: 1, elseExpr: 0)),
              'red': Sum(Cond(ifExpr: In('R', '\$card.colorIdentity'), thenExpr: 1, elseExpr: 0)),
              'green': Sum(Cond(ifExpr: In('G', '\$card.colorIdentity'), thenExpr: 1, elseExpr: 0)),
              'colorless': Sum(Cond(ifExpr: Eq(Size('\$card.colorIdentity'), 0), thenExpr: 1, elseExpr: 0)),
            },
          ),
        )
        .addStage(Project({'_id': 0, 'white': 1, 'blue': 1, 'black': 1, 'red': 1, 'green': 1, 'colorless': 1}))
        .build();
    if (!_db.isConnected) {
      await _db.open();
    }
    if (_db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final result = await _collection.modernAggregate(pipeline).toList();
    return (result.isEmpty) ? {} : Map<String, int>.from(result[0]);
  }
}
