import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/utils.dart';

class ScryfallParser {
  // static MTGCard parseScryfallCardJson(Map<String, dynamic> json) {
  //   List<String> finishes = [];
  //   bool isFoil = false;
  //   if (json.containsKey("finishes")) {
  //     for (var finish in json["finishes"]) {
  //       finishes.add(finish);
  //     }
  //   }
  //   if (finishes.length == 1 && finishes[0] == "foil") {
  //     isFoil = true;
  //   }
  // }

  static MTGFace parseScryfallFaceJson(Map<String, dynamic> json) {
    return MTGFace(
      json["name"],
      json["mana_cost"],
      json["type_line"],
      json["oracle_text"],
      (json.containsKey("power")) ? json["power"] : "",
      (json.containsKey("toughness")) ? json["toughness"] : "",
      (json.containsKey("loyalty")) ? json["loyalty"] : "",
      (json.containsKey("producedMana"))
          ? List<String>.from(
              json["producedMana"].map((x) {
                if (x != null) {
                  if (x is String) {
                    if (x.contains("{")) {
                      return x;
                    } else {
                      return "{$x}";
                    }
                  } else {
                    if (x.toString().contains("{")) {
                      return x.toString();
                    } else {
                      return '{$x.toString()}';
                    }
                  }
                } else {
                  return "";
                }
              }),
            )
          : (json.containsKey("produced_mana"))
              ? List<String>.from(
                  json["produced_mana"].map((x) {
                    if (x != null) {
                      if (x is String) {
                        if (x.contains("{")) {
                          return x;
                        } else {
                          return "{$x}";
                        }
                      } else {
                        if (x.toString().contains("{")) {
                          return x.toString();
                        } else {
                          return '{$x.toString()}';
                        }
                      }
                    } else {
                      return "";
                    }
                  }),
                )
              : [],
      (json.containsKey("imageUrl"))
          ? Uri.parse(json["imageUrl"])
          : (json["image_uris"] != null)
              ? Uri.parse(json["image_uris"]["png"])
              : Uri.parse(""),
      (json.containsKey("illustrationId"))
          ? json["illustrationId"]
          : (json["illustration_id"] != null)
              ? json["illustration_id"]
              : "",
      List<String>.from(json["colors"].map((x) => x)),
    );
  }
}

/// A class that represents a Magic: The Gathering card with this card's name [name], type [type], set name [setName], set code [set], collector number [collectorNumber], Scryfall Card Url [cardUrl], Scryfall Id [id], [rarity], converted mana cost [cmc], if the card is foil or not [isFoil], faces [faces], finishes [finishes], keywords [keywords], color identities [colorIdentity], legalities [legalities], and prices [prices]
///
/// Note:
/// * [faces] will contain more than one element if this card is a double-faced card
/// * [name] will be the name of both faces if this card is a double-faced card
/// * [type] will be the type of both faces if this card is a double-faced card
/// * [cmc] will be the sum of the cmc of both faces if this card is a double-faced card
/// * [isFoil] will be true if either face is foil
/// * [rarity] will be the same for both faces if this card is a double-faced card
/// * [colorIdentity] will be the same for both faces if this card is a double-faced card
/// * [keywords] will be the same for both faces if this card is a double-faced card
/// * [legalities] will be the same for both faces if this card is a double-faced card
/// * [prices] will be the same for both faces if this card is a double-faced card
/// * [finishes] will be the same for both faces if this card is a double-faced card
/// * [cardUrl] will be the same for both faces if this card is a double-faced card
/// * [id] will be the same for both faces if this card is a double-faced card
/// * [setName] will be the same for both faces if this card is a double-faced card
/// * [set] will be the same for both faces if this card is a double-faced card
/// * [collectorNumber] will be the same for both faces if this card is a double-faced card
///
/// See also:
/// * [MTGFace] for face information
/// * [MTGLegality] for legality information
/// * [MTGPrice] for price information
class MTGCard {
  /// The name of this card.
  String name;

  /// The type of this card.
  String type;

  /// The set of this card.
  String setName;

  /// The set code of this card.
  String set;

  /// The collector number of this card.
  String collectorNumber;

  /// The scryfall URI of this card.
  Uri cardUrl;

  /// The scryfall id of this card.
  String id;

  /// The converted mana cost of this card.
  String cmc;

  /// The rarity of this card.
  String rarity;

  /// If this card is foil.
  bool isFoil;

  /// The faces of this card.
  List<MTGFace> faces;

  /// The finishes of this card.
  List<String> finishes;

  /// The color identities of this card.
  List<String> colorIdentity;

