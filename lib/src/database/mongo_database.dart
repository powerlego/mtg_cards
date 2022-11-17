import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer' as developer;

class MongoDatabase {
  final String connectionString = 'mongodb://nc-desktop.student.rit.edu:24012/';
  final String databaseName;
  final String collectionName;

  late Db db;
  late DbCollection collection;

  MongoDatabase({required this.databaseName, required this.collectionName});

  Future<void> connect() async {
    // var res = await http.get(url);
    // if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
    // print(res.body);
    db = await Db.create(connectionString + databaseName);
    await db.open();
    developer.log('Connected to database');
    collection = db.collection(collectionName);
  }

  /// Returns a list of all documents in the collection
  Future<List<Map<String, dynamic>>> getCollection() async {
    try {
      final entries = await collection.find().toList();
      return entries;
    } catch (e) {
      developer.log("Error: ", error: e);
      return [];
    }
  }

  /// Inserts a single document into the collection
  /// * [document] the document to insert
  Future<void> insert(Map<String, dynamic> document) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    await collection.insertAll([document]);
  }

  /// Inserts multiple documents into the collection
  /// * [documents] The documents to insert
  Future<void> insertAll(List<Map<String, dynamic>> documents) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    await collection.insertAll(documents);
  }

  /// Updates a single document in the collection
  /// * [filter] is the document to update
  /// * [update] is the document to replace the old document with
  Future<void> update(Map<String, dynamic> filter, Map<String, dynamic> update) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    await collection.update(filter, update);
  }

  /// Deletes a single document in the collection
  /// * [filter] is the document to delete
  Future<void> delete(Map<String, dynamic> filter) async {
    if (!db.isConnected) {
      await db.open();
    }
    if (db.state != State.open) {
      await Future.delayed(const Duration(seconds: 1));
    }
    await collection.remove(filter);
  }

  /// Disconnects from the database
  Future<void> disconnect() async {
    await db.close();
    developer.log('Disconnected from database');
  }
}
