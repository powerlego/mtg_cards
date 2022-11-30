import 'dart:convert';
import 'package:mtg_cards/models.dart';
import 'package:decimal/decimal.dart';
import 'package:mongo_dart/mongo_dart.dart';

class CardEntry {
  final ObjectId id;
  final MTGCard card;
  final int quantity;
  final MTGPrice price;

  const CardEntry({
    required this.id,
    required this.card,
    required this.quantity,
    required this.price,
  });

  CardEntry.empty()
      : this(
          id: ObjectId(),
          card: MTGCard.empty(),
          quantity: 0,
          price: MTGPrice.zero,
        );

  factory CardEntry.fromJson(Map<String, dynamic> json) {
    return CardEntry(
      id: (json["_id"] is ObjectId) ? json["_id"] : ObjectId.fromHexString(json["_id"]["\$oid"]),
      card: MTGCard.fromJson(json["card"]),
      quantity: json["quantity"],
      price: MTGPrice.fromJson(json["price"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id.toHexString()},
      'card': card.toJson(),
      'quantity': quantity,
      'price': price.toJson(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  CardEntry copyWith({
    ObjectId? id,
    MTGCard? card,
    int? quantity,
    MTGPrice? price,
  }) {
    return CardEntry(
      id: id ?? this.id,
      card: card ?? this.card,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}

class CurrencyEntry {
  CurrencyEntry({
    required this.id,
    required this.currency,
    required this.date,
    required this.exchangeRate,
  });

  CurrencyEntry.empty()
      : id = ObjectId(),
        currency = '',
        date = DateTime.now(),
        exchangeRate = 0;

  final ObjectId id;
  final DateTime date;
  final String currency;

  /// The exchange rate from USD to the currency
  final double exchangeRate;

  factory CurrencyEntry.fromJson(Map<String, dynamic> json) => CurrencyEntry(
        id: (json['_id'] is ObjectId) ? json['_id'] as ObjectId : ObjectId.fromHexString(json['_id']['\$oid']),
        currency: json['currency'] as String,
        date: DateTime.parse(json['date'] as String),
        exchangeRate: json['exchangeRate'] * 1.0 as double,
      );

  Map<String, dynamic> toJson() => {
        '_id': {'\$oid': id.toHexString()},
        'currency': currency.toLowerCase(),
        'date': date.toIso8601String(),
        'exchangeRate': exchangeRate,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyEntry &&
        other.id == id &&
        other.currency == currency &&
        other.date == date &&
        other.exchangeRate == exchangeRate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ currency.hashCode ^ date.hashCode ^ exchangeRate.hashCode;
  }

  CurrencyEntry copyWith({
    ObjectId? id,
    String? currency,
    DateTime? date,
    double? exchangeRate,
  }) {
    return CurrencyEntry(
      id: id ?? this.id,
      currency: currency ?? this.currency,
      date: date ?? this.date,
      exchangeRate: exchangeRate ?? this.exchangeRate,
    );
  }
}