  /// The keywords of this card.
  List<String> keywords;

  /// The legalities of this card.
  List<MTGLegality> legalities;

  /// The prices of this card.
  List<MTGPrice> prices;

  /// Creates a new [MTGCard] with the given [name], [type], [setName], [set], [collectorNumber], [cardUrl], [id], [rarity], [cmc], [isFoil], [faces], [finishes], [keywords], [colorIdentity], [legalities], and [prices]
  MTGCard(
    this.name,
    this.type,
    this.setName,
    this.set,
    this.collectorNumber,
    this.cardUrl,
    this.id,
    this.cmc,
    this.rarity,
    this.isFoil,
    this.faces,
    this.finishes,
    this.colorIdentity,
    this.keywords,
    this.legalities,
    this.prices,
  );

  /// Creates a new empty [MTGCard]
  MTGCard.empty()
      : name = '',
        type = '',
        setName = '',
        set = '',
        collectorNumber = "",
        cardUrl = Uri(),
        id = '',
        cmc = '',
        rarity = '',
        isFoil = false,
        faces = [MTGFace.empty()],
        finishes = [],
        colorIdentity = [],
        keywords = [],
        legalities = [],
        prices = [];

  // /// Creates a new [MTGCard] from a JSON object [json]
  // factory MTGCard.fromJson(Map<String, dynamic> json) {
  //   List<String> finishes = [];
  //   bool isFoil = false;
  //   if (json.containsKey("finishes")) {
  //     for (var finish in json["finishes"]) {
  //       finishes.add(finish);
  //     }
  //   }
  //   if (finishes.length == 1 && finishes[0] == "foil") {
  //     isFoil = true;
  //   }
  //   if (!json.containsKey("card_faces") && !json.containsKey("faces")) {
  //     MTGFace face = MTGFace.fromJson(json);
  //     return MTGCard(
  //       json["name"],
  //       (json.containsKey("type")) ? json["type"] : json["type_line"],
  //       (json.containsKey("setName")) ? json["setName"] : json["set_name"],
  //       json["set"] ?? "",
  //       (json.containsKey("collectorNumber")) ? json["collectorNumber"] ?? "" : json["collector_number"] ?? "",
  //       (json.containsKey("cardUrl")) ? Uri.parse(json["cardUrl"]) : Uri.parse(json["uri"]),
  //       json["id"],
  //       (json["cmc"].toString().contains(".")) ? json["cmc"].toString() : "${json["cmc"]}.0",
  //       json["rarity"],
  //       (json.containsKey("isFoil")) ? json["isFoil"] : isFoil,
  //       [face],
  //       finishes,
  //       List<String>.from(
  //         (json.containsKey("colorIdentity"))
  //             ? json["colorIdentity"].map((x) => x)
  //             : json["color_identity"].map((x) => x),
  //       ),
  //       List<String>.from(
  //         json["keywords"].map((x) => x),
  //       ),
  //       (json['legalities'] is List<dynamic>)
  //           ? List<MTGLegality>.from(json['legalities'].map((e) => MTGLegality.fromJson(e)))
  //           : List<MTGLegality>.from(json["legalities"].entries.map((e) => MTGLegality(e.key, e.value))),
  //       (json['prices'] is List<dynamic>)
  //           ? List<MTGPrice>.from(json['prices'].map((e) => MTGPrice.fromJson(e)))
  //           : List<MTGPrice>.from(json["prices"].entries.map((e) {
  //               if (e.value != null) {
  //                 return MTGPrice(e.key, e.value);
  //               } else {
  //                 return MTGPrice(e.key, "");
  //               }
  //             })),
  //     );
  //   } else {
  //     return MTGCard(
  //       json["name"],
  //       (json.containsKey("type")) ? json["type"] : json["type_line"],
  //       (json.containsKey("setName")) ? json["setName"] : json["set_name"],
  //       json["set"] ?? "",
  //       (json.containsKey("collectorNumber")) ? json["collectorNumber"] ?? "" : json["collector_number"] ?? "",
  //       (json.containsKey("cardUrl")) ? Uri.parse(json["cardUrl"]) : Uri.parse(json["uri"]),
  //       json["id"],
  //       (json["cmc"].toString().contains(".")) ? json["cmc"].toString() : "${json["cmc"]}.0",
  //       json["rarity"],
  //       (json.containsKey("isFoil")) ? json["isFoil"] : isFoil,
  //       List<MTGFace>.from(
  //         (json.containsKey("faces"))
  //             ? json["faces"].map((x) {
  //                 if (!x.containsKey("image_uris") && !x.containsKey("imageUrls")) {
  //                   x["image_uris"] = json["image_uris"];
  //                 }
  //                 if (!x.containsKey("colors")) {
  //                   x["colors"] = json["colors"];
  //                 }
  //                 return MTGFace.fromJson(x);
  //               })
  //             : json["card_faces"].map((x) {
  //                 if (!x.containsKey("image_uris") && !x.containsKey("imageUrls")) {
  //                   x["image_uris"] = json["image_uris"];
  //                 }
  //                 if (!x.containsKey("colors")) {
  //                   x["colors"] = json["colors"];
  //                 }
  //                 return MTGFace.fromJson(x);
  //               }),
  //       ),
  //       finishes,
  //       List<String>.from(
  //         (json.containsKey("colorIdentity"))
  //             ? json["colorIdentity"].map((x) => x)
  //             : json["color_identity"].map((x) => x),
  //       ),
  //       List<String>.from(json["keywords"].map((x) => x)),
  //       (json['legalities'] is List<dynamic>)
  //           ? List<MTGLegality>.from(json['legalities'].map((e) => MTGLegality.fromJson(e)))
  //           : List<MTGLegality>.from(json["legalities"].entries.map((e) => MTGLegality(e.key, e.value))),
  //       (json['prices'] is List<dynamic>)
  //           ? List<MTGPrice>.from(json['prices'].map((e) => MTGPrice.fromJson(e)))
  //           : List<MTGPrice>.from(json["prices"].entries.map((e) {
  //               if (e.value != null) {
  //                 return MTGPrice(e.key, e.value);
  //               } else {
  //                 return MTGPrice(e.key, "");
  //               }
  //             })),
  //     );
  //   }
  // }

