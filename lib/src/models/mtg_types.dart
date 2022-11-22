import 'package:mtg_cards/models.dart';

class MTGCardType extends MTGField {
  MTGCardType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  static MTGCardType unknown = MTGCardType('unknown', 'Unknown', 255);

  @override
  int compareTo(other) {
    return sortOrder.compareTo(other.sortOrder);
  }

  @override
  String toString() {
    return display;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is MTGCardType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  MTGCardType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }
}

class MTGCardSuperType extends MTGCardType {
  MTGCardSuperType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCardSuperType.fromJson(Map<String, dynamic> json) {
    return MTGCardSuperType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCardSuperType basic = MTGCardSuperType('basic', 'Basic', 0);
  static MTGCardSuperType legendary = MTGCardSuperType('legendary', 'Legendary', 1);
  static MTGCardSuperType snow = MTGCardSuperType('snow', 'Snow', 2);
  static MTGCardSuperType world = MTGCardSuperType('world', 'World', 3);
  static MTGCardSuperType ongoing = MTGCardSuperType('ongoing', 'Ongoing', 4);
  static MTGCardSuperType token = MTGCardSuperType('token', "Token", 5);
  static MTGCardSuperType empty = MTGCardSuperType('', '', 6);
  static MTGCardSuperType unknown = MTGCardSuperType('unknown', 'Unknown', 7);

  static MTGCardSuperType getSuperTypeFromName(String superType) {
    switch (superType) {
      case 'basic':
        return basic;
      case 'legendary':
        return legendary;
      case 'snow':
        return snow;
      case 'world':
        return world;
      case 'ongoing':
        return ongoing;
      case 'token':
        return token;
      case '':
        return empty;
      default:
        return unknown;
    }
  }

  static MTGCardSuperType getSuperTypeFromDisplay(String superType) {
    switch (superType) {
      case 'Basic':
        return basic;
      case 'Legendary':
        return legendary;
      case 'Snow':
        return snow;
      case 'World':
        return world;
      case 'Ongoing':
        return ongoing;
      case 'Token':
        return token;
      case '':
        return empty;
      default:
        return unknown;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCardSuperType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  MTGCardType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardSuperType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  static List<MTGCardSuperType> get superTypes => [
        basic,
        legendary,
        snow,
        world,
        ongoing,
        token,
      ];

  static List<String> get superTypeNames => [
        basic.name,
        legendary.name,
        snow.name,
        world.name,
        ongoing.name,
        token.name,
      ];
}

class MTGCardMainType extends MTGCardType {
  MTGCardMainType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCardMainType.fromJson(Map<String, dynamic> json) {
    return MTGCardMainType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCardMainType creature = MTGCardMainType('creature', 'Creature', 0);
  static MTGCardMainType enchantment = MTGCardMainType('enchantment', 'Enchantment', 1);
  static MTGCardMainType land = MTGCardMainType('land', 'Land', 2);
  static MTGCardMainType artifact = MTGCardMainType('artifact', 'Artifact', 3);
  static MTGCardMainType instant = MTGCardMainType('instant', 'Instant', 4);
  static MTGCardMainType sorcery = MTGCardMainType('sorcery', 'Sorcery', 5);
  static MTGCardMainType planeswalker = MTGCardMainType('planeswalker', 'Planeswalker', 6);
  static MTGCardMainType unknown = MTGCardMainType('unknown', 'Unknown', 7);

  static MTGCardMainType getTypeFromName(String type) {
    switch (type) {
      case 'creature':
        return creature;
      case 'enchantment':
        return enchantment;
      case 'land':
        return land;
      case 'artifact':
        return artifact;
      case 'instant':
        return instant;
      case 'sorcery':
        return sorcery;
      case 'planeswalker':
        return planeswalker;
      default:
        return unknown;
    }
  }

  static MTGCardMainType getTypeFromDisplay(String type) {
    switch (type) {
      case 'Creature':
        return creature;
      case 'Enchantment':
        return enchantment;
      case 'Land':
        return land;
      case 'Artifact':
        return artifact;
      case 'Instant':
        return instant;
      case 'Sorcery':
        return sorcery;
      case 'Planeswalker':
        return planeswalker;
      default:
        return unknown;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCardMainType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  MTGCardType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardMainType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  static List<MTGCardMainType> get types => [
        creature,
        enchantment,
        land,
        artifact,
        instant,
        sorcery,
        planeswalker,
      ];

  static List<String> get typeNames => [
        creature.name,
        enchantment.name,
        land.name,
        artifact.name,
        instant.name,
        sorcery.name,
        planeswalker.name,
      ];
}

class MTGCardSubType extends MTGField {
  MTGCardSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  static MTGCardSubType unknown = MTGCardSubType('unknown', 'Unknown', 255);

  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCardSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGCreatureSubType extends MTGCardSubType {
  MTGCreatureSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCreatureSubType.fromJson(Map<String, dynamic> json) {
    return MTGCreatureSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCreatureSubType unknown = MTGCreatureSubType('unknown', 'Unknown', 0);

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCreatureSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  static MTGCreatureSubType getSubTypeFromName(String subType) {
    return unknown;
  }

  static MTGCreatureSubType getSubTypeFromDisplay(String subType) {
    return unknown;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCreatureSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGCreatureSubType> get subTypes => [
        unknown,
      ];

  static List<String> get subTypeNames => [
        unknown.name,
      ];
}

class MTGEnchantmentSubType extends MTGCardSubType {
  MTGEnchantmentSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGEnchantmentSubType.fromJson(Map<String, dynamic> json) {
    return MTGEnchantmentSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGEnchantmentSubType aura = MTGEnchantmentSubType('aura', 'Aura', 0);
  static MTGEnchantmentSubType curse = MTGEnchantmentSubType('curse', 'Curse', 1);
  static MTGEnchantmentSubType shrine = MTGEnchantmentSubType('shrine', 'Shrine', 2);
  static MTGEnchantmentSubType unknown = MTGEnchantmentSubType('unknown', 'Unknown', 3);

  static MTGEnchantmentSubType getSubTypeFromName(String subType) {
    switch (subType) {
      case 'aura':
        return aura;
      case 'curse':
        return curse;
      case 'shrine':
        return shrine;
      default:
        return unknown;
    }
  }

  static MTGEnchantmentSubType getSubTypeFromDisplay(String subType) {
    switch (subType) {
      case 'Aura':
        return aura;
      case 'Curse':
        return curse;
      case 'Shrine':
        return shrine;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGEnchantmentSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGEnchantmentSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGEnchantmentSubType> get subTypes => [
        aura,
        curse,
        shrine,
      ];

  static List<String> get subTypeNames => [
        aura.name,
        curse.name,
        shrine.name,
      ];
}

class MTGLandSubType extends MTGCardSubType {
  MTGLandSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGLandSubType.fromJson(Map<String, dynamic> json) {
    return MTGLandSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGLandSubType basic = MTGLandSubType('basic', 'Basic', 0);
  static MTGLandSubType legendary = MTGLandSubType('legendary', 'Legendary', 1);
  static MTGLandSubType snow = MTGLandSubType('snow', 'Snow', 2);
  static MTGLandSubType world = MTGLandSubType('world', 'World', 3);
  static MTGLandSubType unknown = MTGLandSubType('unknown', 'Unknown', 4);

  static MTGLandSubType getSubTypeFromName(String subType) {
    switch (subType) {
      case 'basic':
        return basic;
      case 'legendary':
        return legendary;
      case 'snow':
        return snow;
      case 'world':
        return world;
      default:
        return unknown;
    }
  }

  static MTGLandSubType getSubTypeFromDisplay(String subType) {
    switch (subType) {
      case 'Basic':
        return basic;
      case 'Legendary':
        return legendary;
      case 'Snow':
        return snow;
      case 'World':
        return world;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGLandSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGLandSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGLandSubType> get subTypes => [
        basic,
        legendary,
        snow,
        world,
      ];

  static List<String> get subTypeNames => [
        basic.name,
        legendary.name,
        snow.name,
        world.name,
      ];
}

class MTGArtifactSubType extends MTGCardSubType {
  MTGArtifactSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGArtifactSubType.fromJson(Map<String, dynamic> json) {
    return MTGArtifactSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGArtifactSubType equipment = MTGArtifactSubType('equipment', 'Equipment', 0);
  static MTGArtifactSubType unknown = MTGArtifactSubType('unknown', 'Unknown', 1);

  static MTGArtifactSubType getSubTypeFromName(String subType) {
    switch (subType) {
      case 'equipment':
        return equipment;
      default:
        return unknown;
    }
  }

  static MTGArtifactSubType getSubTypeFromDisplay(String subType) {
    switch (subType) {
      case 'Equipment':
        return equipment;
      default:
        return unknown;
    }
  }

  static List<MTGArtifactSubType> get subTypes => [
        equipment,
      ];

  static List<String> get subTypeNames => [
        equipment.name,
      ];
}

class MTGInstantSubType extends MTGCardSubType {
  MTGInstantSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGInstantSubType.fromJson(Map<String, dynamic> json) {
    return MTGInstantSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGInstantSubType unknown = MTGInstantSubType('unknown', 'Unknown', 0);

  static MTGInstantSubType getSubTypeFromName(String subType) {
    return unknown;
  }

  static MTGInstantSubType getSubTypeFromDisplay(String subType) {
    return unknown;
  }

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGInstantSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGInstantSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGInstantSubType> get subTypes => [
        unknown,
      ];

  static List<String> get subTypesNames => [
        unknown.name,
      ];
}

class MTGSorcerySubType extends MTGCardSubType {
  MTGSorcerySubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGSorcerySubType.fromJson(Map<String, dynamic> json) {
    return MTGSorcerySubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGSorcerySubType unknown = MTGSorcerySubType('unknown', 'Unknown', 0);

  static MTGSorcerySubType getSubTypeFromName(String subType) {
    return unknown;
  }

  static MTGSorcerySubType getSubTypeFromDisplay(String subType) {
    return unknown;
  }

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGSorcerySubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGSorcerySubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGSorcerySubType> get subTypes => [
        unknown,
      ];

  static List<String> get subTypeNames => [
        unknown.name,
      ];
}

class MTGPlaneswalkerSubType extends MTGCardSubType {
  MTGPlaneswalkerSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGPlaneswalkerSubType.fromJson(Map<String, dynamic> json) {
    return MTGPlaneswalkerSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGPlaneswalkerSubType ajani = MTGPlaneswalkerSubType('ajani', 'Ajani', 0);
  static MTGPlaneswalkerSubType chandra = MTGPlaneswalkerSubType('chandra', 'Chandra', 1);
  static MTGPlaneswalkerSubType domri = MTGPlaneswalkerSubType('domri', 'Domri', 2);
  static MTGPlaneswalkerSubType elspeth = MTGPlaneswalkerSubType('elspeth', 'Elspeth', 3);
  static MTGPlaneswalkerSubType garruk = MTGPlaneswalkerSubType('garruk', 'Garruk', 4);
  static MTGPlaneswalkerSubType jace = MTGPlaneswalkerSubType('jace', 'Jace', 5);
  static MTGPlaneswalkerSubType karn = MTGPlaneswalkerSubType('karn', 'Karn', 6);
  static MTGPlaneswalkerSubType nissa = MTGPlaneswalkerSubType('nissa', 'Nissa', 7);
  static MTGPlaneswalkerSubType sorin = MTGPlaneswalkerSubType('sorin', 'Sorin', 8);
  static MTGPlaneswalkerSubType teferi = MTGPlaneswalkerSubType('teferi', 'Teferi', 9);
  static MTGPlaneswalkerSubType unknown = MTGPlaneswalkerSubType('unknown', 'Unknown', 10);

  static MTGPlaneswalkerSubType getSubTypeFromName(String subType) {
    switch (subType) {
      case 'ajani':
        return ajani;
      case 'chandra':
        return chandra;
      case 'domri':
        return domri;
      case 'elspeth':
        return elspeth;
      case 'garruk':
        return garruk;
      case 'jace':
        return jace;
      case 'karn':
        return karn;
      case 'nissa':
        return nissa;
      case 'sorin':
        return sorin;
      case 'teferi':
        return teferi;
      default:
        return unknown;
    }
  }

  static MTGPlaneswalkerSubType getSubTypeFromDisplay(String subType) {
    switch (subType) {
      case 'Ajani':
        return ajani;
      case 'Chandra':
        return chandra;
      case 'Domri':
        return domri;
      case 'Elspeth':
        return elspeth;
      case 'Garruk':
        return garruk;
      case 'Jace':
        return jace;
      case 'Karn':
        return karn;
      case 'Nissa':
        return nissa;
      case 'Sorin':
        return sorin;
      case 'Teferi':
        return teferi;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGPlaneswalkerSubType(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGPlaneswalkerSubType && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  static List<MTGPlaneswalkerSubType> get subTypes => [
        ajani,
        chandra,
        domri,
        elspeth,
        garruk,
        jace,
        karn,
        nissa,
        sorin,
        teferi,
      ];

  static List<String> get subTypeNames => [
        ajani.name,
        chandra.name,
        domri.name,
        elspeth.name,
        garruk.name,
        jace.name,
        karn.name,
        nissa.name,
        sorin.name,
        teferi.name,
      ];
}

class MTGCardTypeLine extends MTGField {
  MTGCardTypeLine(this.cardType, this.subType) : super("typeLine", "Type Line", 0);

  final List<MTGCardType> cardType;
  final List<MTGCardSubType> subType;

  factory MTGCardTypeLine.fromJson(Map<String, dynamic> json) {
    return MTGCardTypeLine(
      (json['cardType'] as List<dynamic>).map((e) => _MTGCardTypeParser.parseCardType(e as String)).toList(),
      (json['subType'] as List<dynamic>).map((e) => _MTGCardTypeParser.parseCardSubType(e as String)).toList(),
    );
  }

  factory MTGCardTypeLine.fromString(String typeLine) {
    return _MTGCardTypeParser.parseCardTypeLine(typeLine);
  }

  static MTGCardTypeLine unknown = MTGCardTypeLine([MTGCardType.unknown], [MTGCardSubType.unknown]);

  @override
  Map<String, dynamic> toJson() {
    return {
      'cardType': cardType.map((e) => e.name).toList(),
      'subType': subType.map((e) => e.name).toList(),
    };
  }

  @override
  String toString() {
    if (cardType.length == 1 && cardType[0] == MTGCardType.unknown) {
      return 'Unknown';
    } else if (subType.length == 1 && subType[0] == MTGCardSubType.unknown) {
      return cardType.map((e) => e.display).join(' ');
    } else if (subType.isEmpty) {
      return cardType.map((e) => e.display).join(' ');
    } else {
      return '${cardType.map((e) => e.display).join(' ')} - ${subType.map((e) => e.display).join(' ')}';
    }
  }
}

class _MTGCardTypeParser {
  static MTGCardType parseCardType(String cardType) {
    if (MTGCardSuperType.superTypeNames.contains(cardType)) {
      return MTGCardSuperType.getSuperTypeFromName(cardType);
    } else if (MTGCardMainType.typeNames.contains(cardType)) {
      return MTGCardMainType.getTypeFromName(cardType);
    } else {
      return MTGCardType.unknown;
    }
  }

  static MTGCardSubType parseCardSubType(String cardSubType) {
    if (MTGCreatureSubType.subTypeNames.contains(cardSubType)) {
      return MTGCreatureSubType.getSubTypeFromName(cardSubType);
    } else if (MTGEnchantmentSubType.subTypeNames.contains(cardSubType)) {
      return MTGEnchantmentSubType.getSubTypeFromName(cardSubType);
    } else if (MTGLandSubType.subTypeNames.contains(cardSubType)) {
      return MTGLandSubType.getSubTypeFromName(cardSubType);
    } else if (MTGArtifactSubType.subTypeNames.contains(cardSubType)) {
      return MTGArtifactSubType.getSubTypeFromName(cardSubType);
    } else if (MTGInstantSubType.subTypesNames.contains(cardSubType)) {
      return MTGInstantSubType.getSubTypeFromName(cardSubType);
    } else if (MTGSorcerySubType.subTypeNames.contains(cardSubType)) {
      return MTGSorcerySubType.getSubTypeFromName(cardSubType);
    } else if (MTGPlaneswalkerSubType.subTypeNames.contains(cardSubType)) {
      return MTGPlaneswalkerSubType.getSubTypeFromName(cardSubType);
    } else {
      return MTGCardSubType.unknown;
    }
  }

  static MTGCardTypeLine parseCardTypeLine(String cardTypeLine) {
    List<String> cardTypeLineSplit = cardTypeLine.split(' - ');
    List<MTGCardType> cardType = [];
    List<MTGCardSubType> subType = [];

    if (cardTypeLineSplit.isNotEmpty) {
      cardType = cardTypeLineSplit[0].split(' ').map((e) => parseCardType(e)).toList();
    }

    if (cardTypeLineSplit.length > 1) {
      subType = cardTypeLineSplit[1].split(' ').map((e) => parseCardSubType(e)).toList();
    }

    return MTGCardTypeLine(cardType, subType);
  }
}
