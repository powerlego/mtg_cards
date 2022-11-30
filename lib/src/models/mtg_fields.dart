import 'package:decimal/decimal.dart';
import 'package:mtg_cards/models.dart';

abstract class MTGField extends Comparable {
  final String name;
  final String display;
  final int sortOrder;

  MTGField(this.name, this.display, this.sortOrder);

  @override
  int compareTo(other) {
    final result = sortOrder.compareTo(other.sortOrder);
    if (result == 0) {
      return name.compareTo(other.name);
    } else {
      return result;
    }
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

  static MTGColor get white => MTGColor('W', 'White', 0);
  static MTGColor get blue => MTGColor('U', 'Blue', 1);
  static MTGColor get black => MTGColor('B', 'Black', 2);
  static MTGColor get red => MTGColor('R', 'Red', 3);
  static MTGColor get green => MTGColor('G', 'Green', 4);
  static MTGColor get colorless => MTGColor('C', 'Colorless', 5);

  static MTGColor fromName(String color) {
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

  static MTGColor fromDisplay(String color) {
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
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
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

  static MTGRarity get common => MTGRarity('common', 'Common', 0);
  static MTGRarity get uncommon => MTGRarity('uncommon', 'Uncommon', 1);
  static MTGRarity get rare => MTGRarity('rare', 'Rare', 2);
  static MTGRarity get mythic => MTGRarity('mythic', 'Mythic Rare', 3);
  static MTGRarity get unknown => MTGRarity('unknown', 'Unknown', 255);

  static MTGRarity fromName(String rarity) {
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
        return unknown;
    }
  }

  static MTGRarity fromDisplay(String rarity) {
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
        return unknown;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
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
    'standard',
    'future',
    'historic',
    'gladiator',
    'pioneer',
    'modern',
    'legacy',
    'pauper',
    'vintage',
    'penny',
    'commander',
    'brawl',
    'duel',
    'historicbrawl',
    'paupercommander',
    'premodern',
    'alchemy',
    'explorer',
    'oldschool',
  ];

  static final List<String> _formatsDisplay = [
    'Standard',
    'Future',
    'Historic',
    'Gladiator',
    'Pioneer',
    'Modern',
    'Legacy',
    'Pauper',
    'Vintage',
    'Penny',
    'Commander',
    'Brawl',
    'Duel',
    'Historic Brawl',
    'Pauper Commander',
    'Premodern',
    'Alchemy',
    'Explorer',
    'Old School',
  ];

  static final List<String> _legalities = [
    'legal',
    'not_legal',
    'restricted',
    'banned',
  ];

  static final List<String> _legalityDisplay = [
    'Legal',
    'Not Legal',
    'Restricted',
    'Banned',
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
///   final json = { 'name': 'nonfoil', 'display': 'Non-Foil', 'sortOrder': 0, 'price': Decimal.parse('0.01') };
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
  final Price price;

  static MTGPrice get zero => MTGPrice(MTGFinish.unknown, Price.zero);

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
  MTGPrice(MTGFinish finish, this.price) : super(finish.name, finish.display, finish.sortOrder);

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
  factory MTGPrice.from(MTGFinish finish, Price price) {
    return MTGPrice(finish, price);
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
    return MTGPrice(MTGFinish.fromName((json['finish'] as Map<String, dynamic>)['name']),
        Price.fromJson(json['price'] as Map<String, dynamic>));
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
  Future<Decimal> priceIn(String currency, {int quantity = 1}) async {
    return price.priceIn(currency, quantity: quantity);
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
  /// MTGPrice price = MTGPrice.fromJson({ 'name': 'nonfoil', 'display': 'Non-Foil', 'sortOrder': 0, 'price': Decimal.parse('0.01') });
  /// print(price.formattedPriceIn('EUR')); // '€0.0085'
  /// ```
  ///
  /// Example (bad):
  /// ```dart
  /// MTGPrice price = MTGPrice.fromJson({ 'name': 'nonfoil', 'display': 'Non-Foil', 'sortOrder': 0, 'price': Decimal.parse('0.01') });
  /// print(price.formattedPriceIn('EURR')); // '0.00 EURR'
  /// ```
  ///
  /// See also:
  /// - [MTGPrice.priceIn]
  Future<String> formattedPriceIn(String currency, {int quantity = 1}) async {
    return price.formattedPriceIn(currency, quantity: quantity);
  }

  /// Gets the JSON representation of this [MTGPrice]
  @override
  Map<String, dynamic> toJson() {
    return {
      'finish': MTGFinish.fromName(name).toJson(),
      'price': {'\$numberDecimal': price.toString()},
    };
  }

  /// Gets the string representation of this [MTGPrice]
  @override
  String toString() {
    return '$display: $price';
  }

  @override
  int compareTo(other) {
    final result = price.compareTo(other.price);
    if (result == 0) {
      return sortOrder.compareTo(other.sortOrder);
    } else {
      return result;
    }
  }

  /// Checks if this [MTGPrice] is equal to another [MTGPrice]
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MTGPrice && name == other.name && price == other.price;

  /// Gets the hash code of this [MTGPrice]
  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

class MTGFinish extends MTGField {
  static MTGFinish get nonfoil => MTGFinish('nonfoil', 'Non-Foil', 0);
  static MTGFinish get foil => MTGFinish('foil', 'Foil', 1);
  static MTGFinish get etched => MTGFinish('etched', 'Etched', 2);
  static MTGFinish get glossy => MTGFinish('glossy', 'Glossy', 3);
  static MTGFinish get unknown => MTGFinish('unknown', 'Unknown', 255);

  MTGFinish(super.name, super.display, super.sortOrder);

  /// Gets the JSON representation of this [MTGFinish]
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  /// Gets the string representation of this [MTGFinish]
  ///
  /// Returns the display name of this [MTGFinish]
  @override
  String toString() {
    return display;
  }

  /// Checks if this [MTGFinish] is equal to another [MTGFinish]
  ///
  /// Returns true if the name of this [MTGFinish] is equal to the name of the other [MTGFinish]
  @override
  bool operator ==(Object other) => identical(this, other) || other is MTGFinish && name == other.name;

  /// Gets the hash code of this [MTGFinish]
  @override
  int get hashCode => name.hashCode;

  /// Gets the [MTGFinish] from the given [name]
  ///
  /// Returns the [MTGFinish] with the given [name] or [MTGFinish.unknown] if no [MTGFinish] with the given [name] exists
  static MTGFinish fromName(String name) {
    switch (name) {
      case 'nonfoil':
        return nonfoil;
      case 'foil':
        return foil;
      case 'etched':
        return etched;
      case 'glossy':
        return glossy;
      default:
        return unknown;
    }
  }

  /// Gets the [MTGFinish] from the given [display]
  ///
  /// Returns the [MTGFinish] with the given [display] or [MTGFinish.unknown] if no [MTGFinish] with the given [display] exists
  static MTGFinish fromDisplay(String display) {
    switch (display) {
      case 'Non-Foil':
        return nonfoil;
      case 'Foil':
        return foil;
      case 'Etched':
        return etched;
      case 'Glossy':
        return glossy;
      default:
        return unknown;
    }
  }
}