  /// Gets the JSON representation of this [MTGCard]
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'setName': setName,
      'set': set,
      'collectorNumber': collectorNumber,
      'cardUrl': cardUrl.toString(),
      'id': id,
      'cmc': cmc,
      'rarity': rarity,
      'isFoil': isFoil,
      'faces': faces.map((x) => x.toJson()).toList(),
      'finishes': finishes,
      'colorIdentity': colorIdentity,
      'keywords': keywords,
      'legalities': legalities.map((x) => x.toJson()).toList(),
      'prices': prices.map((x) => x.toJson()).toList(),
    };
  }

  /// Gets the string representation of this [MTGCard]
  @override
  String toString() {
    return jsonEncode(toJson());
  }

  /// Checks if this [MTGCard] is equal to another [MTGCard]
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MTGCard &&
        other.name == name &&
        other.type == type &&
        other.setName == setName &&
        other.set == set &&
        other.collectorNumber == collectorNumber &&
        other.cardUrl == cardUrl &&
        other.id == id &&
        other.cmc == cmc &&
        other.rarity == rarity &&
        other.isFoil == isFoil &&
        Utils.listEquals(other.faces, faces) &&
        Utils.listEquals(other.colorIdentity, colorIdentity) &&
        Utils.listEquals(other.keywords, keywords) &&
        Utils.listEquals(other.legalities, legalities) &&
        Utils.listEquals(other.prices, prices);
  }

  /// Gets the [MTGFace] of this [MTGCard] at the given index
  MTGFace operator [](Side side) {
    switch (side) {
      case Side.front:
        return faces[0];
      case Side.back:
        return faces[1];
      default:
        return faces[0];
    }
  }

  /// Gets the hashcode of this [MTGCard]
  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        setName.hashCode ^
        set.hashCode ^
        collectorNumber.hashCode ^
        cardUrl.hashCode ^
        id.hashCode ^
        cmc.hashCode ^
        rarity.hashCode ^
        isFoil.hashCode ^
        faces.hashCode ^
        colorIdentity.hashCode ^
        keywords.hashCode ^
        legalities.hashCode ^
        prices.hashCode;
  }

  /// Creates a copy of this [MTGCard] with the given fields replaced with the new values provided in the named arguments of this method call (if any) and returns it as a new [MTGCard] object (does not modify this [MTGCard] object)
  /// * [name] is the new name of this [MTGCard]
  /// * [type] is the new type of this [MTGCard]
  /// * [setName] is the new set name of this [MTGCard]
  /// * [set] is the new set of this [MTGCard]
  /// * [collectorNumber] is the new collector number of this [MTGCard]
  /// * [cardUrl] is the new card URL of this [MTGCard]
  /// * [id] is the new ID of this [MTGCard]
  /// * [cmc] is the new converted mana cost of this [MTGCard]
  /// * [rarity] is the new rarity of this [MTGCard]
  /// * [isFoil] is the new foil status of this [MTGCard]
  /// * [faces] is the new faces of this [MTGCard]
  /// * [finishes] is the new finishes of this [MTGCard]
  /// * [colorIdentity] is the new color identity of this [MTGCard]
  /// * [keywords] is the new keywords of this [MTGCard]
  /// * [legalities] is the new legalities of this [MTGCard]
  /// * [prices] is the new prices of this [MTGCard]
  MTGCard copyWith({
    String? name,
    String? type,
    String? setName,
    String? set,
    String? collectorNumber,
    Uri? cardUrl,
    String? id,
    String? cmc,
    String? rarity,
    bool? isFoil,
    List<MTGFace>? faces,
    List<String>? finishes,
    List<String>? colorIdentity,
    List<String>? keywords,
    List<MTGLegality>? legalities,
    List<MTGPrice>? prices,
  }) {
    return MTGCard(
      name ?? this.name,
      type ?? this.type,
      setName ?? this.setName,
      set ?? this.set,
      collectorNumber ?? this.collectorNumber,
      cardUrl ?? this.cardUrl,
      id ?? this.id,
      cmc ?? this.cmc,
      rarity ?? this.rarity,
      isFoil ?? this.isFoil,
      faces ?? this.faces,
      finishes ?? this.finishes,
      colorIdentity ?? this.colorIdentity,
      keywords ?? this.keywords,
      legalities ?? this.legalities,
      prices ?? this.prices,
    );
  }

  /// Gets the formatted string representation of this [MTGCard]'s finishes
  Map<String, String> get formattedFinishes {
    Map<String, String> formattedFinishes = {};
    for (var finish in finishes) {
      switch (finish) {
        case 'nonfoil':
          formattedFinishes['Non-Foil'] = 'nonfoil';
          break;
        case 'foil':
          formattedFinishes['Foil'] = 'foil';
          break;
        case 'etched':
          formattedFinishes['Etched'] = 'etched';
          break;
        case 'glossy':
          formattedFinishes['Glossy'] = 'glossy';
          break;
        default:
          break;
      }
    }
    return formattedFinishes;
  }

  // /// Gets the price of this [MTGCard] in the specified currency [currency] and [finish]
  // Decimal getPrice(String currency, String finish) {
  //   final priceMap = {for (var e in prices) e.currency: e.price};
  //   switch (currency.toLowerCase()) {
  //     case 'usd':
  //     case 'dollar':
  //       if (finish == 'foil' || finish == 'Foil') {
  //         return Decimal.parse((priceMap['usd_foil']!.isEmpty) ? '0' : priceMap['usd_foil']!);
  //       } else if (finish == 'nonfoil' || finish == 'Non-Foil' || finish == 'glossy' || finish == 'Glossy') {
  //         return Decimal.parse((priceMap['usd']!.isEmpty) ? '0' : priceMap['usd']!);
  //       } else if (finish == 'etched' || finish == 'Etched') {
  //         return Decimal.parse((priceMap['usd_etched']!.isEmpty) ? '0' : priceMap['usd_etched']!);
  //       } else {
  //         return Decimal.fromInt(0);
  //       }
  //     case 'eur':
  //     case 'euro':
  //       if (finish == 'foil' || finish == 'Foil') {
  //         return Decimal.parse((priceMap['eur_foil']!.isEmpty) ? '0' : priceMap['eur_foil']!);
  //       } else if (finish == 'nonfoil' || finish == 'Non-Foil' || finish == 'glossy' || finish == 'Glossy') {
  //         return Decimal.parse((priceMap['eur']!.isEmpty) ? '0' : priceMap['eur']!);
  //       } else {
  //         return Decimal.fromInt(0);
  //       }
  //     case 'tix':
  //       return Decimal.parse((priceMap['tix']!.isEmpty) ? '0' : priceMap['tix']!);
  //     default:
  //       return Decimal.fromInt(0);
  //   }
  // }
}

