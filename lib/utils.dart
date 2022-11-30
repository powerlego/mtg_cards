import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/src/models/mtg_card.dart';
import 'package:http/http.dart' as http;
import 'package:mtg_cards/src/models/mtg_fields.dart';

class Utils {
  static Future<void> updateCards() async {
    final List<CardEntry> cards = (await cardDatabase.getCollection()).map((e) => CardEntry.fromJson(e)).toList();
    for (CardEntry card in cards) {
      final newCard = await refreshCard(card.card);
      MTGPrice newPrice = card.price;
      for (MTGPrice price in newCard.prices) {
        if (price.name == card.price.name) {
          newPrice = price;
          break;
        }
      }
      await cardDatabase.update(card.copyWith(card: newCard, price: newPrice));
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  static Future<MTGCard> refreshCard(MTGCard card) async {
    final response = await http.get(card.cardUrl);
    if (response.statusCode == 200) {
      return ScryfallParser.parseScryfallCardJson(jsonDecode(response.body)).copyWith(isFoil: card.isFoil);
    } else {
      throw Exception('Failed to load card');
    }
  }

  /// Checks to see if two lists are equal
  static bool listEquals(List a, List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// Checks to see if two maps are equal
  static bool mapEquals(Map a, Map b) {
    if (a.length != b.length) return false;
    for (String key in a.keys) {
      if (a[key] != b[key]) {
        return false;
      }
    }
    return true;
  }

  static Future<void> updateExhangeRates() async {
    final response = await http.get(Uri.parse('https://api.exchangerate.host/latest?base=USD'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final rates = data['rates'];
      final dateString = data['date'];
      final date = DateTime.parse(dateString);
      final currentDate = DateTime.now();
      final currentCollection = await currencyDatabase.getCollection();
      if ((date.month != currentDate.month && date.day != currentDate.day && date.year != currentDate.year) ||
          currentCollection.isEmpty) {
        for (String currency in rates.keys) {
          await currencyDatabase.insert(CurrencyEntry(
              id: ObjectId(), currency: currency.toLowerCase(), exchangeRate: 1.0 * rates[currency], date: date));
        }
      }
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}
