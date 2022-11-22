import 'package:decimal/decimal.dart';
import 'package:mtg_cards/databases.dart';

abstract class MTGField extends Comparable {
  final String name;
  final String display;
  final int sortOrder;

  MTGField(this.name, this.display, this.sortOrder);

  @override
  int compareTo(other) {
    return sortOrder.compareTo(other.sortOrder);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'display': display,
      'sortOrder': sortOrder,
    };
  }

  @override
  String toString() {
    return display;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGField && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGColor extends MTGField {
  MTGColor(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGColor.fromJson(Map<String, dynamic> json) {
    return MTGColor(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGColor white = MTGColor('W', 'White', 0);
  static MTGColor blue = MTGColor('U', 'Blue', 1);
  static MTGColor black = MTGColor('B', 'Black', 2);
  static MTGColor red = MTGColor('R', 'Red', 3);
  static MTGColor green = MTGColor('G', 'Green', 4);
  static MTGColor colorless = MTGColor('C', 'Colorless', 5);

  static MTGColor getColorFromName(String color) {
    switch (color) {
      case 'W':
        return white;
      case 'U':
        return blue;
      case 'B':
        return black;
      case 'R':
        return red;
      case 'G':
        return green;
      case 'C':
        return colorless;
      default:
        return colorless;
    }
  }

  static MTGColor getColorFromDisplay(String color) {
    switch (color) {
      case 'White':
        return white;
      case 'Blue':
        return blue;
      case 'Black':
        return black;
      case 'Red':
        return red;
      case 'Green':
        return green;
      case 'Colorless':
        return colorless;
      default:
        return colorless;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGColor && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGColor> get colors => [
        white,
        blue,
        black,
        red,
        green,
        colorless,
      ];
}

class MTGRarity extends MTGField {
  MTGRarity(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGRarity.fromJson(Map<String, dynamic> json) {
    return MTGRarity(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGRarity common = MTGRarity('common', 'Common', 0);
  static MTGRarity uncommon = MTGRarity('uncommon', 'Uncommon', 1);
  static MTGRarity rare = MTGRarity('rare', 'Rare', 2);
  static MTGRarity mythic = MTGRarity('mythic', 'Mythic Rare', 3);

  static MTGRarity getRarityFromName(String rarity) {
    switch (rarity) {
      case 'common':
        return common;
      case 'uncommon':
        return uncommon;
      case 'rare':
        return rare;
      case 'mythic':
        return mythic;
      default:
        return common;
    }
  }

  static MTGRarity getRarityFromDisplay(String rarity) {
    switch (rarity) {
      case 'Common':
        return common;
      case 'Uncommon':
        return uncommon;
      case 'Rare':
        return rare;
      case 'Mythic Rare':
        return mythic;
      default:
        return common;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGRarity && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGRarity> get rarities => [
        common,
        uncommon,
        rare,
        mythic,
      ];
}

class MTGLegality extends MTGField {
  final String legality;
  final String legalityDisplay;

  static final List<String> _formats = [
    "standard",
    "future",
    "historic",
    "gladiator",
    "pioneer",
    "modern",
    "legacy",
    "pauper",
    "vintage",
    "penny",
    "commander",
    "brawl",
    "duel",
    "historicbrawl",
    "paupercommander",
    "premodern",
    "alchemy",
    "explorer",
    "oldschool",
  ];

  static final List<String> _formatsDisplay = [
    "Standard",
    "Future",
    "Historic",
    "Gladiator",
    "Pioneer",
    "Modern",
    "Legacy",
    "Pauper",
    "Vintage",
    "Penny",
    "Commander",
    "Brawl",
    "Duel",
    "Historic Brawl",
    "Pauper Commander",
    "Premodern",
    "Alchemy",
    "Explorer",
    "Old School",
  ];

  static final List<String> _legalities = [
    "legal",
    "not_legal",
    "restricted",
    "banned",
  ];

  static final List<String> _legalityDisplay = [
    "Legal",
    "Banned",
    "Restricted",
    "Not Legal",
  ];

  MTGLegality(String name, String display, int sortOrder, this.legality, this.legalityDisplay)
      : super(name, display, sortOrder);

  factory MTGLegality.from(String format, String legality) {
    int index = _formats.indexOf(format);

    return MTGLegality(
        format, _formatsDisplay[index], index, legality, _legalityDisplay[_legalities.indexOf(legality)]);
  }

  factory MTGLegality.fromJson(Map<String, dynamic> json) {
    return MTGLegality(json['name'], json['display'], json['sortOrder'], json['legality'], json['legalityDisplay']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'display': display,
      'sortOrder': sortOrder,
      'legality': legality,
      'legalityDisplay': legalityDisplay,
    };
  }

  @override
  String toString() {
    return '$display: $legalityDisplay';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MTGLegality && name == other.name && legality == other.legality;

  @override
  int get hashCode => name.hashCode ^ legality.hashCode;
}

/// A class representing a price object in the API.
///
/// A price object contains the [price] for a card in USD in a given finish [name], but can be converted to other currencies. The [display] is the name of the finish in a human readable format. The [sortOrder] is the order in which the finishes should be displayed.
///
/// Note that the [price] is a [Decimal] and not a [String] to allow for easier manipulation of the price. If the price is not available, the [price] will be `Decimal.zero()`.  The [price] can be converted to other currencies using the [priceIn] method. The [priceIn] method will return `Decimal.zero()` if the currency is not valid.  Addtionally, the [price] can be converted to a diffent currency and format the converted price using the [formattedPriceIn] method. The [formattedPriceIn] method will return `0.00` followed by the currency code, if the currency is not valid.  The exchange rates are updated every 24 hours and are not reflected in the example below. The exchange rates are based on the [exchangerate.host](https://exchangerate.host/) API.
///
/// Additionally, the format [name] can be shown as a human readable format using the [display] property.
/// The valid finishes are:
/// - nonfoil
/// - foil
/// - etched
///
/// Example:
/// ```dart
///   final json = { "name": "nonfoil", "display": "Non-Foil", "sortOrder": 0, "price": Decimal.parse('0.01') };
///   MTGPrice price = MTGPrice.fromJson(json);
///   print(price.price); // 0.01
///   print(price.name); // 'nonfoil'
///   print(price.display); // 'Non-Foil'
///   print(price.sortOrder); // 0
///   print(price.priceIn('EUR')); // 0.01 * 0.85 = 0.0085
///   print(price.formattedPriceIn('EUR')); // '€0.0085'
/// ```
class MTGPrice extends MTGField {
  /// The price in USD.
  final Decimal price;

  static final List<String> _finishes = [
    "nonfoil",
    "foil",
    "etched",
  ];

  static final List<String> _finishesDisplay = [
    "Non-Foil",
    "Foil",
    "Etched",
  ];

  /// Creates a new [MTGPrice] object.
  /// [name] is the name of the finish for a card, [display] is the display name of the finish, [sortOrder] is the sort order of the finish, and [price] is the price of a card in USD for the given finish.
  ///
  /// Note:
  /// - [name] and [display] should be similar, but [display] is used for display purposes.
  /// - [sortOrder] is used to sort the prices in a list.
  /// - [name] should be one of the following:
  ///     - nonfoil
  ///     - foil
  ///     - etched
  /// - [price] should be a Decimal object.
  ///
  /// Example:
  /// ```dart
  /// MTGPrice('nonfoil', 'Non-Foil', 0, Decimal.parse('0.01'));
  /// print(price.name); // 'nonfoil'
  /// print(price.display); // 'Non-Foil'
  /// print(price.sortOrder); // 0
  /// print(price.price); // 0.01
  /// ```
  ///
  /// See also:
  /// - [MTGPrice.fromJson]
  /// - [MTGPrice.from]
  MTGPrice(String name, String display, int sortOrder, this.price) : super(name, display, sortOrder);

  /// Creates a new [MTGPrice] object based on a [finish] and a [price].
  /// [finish] is the name of the finish for a card, and [price] is the price of a card in USD for the given finish.
  ///
  /// Note:
  /// - [finish] should be one of the following:
  ///   - nonfoil
  ///   - foil
  ///   - etched
  /// - The [display] and [sortOrder] are automatically generated based on the [finish].
  /// - [price] should be a Decimal object.
  ///
  /// Example:
  /// ```dart
  /// MTGPrice.from('nonfoil', Decimal.parse('0.01'));
  /// print(price.name); // 'nonfoil'
  /// print(price.display); // 'Non-Foil'
  /// print(price.sortOrder); // 0
  /// print(price.price); // 0.01
  /// ```
  ///
  /// See also:
  /// - [MTGPrice.fromJson]
  factory MTGPrice.from(String finish, Decimal price) {
    int index = _finishes.indexOf(finish);
    return MTGPrice(finish, _finishesDisplay[index], index, price);
  }

  /// Creates a new [MTGPrice] object based on a JSON object.
  /// [json] is the JSON object to create this [MTGPrice] object from.
  ///
  /// Note:
  /// - [json] should be a JSON object with the following keys:
  ///   - name
  ///   - display
  ///   - sortOrder
  ///   - price
  /// - [name] should be one of the following:
  ///   - nonfoil
  ///   - foil
  ///   - etched
  /// - [price] should be a Decimal object.
  /// - The [name], [display], [sortOrder], and [price] are automatically generated based on the [json] object.
  ///
  /// Example:
  /// ```dart
  /// MTGPrice.fromJson({'name': 'nonfoil', 'display': 'Non-Foil', 'sortOrder': 0, 'price': Decimal.parse('0.01')});
  /// print(price.name); // 'nonfoil'
  /// print(price.display); // 'Non-Foil'
  /// print(price.sortOrder); // 0
  /// print(price.price); // 0.01
  /// ```
  ///
  /// See also:
  /// - [MTGPrice.from]
  /// - [MTGPrice.toJson]
  factory MTGPrice.fromJson(Map<String, dynamic> json) {
    return MTGPrice(json['name'], json['display'], json['sortOrder'], Decimal.parse(json['price']));
  }

  /// Gets this price in a given [currency].
  /// [currency] is the currency to convert the price to.
  ///
  /// Note:
  /// - [currency] should be a valid currency code.
  /// - [currency] is case insensitive.
  /// - The price is automatically converted to the given [currency].
  /// - If the [currency] is not valid, `Decimal.zero()` is returned.
  /// - If the [currency] is USD, the [price] is returned.
  /// - The exchange rates are updated every 24 hours and are not reflected in the examples below.
  /// - The exchange rates are based on the [exchangerate.host](https://exchangerate.host/) API.
  ///
  /// Example (good):
  /// ```dart
  /// MTGPrice price = MTGPrice('nonfoil', 'Non-Foil', 0, Decimal.parse('0.01'));
  /// print(price.priceIn('EUR')); // 0.01 * 0.85 = 0.0085
  /// ```
  ///
  /// Example (bad):
  /// ```dart
  /// MTGPrice price = MTGPrice('nonfoil', 'Non-Foil', 0, Decimal.parse('0.01'));
  /// print(price.priceIn('EURR')); // 0.0
  /// ```
  Future<Decimal> priceIn(String currency) async {
    if (currency.toLowerCase() == 'usd') {
      return price;
    } else {
      CurrencyEntry currencyEntry = await currencyDatabase.getCurrency(currency);
      if (currencyEntry.exchangeRate > 1) {
        return Decimal.parse((price.toDouble() / currencyEntry.exchangeRate).toString());
      } else {
        return price * Decimal.parse(currencyEntry.exchangeRate.toString());
      }
    }
  }

  /// Gets this price in a given [currency] and formats it.
  /// [currency] is the currency to convert the price to and format.
  ///
  /// Note:
  /// - [currency] should be a valid currency code.
  /// - [currency] is case insensitive.
  /// - The price is automatically converted to the given [currency].
  /// - If the [currency] is not valid, 0.00 folowed by the [currency] is returned.
  /// - The exchange rates are updated every 24 hours and are not reflected in the examples below.
  /// - The exchange rates are based on the [exchangerate.host](https://exchangerate.host/) API.
  ///
  /// Example (good):
  /// ```dart
  /// MTGPrice price = MTGPrice.fromJson({ "name": "nonfoil", "display": "Non-Foil", "sortOrder": 0, "price": Decimal.parse('0.01') });
  /// print(price.formattedPriceIn('EUR')); // '€0.0085'
  /// ```
  ///
  /// Example (bad):
  /// ```dart
  /// MTGPrice price = MTGPrice.fromJson({ "name": "nonfoil", "display": "Non-Foil", "sortOrder": 0, "price": Decimal.parse('0.01') });
  /// print(price.formattedPriceIn('EURR')); // '0.00 EURR'
  /// ```
  ///
  /// See also:
  /// - [MTGPrice.priceIn]
  Future<String> formattedPriceIn(String currency) async {
    Decimal amount = await priceIn(currency);
    switch (currency.toLowerCase()) {
      case 'aed':
        return 'د.إ ${amount.toStringAsFixed(2)}';
      case 'afn':
        return '؋ ${amount.toStringAsFixed(2)}';
      case 'all':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'amd':
        return '֏ ${amount.toStringAsFixed(2)}';
      case 'ang':
        return 'ƒ ${amount.toStringAsFixed(2)}';
      case 'aoa':
        return 'Kz ${amount.toStringAsFixed(2)}';
      case 'ars':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'aud':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'awg':
        return 'ƒ ${amount.toStringAsFixed(2)}';
      case 'azn':
        return '₼ ${amount.toStringAsFixed(2)}';
      case 'bam':
        return 'KM ${amount.toStringAsFixed(2)}';
      case 'bbd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bdt':
        return '৳ ${amount.toStringAsFixed(2)}';
      case 'bgn':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'bhd':
        return '.د.ب ${amount.toStringAsFixed(2)}';
      case 'bif':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'bmd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bnd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bob':
        return '\$b ${amount.toStringAsFixed(2)}';
      case 'brl':
        return 'R\$ ${amount.toStringAsFixed(2)}';
      case 'bsd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'btc':
        return '₿ ${amount.toStringAsFixed(6)}';
      case 'btn':
        return 'Nu. ${amount.toStringAsFixed(2)}';
      case 'bwp':
        return 'P ${amount.toStringAsFixed(2)}';
      case 'byn':
        return 'Br ${amount.toStringAsFixed(2)}';
      case 'bzd':
        return 'BZ\$ ${amount.toStringAsFixed(2)}';
      case 'cad':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cdf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'chf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'clf':
        return 'UF ${amount.toStringAsFixed(2)}';
      case 'clp':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cny':
        return '¥ ${amount.toStringAsFixed(2)}';
      case 'cop':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'crc':
        return '₡ ${amount.toStringAsFixed(2)}';
      case 'cuc':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cup':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cve':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'czk':
        return 'Kč ${amount.toStringAsFixed(2)}';
      case 'djf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'dkk':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'dop':
        return 'RD\$ ${amount.toStringAsFixed(2)}';
      case 'dzd':
        return 'د.ج ${amount.toStringAsFixed(2)}';
      case 'egp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'ern':
        return 'Nfk ${amount.toStringAsFixed(2)}';
      case 'etb':
        return 'Br ${amount.toStringAsFixed(2)}';
      case 'eur':
        return '€ ${amount.toStringAsFixed(2)}';
      case 'fjd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'fkp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gbp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gel':
        return '₾ ${amount.toStringAsFixed(2)}';
      case 'ggp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'ghs':
        return '₵ ${amount.toStringAsFixed(2)}';
      case 'gip':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gmd':
        return 'D ${amount.toStringAsFixed(2)}';
      case 'gnf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'gtq':
        return 'Q ${amount.toStringAsFixed(2)}';
      case 'gyd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'hkd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'hnl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'hrk':
        return 'kn ${amount.toStringAsFixed(2)}';
      case 'htg':
        return 'G ${amount.toStringAsFixed(2)}';
      case 'huf':
        return 'Ft ${amount.toStringAsFixed(2)}';
      case 'idr':
        return 'Rp ${amount.toStringAsFixed(2)}';
      case 'ils':
        return '₪ ${amount.toStringAsFixed(2)}';
      case 'imp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'inr':
        return '₹ ${amount.toStringAsFixed(2)}';
      case 'iqd':
        return 'ع.د ${amount.toStringAsFixed(2)}';
      case 'irr':
        return '﷼ ${amount.toStringAsFixed(2)}';
      case 'isk':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'jep':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'jmd':
        return 'J\$ ${amount.toStringAsFixed(2)}';
      case 'jod':
        return 'د.ا ${amount.toStringAsFixed(2)}';
      case 'jpy':
        return '¥ ${amount.toStringAsFixed(2)}';
      case 'kes':
        return 'Sh ${amount.toStringAsFixed(2)}';
      case 'kgs':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'khr':
        return '៛ ${amount.toStringAsFixed(2)}';
      case 'kmf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'kpw':
        return '₩ ${amount.toStringAsFixed(2)}';
      case 'krw':
        return '₩ ${amount.toStringAsFixed(2)}';
      case 'kwd':
        return 'د.ك ${amount.toStringAsFixed(2)}';
      case 'kyd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'kzt':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'lak':
        return '₭ ${amount.toStringAsFixed(2)}';
      case 'lbp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'lkr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'lrd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'lsl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'lyd':
        return 'ل.د ${amount.toStringAsFixed(2)}';
      case 'mad':
        return 'د.م. ${amount.toStringAsFixed(2)}';
      case 'mdl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'mga':
        return 'Ar ${amount.toStringAsFixed(2)}';
      case 'mkd':
        return 'ден ${amount.toStringAsFixed(2)}';
      case 'mmk':
        return 'Ks ${amount.toStringAsFixed(2)}';
      case 'mnt':
        return '₮ ${amount.toStringAsFixed(2)}';
      case 'mop':
        return 'P ${amount.toStringAsFixed(2)}';
      case 'mro':
        return 'UM ${amount.toStringAsFixed(2)}';
      case 'mur':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'mvr':
        return 'Rf ${amount.toStringAsFixed(2)}';
      case 'mwk':
        return 'MK ${amount.toStringAsFixed(2)}';
      case 'mxn':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'myr':
        return 'RM ${amount.toStringAsFixed(2)}';
      case 'mzn':
        return 'MT ${amount.toStringAsFixed(2)}';
      case 'nad':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'ngn':
        return '₦ ${amount.toStringAsFixed(2)}';
      case 'nio':
        return 'C\$ ${amount.toStringAsFixed(2)}';
      case 'nok':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'npr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'nzd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'omr':
        return 'ر.ع. ${amount.toStringAsFixed(2)}';
      case 'pab':
        return 'B/. ${amount.toStringAsFixed(2)}';
      case 'pen':
        return 'S/. ${amount.toStringAsFixed(2)}';
      case 'pgk':
        return 'K ${amount.toStringAsFixed(2)}';
      case 'php':
        return '₱ ${amount.toStringAsFixed(2)}';
      case 'pkr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'pln':
        return 'zł ${amount.toStringAsFixed(2)}';
      case 'pyg':
        return 'Gs ${amount.toStringAsFixed(2)}';
      case 'qar':
        return 'ر.ق ${amount.toStringAsFixed(2)}';
      case 'ron':
        return 'lei ${amount.toStringAsFixed(2)}';
      case 'rsd':
        return 'Дин. ${amount.toStringAsFixed(2)}';
      case 'rub':
        return '₽ ${amount.toStringAsFixed(2)}';
      case 'rwf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'sar':
        return 'ر.س ${amount.toStringAsFixed(2)}';
      case 'sbd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'scr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'sdg':
        return 'ج.س ${amount.toStringAsFixed(2)}';
      case 'sek':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'sgd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'shp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'sll':
        return 'Le ${amount.toStringAsFixed(2)}';
      case 'sos':
        return 'S ${amount.toStringAsFixed(2)}';
      case 'srd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'std':
        return 'Db ${amount.toStringAsFixed(2)}';
      case 'svc':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'syp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'szl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'thb':
        return '฿ ${amount.toStringAsFixed(2)}';
      case 'tjs':
        return 'SM ${amount.toStringAsFixed(2)}';
      case 'tmt':
        return 'm ${amount.toStringAsFixed(2)}';
      case 'tnd':
        return 'د.ت ${amount.toStringAsFixed(2)}';
      case 'top':
        return 'T\$ ${amount.toStringAsFixed(2)}';
      case 'try':
        return '₺ ${amount.toStringAsFixed(2)}';
      case 'ttd':
        return 'TT\$ ${amount.toStringAsFixed(2)}';
      case 'twd':
        return 'NT\$ ${amount.toStringAsFixed(2)}';
      case 'tzs':
        return 'TSh ${amount.toStringAsFixed(2)}';
      case 'uah':
        return '₴ ${amount.toStringAsFixed(2)}';
      case 'ugx':
        return 'USh ${amount.toStringAsFixed(2)}';
      case 'usd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'uyu':
        return '\$U ${amount.toStringAsFixed(2)}';
      case 'uzs':
        return 'so\'m ${amount.toStringAsFixed(2)}';
      case 'vef':
        return 'Bs ${amount.toStringAsFixed(2)}';
      case 'vnd':
        return '₫ ${amount.toStringAsFixed(2)}';
      case 'vuv':
        return 'VT ${amount.toStringAsFixed(2)}';
      case 'wst':
        return 'WS\$ ${amount.toStringAsFixed(2)}';
      case 'xaf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xcd':
        return 'EC\$ ${amount.toStringAsFixed(2)}';
      case 'xof':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xpf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xpt':
        return 'XPT ${amount.toStringAsFixed(2)}';
      case 'yer':
        return '﷼ ${amount.toStringAsFixed(2)}';
      case 'zar':
        return 'R ${amount.toStringAsFixed(2)}';
      case 'zmw':
        return 'ZK ${amount.toStringAsFixed(2)}';
      case 'zwl':
        return 'Z\$ ${amount.toStringAsFixed(2)}';
      default:
        return '${amount.toStringAsFixed(2)} $currency';
    }
  }

  /// Gets the JSON representation of this [MTGPrice]
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'display': display,
      'sortOrder': sortOrder,
      'price': price.toString(),
    };
  }

  /// Gets the string representation of this [MTGPrice]
  @override
  String toString() {
    return '$display: $price';
  }

  /// Checks if this [MTGPrice] is equal to another [MTGPrice]
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MTGPrice && name == other.name && price == other.price;

  /// Gets the hash code of this [MTGPrice]
  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