///A class representing a face of a Magic: The Gathering card. A face is a side of a card, such as the front and back of a double-faced card. A face can have a name [name], mana cost [manaCost], type line [type], oracle text [oracleText], power [power], toughness [toughness], loyalty [loyalty], the mana it produces [producedMana], its image [imageUrl], its illustration ID [illustrationId], and colors [colors].
class MTGFace {
  /// The name of the face
  String name;

  /// The mana cost of the face
  String manaCost;

  /// The type line of the face
  String type;

  /// The oracle text of the face
  String oracleText;

  /// The power of the face
  String power;

  /// The toughness of the face
  String toughness;

  /// The loyalty of the face
  String loyalty;

  /// The mana this face produces
  List<String> producedMana;

  /// The image Url of the face
  Uri imageUrl;

  /// The illustration ID of the face
  String illustrationId;

  /// The colors of the face
  List<String> colors;

  /// Creates a new [MTGFace] with the given [name], [manaCost], [type], [oracleText], [power], [toughness], [loyalty], [producedMana], [imageUrl], [illustrationId], and [colors]
  MTGFace(
    this.name,
    this.manaCost,
    this.type,
    this.oracleText,
    this.power,
    this.toughness,
    this.loyalty,
    this.producedMana,
    this.imageUrl,
    this.illustrationId,
    this.colors,
  );

