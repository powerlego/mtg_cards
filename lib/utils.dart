import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/src/models/mtg_card.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Future<void> updateCards() async {
    final List<CardEntry> cards = (await cardDatabase.getCollection()).map((e) => CardEntry.fromJson(e)).toList();
    for (CardEntry card in cards) {
      final newCard = await refreshCard(card.card);
      await cardDatabase.update(card.copyWith(card: newCard, price: card.card.getPrice('usd', card.finish)));
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  static Future<MTGCardOld> refreshCard(MTGCardOld card) async {
    final response = await http.get(card.cardUrl);
    if (response.statusCode == 200) {
      return MTGCardOld.fromJson(jsonDecode(response.body)).copyWith(isFoil: card.isFoil);
    } else {
      throw Exception('Failed to load card');
    }
  }

  static String formatCurrency(String currency, Decimal price) {
    switch (currency.toLowerCase()) {
      case 'aed':
        return 'د.إ ${price.toStringAsFixed(2)}';
      case 'afn':
        return '؋ ${price.toStringAsFixed(2)}';
      case 'all':
        return 'L ${price.toStringAsFixed(2)}';
      case 'amd':
        return '֏ ${price.toStringAsFixed(2)}';
      case 'ang':
        return 'ƒ ${price.toStringAsFixed(2)}';
      case 'aoa':
        return 'Kz ${price.toStringAsFixed(2)}';
      case 'ars':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'aud':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'awg':
        return 'ƒ ${price.toStringAsFixed(2)}';
      case 'azn':
        return '₼ ${price.toStringAsFixed(2)}';
      case 'bam':
        return 'KM ${price.toStringAsFixed(2)}';
      case 'bbd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'bdt':
        return '৳ ${price.toStringAsFixed(2)}';
      case 'bgn':
        return 'лв ${price.toStringAsFixed(2)}';
      case 'bhd':
        return '.د.ب ${price.toStringAsFixed(2)}';
      case 'bif':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'bmd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'bnd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'bob':
        return '\$b ${price.toStringAsFixed(2)}';
      case 'brl':
        return 'R\$ ${price.toStringAsFixed(2)}';
      case 'bsd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'btc':
        return '₿ ${price.toStringAsFixed(6)}';
      case 'btn':
        return 'Nu. ${price.toStringAsFixed(2)}';
      case 'bwp':
        return 'P ${price.toStringAsFixed(2)}';
      case 'byn':
        return 'Br ${price.toStringAsFixed(2)}';
      case 'bzd':
        return 'BZ\$ ${price.toStringAsFixed(2)}';
      case 'cad':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'cdf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'chf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'clf':
        return 'UF ${price.toStringAsFixed(2)}';
      case 'clp':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'cny':
        return '¥ ${price.toStringAsFixed(2)}';
      case 'cop':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'crc':
        return '₡ ${price.toStringAsFixed(2)}';
      case 'cuc':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'cup':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'cve':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'czk':
        return 'Kč ${price.toStringAsFixed(2)}';
      case 'djf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'dkk':
        return 'kr ${price.toStringAsFixed(2)}';
      case 'dop':
        return 'RD\$ ${price.toStringAsFixed(2)}';
      case 'dzd':
        return 'د.ج ${price.toStringAsFixed(2)}';
      case 'egp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'ern':
        return 'Nfk ${price.toStringAsFixed(2)}';
      case 'etb':
        return 'Br ${price.toStringAsFixed(2)}';
      case 'eur':
        return '€ ${price.toStringAsFixed(2)}';
      case 'fjd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'fkp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'gbp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'gel':
        return '₾ ${price.toStringAsFixed(2)}';
      case 'ggp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'ghs':
        return '₵ ${price.toStringAsFixed(2)}';
      case 'gip':
        return '£ ${price.toStringAsFixed(2)}';
      case 'gmd':
        return 'D ${price.toStringAsFixed(2)}';
      case 'gnf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'gtq':
        return 'Q ${price.toStringAsFixed(2)}';
      case 'gyd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'hkd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'hnl':
        return 'L ${price.toStringAsFixed(2)}';
      case 'hrk':
        return 'kn ${price.toStringAsFixed(2)}';
      case 'htg':
        return 'G ${price.toStringAsFixed(2)}';
      case 'huf':
        return 'Ft ${price.toStringAsFixed(2)}';
      case 'idr':
        return 'Rp ${price.toStringAsFixed(2)}';
      case 'ils':
        return '₪ ${price.toStringAsFixed(2)}';
      case 'imp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'inr':
        return '₹ ${price.toStringAsFixed(2)}';
      case 'iqd':
        return 'ع.د ${price.toStringAsFixed(2)}';
      case 'irr':
        return '﷼ ${price.toStringAsFixed(2)}';
      case 'isk':
        return 'kr ${price.toStringAsFixed(2)}';
      case 'jep':
        return '£ ${price.toStringAsFixed(2)}';
      case 'jmd':
        return 'J\$ ${price.toStringAsFixed(2)}';
      case 'jod':
        return 'د.ا ${price.toStringAsFixed(2)}';
      case 'jpy':
        return '¥ ${price.toStringAsFixed(2)}';
      case 'kes':
        return 'Sh ${price.toStringAsFixed(2)}';
      case 'kgs':
        return 'лв ${price.toStringAsFixed(2)}';
      case 'khr':
        return '៛ ${price.toStringAsFixed(2)}';
      case 'kmf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'kpw':
        return '₩ ${price.toStringAsFixed(2)}';
      case 'krw':
        return '₩ ${price.toStringAsFixed(2)}';
      case 'kwd':
        return 'د.ك ${price.toStringAsFixed(2)}';
      case 'kyd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'kzt':
        return 'лв ${price.toStringAsFixed(2)}';
      case 'lak':
        return '₭ ${price.toStringAsFixed(2)}';
      case 'lbp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'lkr':
        return '₨ ${price.toStringAsFixed(2)}';
      case 'lrd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'lsl':
        return 'L ${price.toStringAsFixed(2)}';
      case 'lyd':
        return 'ل.د ${price.toStringAsFixed(2)}';
      case 'mad':
        return 'د.م. ${price.toStringAsFixed(2)}';
      case 'mdl':
        return 'L ${price.toStringAsFixed(2)}';
      case 'mga':
        return 'Ar ${price.toStringAsFixed(2)}';
      case 'mkd':
        return 'ден ${price.toStringAsFixed(2)}';
      case 'mmk':
        return 'Ks ${price.toStringAsFixed(2)}';
      case 'mnt':
        return '₮ ${price.toStringAsFixed(2)}';
      case 'mop':
        return 'P ${price.toStringAsFixed(2)}';
      case 'mro':
        return 'UM ${price.toStringAsFixed(2)}';
      case 'mur':
        return '₨ ${price.toStringAsFixed(2)}';
      case 'mvr':
        return 'Rf ${price.toStringAsFixed(2)}';
      case 'mwk':
        return 'MK ${price.toStringAsFixed(2)}';
      case 'mxn':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'myr':
        return 'RM ${price.toStringAsFixed(2)}';
      case 'mzn':
        return 'MT ${price.toStringAsFixed(2)}';
      case 'nad':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'ngn':
        return '₦ ${price.toStringAsFixed(2)}';
      case 'nio':
        return 'C\$ ${price.toStringAsFixed(2)}';
      case 'nok':
        return 'kr ${price.toStringAsFixed(2)}';
      case 'npr':
        return '₨ ${price.toStringAsFixed(2)}';
      case 'nzd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'omr':
        return 'ر.ع. ${price.toStringAsFixed(2)}';
      case 'pab':
        return 'B/. ${price.toStringAsFixed(2)}';
      case 'pen':
        return 'S/. ${price.toStringAsFixed(2)}';
      case 'pgk':
        return 'K ${price.toStringAsFixed(2)}';
      case 'php':
        return '₱ ${price.toStringAsFixed(2)}';
      case 'pkr':
        return '₨ ${price.toStringAsFixed(2)}';
      case 'pln':
        return 'zł ${price.toStringAsFixed(2)}';
      case 'pyg':
        return 'Gs ${price.toStringAsFixed(2)}';
      case 'qar':
        return 'ر.ق ${price.toStringAsFixed(2)}';
      case 'ron':
        return 'lei ${price.toStringAsFixed(2)}';
      case 'rsd':
        return 'Дин. ${price.toStringAsFixed(2)}';
      case 'rub':
        return '₽ ${price.toStringAsFixed(2)}';
      case 'rwf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'sar':
        return 'ر.س ${price.toStringAsFixed(2)}';
      case 'sbd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'scr':
        return '₨ ${price.toStringAsFixed(2)}';
      case 'sdg':
        return 'ج.س ${price.toStringAsFixed(2)}';
      case 'sek':
        return 'kr ${price.toStringAsFixed(2)}';
      case 'sgd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'shp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'sll':
        return 'Le ${price.toStringAsFixed(2)}';
      case 'sos':
        return 'S ${price.toStringAsFixed(2)}';
      case 'srd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'std':
        return 'Db ${price.toStringAsFixed(2)}';
      case 'svc':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'syp':
        return '£ ${price.toStringAsFixed(2)}';
      case 'szl':
        return 'L ${price.toStringAsFixed(2)}';
      case 'thb':
        return '฿ ${price.toStringAsFixed(2)}';
      case 'tjs':
        return 'SM ${price.toStringAsFixed(2)}';
      case 'tmt':
        return 'm ${price.toStringAsFixed(2)}';
      case 'tnd':
        return 'د.ت ${price.toStringAsFixed(2)}';
      case 'top':
        return 'T\$ ${price.toStringAsFixed(2)}';
      case 'try':
        return '₺ ${price.toStringAsFixed(2)}';
      case 'ttd':
        return 'TT\$ ${price.toStringAsFixed(2)}';
      case 'twd':
        return 'NT\$ ${price.toStringAsFixed(2)}';
      case 'tzs':
        return 'TSh ${price.toStringAsFixed(2)}';
      case 'uah':
        return '₴ ${price.toStringAsFixed(2)}';
      case 'ugx':
        return 'USh ${price.toStringAsFixed(2)}';
      case 'usd':
        return '\$ ${price.toStringAsFixed(2)}';
      case 'uyu':
        return '\$U ${price.toStringAsFixed(2)}';
      case 'uzs':
        return 'so\'m ${price.toStringAsFixed(2)}';
      case 'vef':
        return 'Bs ${price.toStringAsFixed(2)}';
      case 'vnd':
        return '₫ ${price.toStringAsFixed(2)}';
      case 'vuv':
        return 'VT ${price.toStringAsFixed(2)}';
      case 'wst':
        return 'WS\$ ${price.toStringAsFixed(2)}';
      case 'xaf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'xcd':
        return 'EC\$ ${price.toStringAsFixed(2)}';
      case 'xof':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'xpf':
        return 'Fr ${price.toStringAsFixed(2)}';
      case 'xpt':
        return 'XPT ${price.toStringAsFixed(2)}';
      case 'yer':
        return '﷼ ${price.toStringAsFixed(2)}';
      case 'zar':
        return 'R ${price.toStringAsFixed(2)}';
      case 'zmw':
        return 'ZK ${price.toStringAsFixed(2)}';
      case 'zwl':
        return 'Z\$ ${price.toStringAsFixed(2)}';
      default:
        return '${price.toStringAsFixed(2)} $currency';
    }
  }

  static String formatPrice(String currency, Decimal price) {
    switch (currency.toLowerCase()) {
      case 'usd':
        return '\$${price.toStringAsFixed(2)}';
      case 'eur':
        return '€${price.toStringAsFixed(2)}';
      case 'tix':
        return '${price.toStringAsFixed(2)} TIX';
      default:
        return '${price.toStringAsFixed(2)} $currency';
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

  static Decimal convertCurrency(String to, Decimal amount, double rate) {
    if (to == 'usd') {
      return amount;
    } else {
      if (rate > 1) {
        return Decimal.parse((amount.toDouble() / rate).toString());
      } else {
        return amount * Decimal.parse(rate.toString());
      }
    }
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