  /// Creates a new empty [MTGFace]
  MTGFace.empty()
      : name = "",
        manaCost = "",
        type = "",
        oracleText = "",
        power = "",
        toughness = "",
        loyalty = "",
        producedMana = [],
        imageUrl = Uri.parse(""),
        illustrationId = "",
        colors = [];

  /// Creates a new [MTGFace] from a JSON object [json]
  factory MTGFace.fromJson(Map<String, dynamic> json) {
    return MTGFace(
      json["name"],
      (json.containsKey("manaCost")) ? json["manaCost"] : json["mana_cost"],
      (json.containsKey("type")) ? json["type"] : json["type_line"],
      (json.containsKey("oracleText")) ? json["oracleText"] : json["oracle_text"],
      (json.containsKey("power")) ? json["power"] : "",
      (json.containsKey("toughness")) ? json["toughness"] : "",
      (json.containsKey("loyalty")) ? json["loyalty"] : "",
      (json.containsKey("producedMana"))
          ? List<String>.from(
              json["producedMana"].map((x) {
                if (x != null) {
                  if (x is String) {
                    if (x.contains("{")) {
                      return x;
                    } else {
                      return "{$x}";
                    }
                  } else {
                    if (x.toString().contains("{")) {
                      return x.toString();
                    } else {
                      return '{$x.toString()}';
                    }
                  }
                } else {
                  return "";
                }
              }),
            )
          : (json.containsKey("produced_mana"))
              ? List<String>.from(
                  json["produced_mana"].map((x) {
                    if (x != null) {
                      if (x is String) {
                        if (x.contains("{")) {
                          return x;
                        } else {
                          return "{$x}";
                        }
                      } else {
                        if (x.toString().contains("{")) {
                          return x.toString();
                        } else {
                          return '{$x.toString()}';
                        }
                      }
                    } else {
                      return "";
                    }
                  }),
                )
              : [],
      (json.containsKey("imageUrl"))
          ? Uri.parse(json["imageUrl"])
          : (json["image_uris"] != null)
              ? Uri.parse(json["image_uris"]["png"])
              : Uri.parse(""),
      (json.containsKey("illustrationId"))
          ? json["illustrationId"]
          : (json["illustration_id"] != null)
              ? json["illustration_id"]
              : "",
      List<String>.from(json["colors"].map((x) => x)),
    );
  }

  /// Gets the JSON representation of this [MTGFace]
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'manaCost': manaCost,
      'type': type,
      'oracleText': oracleText,
      'power': power,
      'toughness': toughness,
      'loyalty': loyalty,
      'produced_mana': producedMana,
      'imageUrl': imageUrl.toString(),
      'illustrationId': illustrationId,
      'colors': colors,
    };
  }

  /// Gets the string representation of this [MTGFace]
  @override
  String toString() {
    return jsonEncode(toJson());
  }

  /// Checks if this [MTGFace] is equal to another [MTGFace]
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MTGFace &&
        other.name == name &&
        other.manaCost == manaCost &&
        other.type == type &&
        other.oracleText == oracleText &&
        other.power == power &&
        other.toughness == toughness &&
        other.loyalty == loyalty &&
        Utils.listEquals(other.producedMana, producedMana) &&
        other.imageUrl == imageUrl &&
        other.illustrationId == illustrationId &&
        Utils.listEquals(other.colors, colors);
  }

  /// Gets the hash code of this [MTGFace]
  @override
  int get hashCode {
    return name.hashCode ^
        manaCost.hashCode ^
        type.hashCode ^
        oracleText.hashCode ^
        power.hashCode ^
        toughness.hashCode ^
        loyalty.hashCode ^
        producedMana.hashCode ^
        imageUrl.hashCode ^
        illustrationId.hashCode ^
        colors.hashCode;
  }
}
