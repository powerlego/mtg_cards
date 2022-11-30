import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/utils.dart';

class MTGCardType extends MTGField {
  static MTGCardType get unknown => MTGCardType('unknown', 'Unknown', 255);

  MTGCardType(String name, String display, int sortOrder) : super(name, display, sortOrder);

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

class MTGCardSupertype extends MTGCardType {
  static MTGCardSupertype get basic => MTGCardSupertype('basic', 'Basic', 0);
  static MTGCardSupertype get elite => MTGCardSupertype('elite', 'Elite', 1);
  static MTGCardSupertype get legendary => MTGCardSupertype('legendary', 'Legendary', 2);
  static MTGCardSupertype get ongoing => MTGCardSupertype('ongoing', 'Ongoing', 3);
  static MTGCardSupertype get snow => MTGCardSupertype('snow', 'Snow', 4);
  static MTGCardSupertype get token => MTGCardSupertype('token', 'Token', 5);
  static MTGCardSupertype get world => MTGCardSupertype('world', 'World', 6);
  static MTGCardSupertype get unknown => MTGCardSupertype('unknown', 'Unknown', 255);

  static List<MTGCardSupertype> get all => [
        basic,
        elite,
        legendary,
        ongoing,
        snow,
        token,
        world,
      ];

  static List<String> get allNames => [
        basic.name,
        elite.name,
        legendary.name,
        ongoing.name,
        snow.name,
        token.name,
        world.name,
      ];

  MTGCardSupertype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCardSupertype.fromJson(Map<String, dynamic> json) {
    return MTGCardSupertype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCardSupertype fromName(String name) {
    switch (name) {
      case 'basic':
        return basic;
      case 'elite':
        return elite;
      case 'legendary':
        return legendary;
      case 'ongoing':
        return ongoing;
      case 'snow':
        return snow;
      case 'token':
        return token;
      case 'world':
        return world;
      default:
        return unknown;
    }
  }

  static MTGCardSupertype fromDisplay(String display) {
    switch (display) {
      case 'Basic':
        return basic;
      case 'Elite':
        return elite;
      case 'Legendary':
        return legendary;
      case 'Ongoing':
        return ongoing;
      case 'Snow':
        return snow;
      case 'Token':
        return token;
      case 'World':
        return world;
      default:
        return unknown;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCardSupertype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  MTGCardType copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardSupertype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }
}

class MTGCardMainType extends MTGCardType {
  static MTGCardMainType get artifact => MTGCardMainType('artifact', 'Artifact', 0);
  static MTGCardMainType get conspiracy => MTGCardMainType('conspiracy', 'Conspiracy', 1);
  static MTGCardMainType get creature => MTGCardMainType('creature', 'Creature', 2);
  static MTGCardMainType get emblem => MTGCardMainType('emblem', 'Emblem', 3);
  static MTGCardMainType get enchantment => MTGCardMainType('enchantment', 'Enchantment', 4);
  static MTGCardMainType get hero => MTGCardMainType('hero', 'Hero', 5);
  static MTGCardMainType get instant => MTGCardMainType('instant', 'Instant', 6);
  static MTGCardMainType get land => MTGCardMainType('land', 'Land', 7);
  static MTGCardMainType get phenomenon => MTGCardMainType('phenomenon', 'Phenomenon', 8);
  static MTGCardMainType get plane => MTGCardMainType('plane', 'Plane', 9);
  static MTGCardMainType get planeswalker => MTGCardMainType('planeswalker', 'Planeswalker', 10);
  static MTGCardMainType get scheme => MTGCardMainType('scheme', 'Scheme', 11);
  static MTGCardMainType get sorcery => MTGCardMainType('sorcery', 'Sorcery', 12);
  static MTGCardMainType get tribal => MTGCardMainType('tribal', 'Tribal', 13);
  static MTGCardMainType get vanguard => MTGCardMainType('vanguard', 'Vanguard', 14);
  static MTGCardMainType get dungeon => MTGCardMainType('dungeon', 'Dungeon', 15);
  static MTGCardMainType get card => MTGCardMainType('card', 'Card', 16);
  static MTGCardMainType get unknown => MTGCardMainType('unknown', 'Unknown', 255);

  static List<MTGCardMainType> get all => [
        artifact,
        conspiracy,
        creature,
        emblem,
        enchantment,
        hero,
        instant,
        land,
        phenomenon,
        plane,
        planeswalker,
        scheme,
        sorcery,
        tribal,
        vanguard,
        dungeon,
        card,
      ];

  static List<String> get allNames => [
        artifact.name,
        conspiracy.name,
        creature.name,
        emblem.name,
        enchantment.name,
        hero.name,
        instant.name,
        land.name,
        phenomenon.name,
        plane.name,
        planeswalker.name,
        scheme.name,
        sorcery.name,
        tribal.name,
        vanguard.name,
        dungeon.name,
        card.name,
      ];

  MTGCardMainType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCardMainType.fromJson(Map<String, dynamic> json) {
    return MTGCardMainType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCardMainType fromName(String name) {
    switch (name) {
      case 'artifact':
        return artifact;
      case 'conspiracy':
        return conspiracy;
      case 'creature':
        return creature;
      case 'emblem':
        return emblem;
      case 'enchantment':
        return enchantment;
      case 'hero':
        return hero;
      case 'instant':
        return instant;
      case 'land':
        return land;
      case 'phenomenon':
        return phenomenon;
      case 'plane':
        return plane;
      case 'planeswalker':
        return planeswalker;
      case 'scheme':
        return scheme;
      case 'sorcery':
        return sorcery;
      case 'tribal':
        return tribal;
      case 'vanguard':
        return vanguard;
      case 'dungeon':
        return dungeon;
      case 'card':
        return card;
      default:
        return unknown;
    }
  }

  static MTGCardMainType fromDisplay(String display) {
    switch (display) {
      case 'Artifact':
        return artifact;
      case 'Conspiracy':
        return conspiracy;
      case 'Creature':
        return creature;
      case 'Emblem':
        return emblem;
      case 'Enchantment':
        return enchantment;
      case 'Hero':
        return hero;
      case 'Instant':
        return instant;
      case 'Land':
        return land;
      case 'Phenomenon':
        return phenomenon;
      case 'Plane':
        return plane;
      case 'Planeswalker':
        return planeswalker;
      case 'Scheme':
        return scheme;
      case 'Sorcery':
        return sorcery;
      case 'Tribal':
        return tribal;
      case 'Vanguard':
        return vanguard;
      case 'Dungeon':
        return dungeon;
      case 'Card':
        return card;
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
}

class MTGCardSubtype extends MTGField {
  static MTGCardSubtype get unknown => MTGCardSubtype('unknown', 'Unknown', 255);

  MTGCardSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCardSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCardSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGCreatureSubtype extends MTGCardSubtype {
  static MTGCreatureSubtype get advisor => MTGCreatureSubtype('advisor', 'Advisor', 0);
  static MTGCreatureSubtype get aetherborn => MTGCreatureSubtype('aetherborn', 'Aetherborn', 1);
  static MTGCreatureSubtype get alicorn => MTGCreatureSubtype('alicorn', 'Alicorn', 2);
  static MTGCreatureSubtype get alien => MTGCreatureSubtype('alien', 'Alien', 3);
  static MTGCreatureSubtype get ally => MTGCreatureSubtype('ally', 'Ally', 4);
  static MTGCreatureSubtype get angel => MTGCreatureSubtype('angel', 'Angel', 5);
  static MTGCreatureSubtype get antelope => MTGCreatureSubtype('antelope', 'Antelope', 6);
  static MTGCreatureSubtype get ape => MTGCreatureSubtype('ape', 'Ape', 7);
  static MTGCreatureSubtype get archer => MTGCreatureSubtype('archer', 'Archer', 8);
  static MTGCreatureSubtype get archon => MTGCreatureSubtype('archon', 'Archon', 9);
  static MTGCreatureSubtype get army => MTGCreatureSubtype('army', 'Army', 10);
  static MTGCreatureSubtype get art => MTGCreatureSubtype('art', 'Art', 11);
  static MTGCreatureSubtype get artificer => MTGCreatureSubtype('artificer', 'Artificer', 12);
  static MTGCreatureSubtype get assassin => MTGCreatureSubtype('assassin', 'Assassin', 13);
  static MTGCreatureSubtype get assemblyworker => MTGCreatureSubtype('assemblyworker', 'Assembly-Worker', 14);
  static MTGCreatureSubtype get astartes => MTGCreatureSubtype('astartes', 'Astartes', 15);
  static MTGCreatureSubtype get atog => MTGCreatureSubtype('atog', 'Atog', 16);
  static MTGCreatureSubtype get aurochs => MTGCreatureSubtype('aurochs', 'Aurochs', 17);
  static MTGCreatureSubtype get autobot => MTGCreatureSubtype('autobot', 'Autobot', 18);
  static MTGCreatureSubtype get avatar => MTGCreatureSubtype('avatar', 'Avatar', 19);
  static MTGCreatureSubtype get azra => MTGCreatureSubtype('azra', 'Azra', 20);
  static MTGCreatureSubtype get badger => MTGCreatureSubtype('badger', 'Badger', 21);
  static MTGCreatureSubtype get balloon => MTGCreatureSubtype('balloon', 'Balloon', 22);
  static MTGCreatureSubtype get barbarian => MTGCreatureSubtype('barbarian', 'Barbarian', 23);
  static MTGCreatureSubtype get bard => MTGCreatureSubtype('bard', 'Bard', 24);
  static MTGCreatureSubtype get basilisk => MTGCreatureSubtype('basilisk', 'Basilisk', 25);
  static MTGCreatureSubtype get bat => MTGCreatureSubtype('bat', 'Bat', 26);
  static MTGCreatureSubtype get bear => MTGCreatureSubtype('bear', 'Bear', 27);
  static MTGCreatureSubtype get beast => MTGCreatureSubtype('beast', 'Beast', 28);
  static MTGCreatureSubtype get beaver => MTGCreatureSubtype('beaver', 'Beaver', 29);
  static MTGCreatureSubtype get beeble => MTGCreatureSubtype('beeble', 'Beeble', 30);
  static MTGCreatureSubtype get beholder => MTGCreatureSubtype('beholder', 'Beholder', 31);
  static MTGCreatureSubtype get berserker => MTGCreatureSubtype('berserker', 'Berserker', 32);
  static MTGCreatureSubtype get bird => MTGCreatureSubtype('bird', 'Bird', 33);
  static MTGCreatureSubtype get blinkmoth => MTGCreatureSubtype('blinkmoth', 'Blinkmoth', 34);
  static MTGCreatureSubtype get boar => MTGCreatureSubtype('boar', 'Boar', 35);
  static MTGCreatureSubtype get brainiac => MTGCreatureSubtype('brainiac', 'Brainiac', 36);
  static MTGCreatureSubtype get bringer => MTGCreatureSubtype('bringer', 'Bringer', 37);
  static MTGCreatureSubtype get brushwagg => MTGCreatureSubtype('brushwagg', 'Brushwagg', 38);
  static MTGCreatureSubtype get bureaucrat => MTGCreatureSubtype('bureaucrat', 'Bureaucrat', 39);
  static MTGCreatureSubtype get ctan => MTGCreatureSubtype('ctan', 'C\'tan', 40);
  static MTGCreatureSubtype get camarid => MTGCreatureSubtype('camarid', 'Camarid', 41);
  static MTGCreatureSubtype get camel => MTGCreatureSubtype('camel', 'Camel', 42);
  static MTGCreatureSubtype get caribou => MTGCreatureSubtype('caribou', 'Caribou', 43);
  static MTGCreatureSubtype get carrier => MTGCreatureSubtype('carrier', 'Carrier', 44);
  static MTGCreatureSubtype get cat => MTGCreatureSubtype('cat', 'Cat', 45);
  static MTGCreatureSubtype get centaur => MTGCreatureSubtype('centaur', 'Centaur', 46);
  static MTGCreatureSubtype get cephalid => MTGCreatureSubtype('cephalid', 'Cephalid', 47);
  static MTGCreatureSubtype get chameleon => MTGCreatureSubtype('chameleon', 'Chameleon', 48);
  static MTGCreatureSubtype get chicken => MTGCreatureSubtype('chicken', 'Chicken', 49);
  static MTGCreatureSubtype get child => MTGCreatureSubtype('child', 'Child', 50);
  static MTGCreatureSubtype get chimera => MTGCreatureSubtype('chimera', 'Chimera', 51);
  static MTGCreatureSubtype get citizen => MTGCreatureSubtype('citizen', 'Citizen', 52);
  static MTGCreatureSubtype get clamfolk => MTGCreatureSubtype('clamfolk', 'Clamfolk', 53);
  static MTGCreatureSubtype get cleric => MTGCreatureSubtype('cleric', 'Cleric', 54);
  static MTGCreatureSubtype get clown => MTGCreatureSubtype('clown', 'Clown', 55);
  static MTGCreatureSubtype get cockatrice => MTGCreatureSubtype('cockatrice', 'Cockatrice', 56);
  static MTGCreatureSubtype get construct => MTGCreatureSubtype('construct', 'Construct', 57);
  static MTGCreatureSubtype get cow => MTGCreatureSubtype('cow', 'Cow', 58);
  static MTGCreatureSubtype get coward => MTGCreatureSubtype('coward', 'Coward', 59);
  static MTGCreatureSubtype get crab => MTGCreatureSubtype('crab', 'Crab', 60);
  static MTGCreatureSubtype get crocodile => MTGCreatureSubtype('crocodile', 'Crocodile', 61);
  static MTGCreatureSubtype get custodes => MTGCreatureSubtype('custodes', 'Custodes', 62);
  static MTGCreatureSubtype get cyborg => MTGCreatureSubtype('cyborg', 'Cyborg', 63);
  static MTGCreatureSubtype get cyclops => MTGCreatureSubtype('cyclops', 'Cyclops', 64);
  static MTGCreatureSubtype get dauthi => MTGCreatureSubtype('dauthi', 'Dauthi', 65);
  static MTGCreatureSubtype get deer => MTGCreatureSubtype('deer', 'Deer', 66);
  static MTGCreatureSubtype get demigod => MTGCreatureSubtype('demigod', 'Demigod', 67);
  static MTGCreatureSubtype get demon => MTGCreatureSubtype('demon', 'Demon', 68);
  static MTGCreatureSubtype get deserter => MTGCreatureSubtype('deserter', 'Deserter', 69);
  static MTGCreatureSubtype get designer => MTGCreatureSubtype('designer', 'Designer', 70);
  static MTGCreatureSubtype get devil => MTGCreatureSubtype('devil', 'Devil', 71);
  static MTGCreatureSubtype get dinosaur => MTGCreatureSubtype('dinosaur', 'Dinosaur', 72);
  static MTGCreatureSubtype get djinn => MTGCreatureSubtype('djinn', 'Djinn', 73);
  static MTGCreatureSubtype get dog => MTGCreatureSubtype('dog', 'Dog', 74);
  static MTGCreatureSubtype get donkey => MTGCreatureSubtype('donkey', 'Donkey', 75);
  static MTGCreatureSubtype get dragon => MTGCreatureSubtype('dragon', 'Dragon', 76);
  static MTGCreatureSubtype get drake => MTGCreatureSubtype('drake', 'Drake', 77);
  static MTGCreatureSubtype get dreadnought => MTGCreatureSubtype('dreadnought', 'Dreadnought', 78);
  static MTGCreatureSubtype get drone => MTGCreatureSubtype('drone', 'Drone', 79);
  static MTGCreatureSubtype get druid => MTGCreatureSubtype('druid', 'Druid', 80);
  static MTGCreatureSubtype get dryad => MTGCreatureSubtype('dryad', 'Dryad', 81);
  static MTGCreatureSubtype get dwarf => MTGCreatureSubtype('dwarf', 'Dwarf', 82);
  static MTGCreatureSubtype get efreet => MTGCreatureSubtype('efreet', 'Efreet', 83);
  static MTGCreatureSubtype get egg => MTGCreatureSubtype('egg', 'Egg', 84);
  static MTGCreatureSubtype get elder => MTGCreatureSubtype('elder', 'Elder', 85);
  static MTGCreatureSubtype get eldrazi => MTGCreatureSubtype('eldrazi', 'Eldrazi', 86);
  static MTGCreatureSubtype get elemental => MTGCreatureSubtype('elemental', 'Elemental', 87);
  static MTGCreatureSubtype get elementalQuestion => MTGCreatureSubtype('elementalQuestion', 'Elemental?', 88);
  static MTGCreatureSubtype get elephant => MTGCreatureSubtype('elephant', 'Elephant', 89);
  static MTGCreatureSubtype get elf => MTGCreatureSubtype('elf', 'Elf', 90);
  static MTGCreatureSubtype get elk => MTGCreatureSubtype('elk', 'Elk', 91);
  static MTGCreatureSubtype get elves => MTGCreatureSubtype('elves', 'Elves', 92);
  static MTGCreatureSubtype get employee => MTGCreatureSubtype('employee', 'Employee', 93);
  static MTGCreatureSubtype get etiquette => MTGCreatureSubtype('etiquette', 'Etiquette', 94);
  static MTGCreatureSubtype get eye => MTGCreatureSubtype('eye', 'Eye', 95);
  static MTGCreatureSubtype get faerie => MTGCreatureSubtype('faerie', 'Faerie', 96);
  static MTGCreatureSubtype get ferret => MTGCreatureSubtype('ferret', 'Ferret', 97);
  static MTGCreatureSubtype get fish => MTGCreatureSubtype('fish', 'Fish', 98);
  static MTGCreatureSubtype get flagbearer => MTGCreatureSubtype('flagbearer', 'Flagbearer', 99);
  static MTGCreatureSubtype get fox => MTGCreatureSubtype('fox', 'Fox', 100);
  static MTGCreatureSubtype get fractal => MTGCreatureSubtype('fractal', 'Fractal', 101);
  static MTGCreatureSubtype get frog => MTGCreatureSubtype('frog', 'Frog', 102);
  static MTGCreatureSubtype get fungus => MTGCreatureSubtype('fungus', 'Fungus', 103);
  static MTGCreatureSubtype get gamer => MTGCreatureSubtype('gamer', 'Gamer', 104);
  static MTGCreatureSubtype get gargoyle => MTGCreatureSubtype('gargoyle', 'Gargoyle', 105);
  static MTGCreatureSubtype get germ => MTGCreatureSubtype('germ', 'Germ', 106);
  static MTGCreatureSubtype get giant => MTGCreatureSubtype('giant', 'Giant', 107);
  static MTGCreatureSubtype get gith => MTGCreatureSubtype('gith', 'Gith', 108);
  static MTGCreatureSubtype get gnoll => MTGCreatureSubtype('gnoll', 'Gnoll', 109);
  static MTGCreatureSubtype get gnome => MTGCreatureSubtype('gnome', 'Gnome', 110);
  static MTGCreatureSubtype get goat => MTGCreatureSubtype('goat', 'Goat', 111);
  static MTGCreatureSubtype get goblin => MTGCreatureSubtype('goblin', 'Goblin', 112);
  static MTGCreatureSubtype get god => MTGCreatureSubtype('god', 'God', 113);
  static MTGCreatureSubtype get golem => MTGCreatureSubtype('golem', 'Golem', 114);
  static MTGCreatureSubtype get gorgon => MTGCreatureSubtype('gorgon', 'Gorgon', 115);
  static MTGCreatureSubtype get grandchild => MTGCreatureSubtype('grandchild', 'Grandchild', 116);
  static MTGCreatureSubtype get graveborn => MTGCreatureSubtype('graveborn', 'Graveborn', 117);
  static MTGCreatureSubtype get gremlin => MTGCreatureSubtype('gremlin', 'Gremlin', 118);
  static MTGCreatureSubtype get griffin => MTGCreatureSubtype('griffin', 'Griffin', 119);
  static MTGCreatureSubtype get guest => MTGCreatureSubtype('guest', 'Guest', 120);
  static MTGCreatureSubtype get gus => MTGCreatureSubtype('gus', 'Gus', 121);
  static MTGCreatureSubtype get hag => MTGCreatureSubtype('hag', 'Hag', 122);
  static MTGCreatureSubtype get halfling => MTGCreatureSubtype('halfling', 'Halfling', 123);
  static MTGCreatureSubtype get hamster => MTGCreatureSubtype('hamster', 'Hamster', 124);
  static MTGCreatureSubtype get harpy => MTGCreatureSubtype('harpy', 'Harpy', 125);
  static MTGCreatureSubtype get hatificer => MTGCreatureSubtype('hatificer', 'Hatificer', 126);
  static MTGCreatureSubtype get head => MTGCreatureSubtype('head', 'Head', 127);
  static MTGCreatureSubtype get hellion => MTGCreatureSubtype('hellion', 'Hellion', 128);
  static MTGCreatureSubtype get hero => MTGCreatureSubtype('hero', 'Hero', 129);
  static MTGCreatureSubtype get hippo => MTGCreatureSubtype('hippo', 'Hippo', 130);
  static MTGCreatureSubtype get hippogriff => MTGCreatureSubtype('hippogriff', 'Hippogriff', 131);
  static MTGCreatureSubtype get homarid => MTGCreatureSubtype('homarid', 'Homarid', 132);
  static MTGCreatureSubtype get homunculus => MTGCreatureSubtype('homunculus', 'Homunculus', 133);
  static MTGCreatureSubtype get hornet => MTGCreatureSubtype('hornet', 'Hornet', 134);
  static MTGCreatureSubtype get horror => MTGCreatureSubtype('horror', 'Horror', 135);
  static MTGCreatureSubtype get horse => MTGCreatureSubtype('horse', 'Horse', 136);
  static MTGCreatureSubtype get human => MTGCreatureSubtype('human', 'Human', 137);
  static MTGCreatureSubtype get hydra => MTGCreatureSubtype('hydra', 'Hydra', 138);
  static MTGCreatureSubtype get hyena => MTGCreatureSubtype('hyena', 'Hyena', 139);
  static MTGCreatureSubtype get illusion => MTGCreatureSubtype('illusion', 'Illusion', 140);
  static MTGCreatureSubtype get imp => MTGCreatureSubtype('imp', 'Imp', 141);
  static MTGCreatureSubtype get incarnation => MTGCreatureSubtype('incarnation', 'Incarnation', 142);
  static MTGCreatureSubtype get inkling => MTGCreatureSubtype('inkling', 'Inkling', 143);
  static MTGCreatureSubtype get inquisitor => MTGCreatureSubtype('inquisitor', 'Inquisitor', 144);
  static MTGCreatureSubtype get insect => MTGCreatureSubtype('insect', 'Insect', 145);
  static MTGCreatureSubtype get jackal => MTGCreatureSubtype('jackal', 'Jackal', 146);
  static MTGCreatureSubtype get jellyfish => MTGCreatureSubtype('jellyfish', 'Jellyfish', 147);
  static MTGCreatureSubtype get juggernaut => MTGCreatureSubtype('juggernaut', 'Juggernaut', 148);
  static MTGCreatureSubtype get kangaroo => MTGCreatureSubtype('kangaroo', 'Kangaroo', 149);
  static MTGCreatureSubtype get kavu => MTGCreatureSubtype('kavu', 'Kavu', 150);
  static MTGCreatureSubtype get killbot => MTGCreatureSubtype('killbot', 'Killbot', 151);
  static MTGCreatureSubtype get kirin => MTGCreatureSubtype('kirin', 'Kirin', 152);
  static MTGCreatureSubtype get kithkin => MTGCreatureSubtype('kithkin', 'Kithkin', 153);
  static MTGCreatureSubtype get knight => MTGCreatureSubtype('knight', 'Knight', 154);
  static MTGCreatureSubtype get kobold => MTGCreatureSubtype('kobold', 'Kobold', 155);
  static MTGCreatureSubtype get kor => MTGCreatureSubtype('kor', 'Kor', 156);
  static MTGCreatureSubtype get kraken => MTGCreatureSubtype('kraken', 'Kraken', 157);
  static MTGCreatureSubtype get lady => MTGCreatureSubtype('lady', 'Lady', 158);
  static MTGCreatureSubtype get lamia => MTGCreatureSubtype('lamia', 'Lamia', 159);
  static MTGCreatureSubtype get lammasu => MTGCreatureSubtype('lammasu', 'Lammasu', 160);
  static MTGCreatureSubtype get leech => MTGCreatureSubtype('leech', 'Leech', 161);
  static MTGCreatureSubtype get leviathan => MTGCreatureSubtype('leviathan', 'Leviathan', 162);
  static MTGCreatureSubtype get lhurgoyf => MTGCreatureSubtype('lhurgoyf', 'Lhurgoyf', 163);
  static MTGCreatureSubtype get licid => MTGCreatureSubtype('licid', 'Licid', 164);
  static MTGCreatureSubtype get lizard => MTGCreatureSubtype('lizard', 'Lizard', 165);
  static MTGCreatureSubtype get lobster => MTGCreatureSubtype('lobster', 'Lobster', 166);
  static MTGCreatureSubtype get mammoth => MTGCreatureSubtype('mammoth', 'Mammoth', 167);
  static MTGCreatureSubtype get manticore => MTGCreatureSubtype('manticore', 'Manticore', 168);
  static MTGCreatureSubtype get masticore => MTGCreatureSubtype('masticore', 'Masticore', 169);
  static MTGCreatureSubtype get mercenary => MTGCreatureSubtype('mercenary', 'Mercenary', 170);
  static MTGCreatureSubtype get merfolk => MTGCreatureSubtype('merfolk', 'Merfolk', 171);
  static MTGCreatureSubtype get metathran => MTGCreatureSubtype('metathran', 'Metathran', 172);
  static MTGCreatureSubtype get mime => MTGCreatureSubtype('mime', 'Mime', 173);
  static MTGCreatureSubtype get minion => MTGCreatureSubtype('minion', 'Minion', 174);
  static MTGCreatureSubtype get minotaur => MTGCreatureSubtype('minotaur', 'Minotaur', 175);
  static MTGCreatureSubtype get mole => MTGCreatureSubtype('mole', 'Mole', 176);
  static MTGCreatureSubtype get monger => MTGCreatureSubtype('monger', 'Monger', 177);
  static MTGCreatureSubtype get mongoose => MTGCreatureSubtype('mongoose', 'Mongoose', 178);
  static MTGCreatureSubtype get monk => MTGCreatureSubtype('monk', 'Monk', 179);
  static MTGCreatureSubtype get monkey => MTGCreatureSubtype('monkey', 'Monkey', 180);
  static MTGCreatureSubtype get moonfolk => MTGCreatureSubtype('moonfolk', 'Moonfolk', 181);
  static MTGCreatureSubtype get mouse => MTGCreatureSubtype('mouse', 'Mouse', 182);
  static MTGCreatureSubtype get mummy => MTGCreatureSubtype('mummy', 'Mummy', 183);
  static MTGCreatureSubtype get mutant => MTGCreatureSubtype('mutant', 'Mutant', 184);
  static MTGCreatureSubtype get myr => MTGCreatureSubtype('myr', 'Myr', 185);
  static MTGCreatureSubtype get mystic => MTGCreatureSubtype('mystic', 'Mystic', 186);
  static MTGCreatureSubtype get naga => MTGCreatureSubtype('naga', 'Naga', 187);
  static MTGCreatureSubtype get nautilus => MTGCreatureSubtype('nautilus', 'Nautilus', 188);
  static MTGCreatureSubtype get necron => MTGCreatureSubtype('necron', 'Necron', 189);
  static MTGCreatureSubtype get nephilim => MTGCreatureSubtype('nephilim', 'Nephilim', 190);
  static MTGCreatureSubtype get nightmare => MTGCreatureSubtype('nightmare', 'Nightmare', 191);
  static MTGCreatureSubtype get nightstalker => MTGCreatureSubtype('nightstalker', 'Nightstalker', 192);
  static MTGCreatureSubtype get ninja => MTGCreatureSubtype('ninja', 'Ninja', 193);
  static MTGCreatureSubtype get noble => MTGCreatureSubtype('noble', 'Noble', 194);
  static MTGCreatureSubtype get noggle => MTGCreatureSubtype('noggle', 'Noggle', 195);
  static MTGCreatureSubtype get nomad => MTGCreatureSubtype('nomad', 'Nomad', 196);
  static MTGCreatureSubtype get nymph => MTGCreatureSubtype('nymph', 'Nymph', 197);
  static MTGCreatureSubtype get octopus => MTGCreatureSubtype('octopus', 'Octopus', 198);
  static MTGCreatureSubtype get ogre => MTGCreatureSubtype('ogre', 'Ogre', 199);
  static MTGCreatureSubtype get ooze => MTGCreatureSubtype('ooze', 'Ooze', 200);
  static MTGCreatureSubtype get orb => MTGCreatureSubtype('orb', 'Orb', 201);
  static MTGCreatureSubtype get orc => MTGCreatureSubtype('orc', 'Orc', 202);
  static MTGCreatureSubtype get orgg => MTGCreatureSubtype('orgg', 'Orgg', 203);
  static MTGCreatureSubtype get otter => MTGCreatureSubtype('otter', 'Otter', 204);
  static MTGCreatureSubtype get ouphe => MTGCreatureSubtype('ouphe', 'Ouphe', 205);
  static MTGCreatureSubtype get ox => MTGCreatureSubtype('ox', 'Ox', 206);
  static MTGCreatureSubtype get oyster => MTGCreatureSubtype('oyster', 'Oyster', 207);
  static MTGCreatureSubtype get pangolin => MTGCreatureSubtype('pangolin', 'Pangolin', 208);
  static MTGCreatureSubtype get paratrooper => MTGCreatureSubtype('paratrooper', 'Paratrooper', 209);
  static MTGCreatureSubtype get peasant => MTGCreatureSubtype('peasant', 'Peasant', 210);
  static MTGCreatureSubtype get pegasus => MTGCreatureSubtype('pegasus', 'Pegasus', 211);
  static MTGCreatureSubtype get pentavite => MTGCreatureSubtype('pentavite', 'Pentavite', 212);
  static MTGCreatureSubtype get performer => MTGCreatureSubtype('performer', 'Performer', 213);
  static MTGCreatureSubtype get pest => MTGCreatureSubtype('pest', 'Pest', 214);
  static MTGCreatureSubtype get phelddagrif => MTGCreatureSubtype('phelddagrif', 'Phelddagrif', 215);
  static MTGCreatureSubtype get phoenix => MTGCreatureSubtype('phoenix', 'Phoenix', 216);
  static MTGCreatureSubtype get phyrexian => MTGCreatureSubtype('phyrexian', 'Phyrexian', 217);
  static MTGCreatureSubtype get pilot => MTGCreatureSubtype('pilot', 'Pilot', 218);
  static MTGCreatureSubtype get pincher => MTGCreatureSubtype('pincher', 'Pincher', 219);
  static MTGCreatureSubtype get pirate => MTGCreatureSubtype('pirate', 'Pirate', 220);
  static MTGCreatureSubtype get plant => MTGCreatureSubtype('plant', 'Plant', 221);
  static MTGCreatureSubtype get porcupine => MTGCreatureSubtype('porcupine', 'Porcupine', 222);
  static MTGCreatureSubtype get praetor => MTGCreatureSubtype('praetor', 'Praetor', 223);
  static MTGCreatureSubtype get primarch => MTGCreatureSubtype('primarch', 'Primarch', 224);
  static MTGCreatureSubtype get prism => MTGCreatureSubtype('prism', 'Prism', 225);
  static MTGCreatureSubtype get processor => MTGCreatureSubtype('processor', 'Processor', 226);
  static MTGCreatureSubtype get proper => MTGCreatureSubtype('proper', 'Proper', 227);
  static MTGCreatureSubtype get rabbit => MTGCreatureSubtype('rabbit', 'Rabbit', 228);
  static MTGCreatureSubtype get raccoon => MTGCreatureSubtype('raccoon', 'Raccoon', 229);
  static MTGCreatureSubtype get ranger => MTGCreatureSubtype('ranger', 'Ranger', 230);
  static MTGCreatureSubtype get rat => MTGCreatureSubtype('rat', 'Rat', 231);
  static MTGCreatureSubtype get rebel => MTGCreatureSubtype('rebel', 'Rebel', 232);
  static MTGCreatureSubtype get reflection => MTGCreatureSubtype('reflection', 'Reflection', 233);
  static MTGCreatureSubtype get reveler => MTGCreatureSubtype('reveler', 'Reveler', 234);
  static MTGCreatureSubtype get rhino => MTGCreatureSubtype('rhino', 'Rhino', 235);
  static MTGCreatureSubtype get rigger => MTGCreatureSubtype('rigger', 'Rigger', 236);
  static MTGCreatureSubtype get robot => MTGCreatureSubtype('robot', 'Robot', 237);
  static MTGCreatureSubtype get rogue => MTGCreatureSubtype('rogue', 'Rogue', 238);
  static MTGCreatureSubtype get sable => MTGCreatureSubtype('sable', 'Sable', 239);
  static MTGCreatureSubtype get salamander => MTGCreatureSubtype('salamander', 'Salamander', 240);
  static MTGCreatureSubtype get samurai => MTGCreatureSubtype('samurai', 'Samurai', 241);
  static MTGCreatureSubtype get sand => MTGCreatureSubtype('sand', 'Sand', 242);
  static MTGCreatureSubtype get saproling => MTGCreatureSubtype('saproling', 'Saproling', 243);
  static MTGCreatureSubtype get satyr => MTGCreatureSubtype('satyr', 'Satyr', 244);
  static MTGCreatureSubtype get scarecrow => MTGCreatureSubtype('scarecrow', 'Scarecrow', 245);
  static MTGCreatureSubtype get scientist => MTGCreatureSubtype('scientist', 'Scientist', 246);
  static MTGCreatureSubtype get scion => MTGCreatureSubtype('scion', 'Scion', 247);
  static MTGCreatureSubtype get scorpion => MTGCreatureSubtype('scorpion', 'Scorpion', 248);
  static MTGCreatureSubtype get scout => MTGCreatureSubtype('scout', 'Scout', 249);
  static MTGCreatureSubtype get sculpture => MTGCreatureSubtype('sculpture', 'Sculpture', 250);
  static MTGCreatureSubtype get serf => MTGCreatureSubtype('serf', 'Serf', 251);
  static MTGCreatureSubtype get serpent => MTGCreatureSubtype('serpent', 'Serpent', 252);
  static MTGCreatureSubtype get servo => MTGCreatureSubtype('servo', 'Servo', 253);
  static MTGCreatureSubtype get shade => MTGCreatureSubtype('shade', 'Shade', 254);
  static MTGCreatureSubtype get shaman => MTGCreatureSubtype('shaman', 'Shaman', 255);
  static MTGCreatureSubtype get shapeshifter => MTGCreatureSubtype('shapeshifter', 'Shapeshifter', 256);
  static MTGCreatureSubtype get shark => MTGCreatureSubtype('shark', 'Shark', 257);
  static MTGCreatureSubtype get sheep => MTGCreatureSubtype('sheep', 'Sheep', 258);
  static MTGCreatureSubtype get ship => MTGCreatureSubtype('ship', 'Ship', 259);
  static MTGCreatureSubtype get siren => MTGCreatureSubtype('siren', 'Siren', 260);
  static MTGCreatureSubtype get skeleton => MTGCreatureSubtype('skeleton', 'Skeleton', 261);
  static MTGCreatureSubtype get slith => MTGCreatureSubtype('slith', 'Slith', 262);
  static MTGCreatureSubtype get sliver => MTGCreatureSubtype('sliver', 'Sliver', 263);
  static MTGCreatureSubtype get slug => MTGCreatureSubtype('slug', 'Slug', 264);
  static MTGCreatureSubtype get snake => MTGCreatureSubtype('snake', 'Snake', 265);
  static MTGCreatureSubtype get soldier => MTGCreatureSubtype('soldier', 'Soldier', 266);
  static MTGCreatureSubtype get soltari => MTGCreatureSubtype('soltari', 'Soltari', 267);
  static MTGCreatureSubtype get spawn => MTGCreatureSubtype('spawn', 'Spawn', 268);
  static MTGCreatureSubtype get specter => MTGCreatureSubtype('specter', 'Specter', 269);
  static MTGCreatureSubtype get spellshaper => MTGCreatureSubtype('spellshaper', 'Spellshaper', 270);
  static MTGCreatureSubtype get sphinx => MTGCreatureSubtype('sphinx', 'Sphinx', 271);
  static MTGCreatureSubtype get spider => MTGCreatureSubtype('spider', 'Spider', 272);
  static MTGCreatureSubtype get spike => MTGCreatureSubtype('spike', 'Spike', 273);
  static MTGCreatureSubtype get spirit => MTGCreatureSubtype('spirit', 'Spirit', 274);
  static MTGCreatureSubtype get splinter => MTGCreatureSubtype('splinter', 'Splinter', 275);
  static MTGCreatureSubtype get sponge => MTGCreatureSubtype('sponge', 'Sponge', 276);
  static MTGCreatureSubtype get spy => MTGCreatureSubtype('spy', 'Spy', 277);
  static MTGCreatureSubtype get squid => MTGCreatureSubtype('squid', 'Squid', 278);
  static MTGCreatureSubtype get squirrel => MTGCreatureSubtype('squirrel', 'Squirrel', 279);
  static MTGCreatureSubtype get starfish => MTGCreatureSubtype('starfish', 'Starfish', 280);
  static MTGCreatureSubtype get surrakar => MTGCreatureSubtype('surrakar', 'Surrakar', 281);
  static MTGCreatureSubtype get survivor => MTGCreatureSubtype('survivor', 'Survivor', 282);
  static MTGCreatureSubtype get teddy => MTGCreatureSubtype('teddy', 'Teddy', 283);
  static MTGCreatureSubtype get tentacle => MTGCreatureSubtype('tentacle', 'Tentacle', 284);
  static MTGCreatureSubtype get tetravite => MTGCreatureSubtype('tetravite', 'Tetravite', 285);
  static MTGCreatureSubtype get thalakos => MTGCreatureSubtype('thalakos', 'Thalakos', 286);
  static MTGCreatureSubtype get the => MTGCreatureSubtype('the', 'The', 287);
  static MTGCreatureSubtype get thopter => MTGCreatureSubtype('thopter', 'Thopter', 288);
  static MTGCreatureSubtype get thrull => MTGCreatureSubtype('thrull', 'Thrull', 289);
  static MTGCreatureSubtype get tiefling => MTGCreatureSubtype('tiefling', 'Tiefling', 290);
  static MTGCreatureSubtype get townsfolk => MTGCreatureSubtype('townsfolk', 'Townsfolk', 291);
  static MTGCreatureSubtype get treefolk => MTGCreatureSubtype('treefolk', 'Treefolk', 292);
  static MTGCreatureSubtype get trilobite => MTGCreatureSubtype('trilobite', 'Trilobite', 293);
  static MTGCreatureSubtype get triskelavite => MTGCreatureSubtype('triskelavite', 'Triskelavite', 294);
  static MTGCreatureSubtype get troll => MTGCreatureSubtype('troll', 'Troll', 295);
  static MTGCreatureSubtype get turtle => MTGCreatureSubtype('turtle', 'Turtle', 296);
  static MTGCreatureSubtype get tyranid => MTGCreatureSubtype('tyranid', 'Tyranid', 297);
  static MTGCreatureSubtype get unicorn => MTGCreatureSubtype('unicorn', 'Unicorn', 298);
  static MTGCreatureSubtype get vampire => MTGCreatureSubtype('vampire', 'Vampire', 299);
  static MTGCreatureSubtype get vampyre => MTGCreatureSubtype('vampyre', 'Vampyre', 300);
  static MTGCreatureSubtype get vedalken => MTGCreatureSubtype('vedalken', 'Vedalken', 301);
  static MTGCreatureSubtype get viashino => MTGCreatureSubtype('viashino', 'Viashino', 302);
  static MTGCreatureSubtype get villain => MTGCreatureSubtype('villain', 'Villain', 303);
  static MTGCreatureSubtype get volver => MTGCreatureSubtype('volver', 'Volver', 304);
  static MTGCreatureSubtype get waiter => MTGCreatureSubtype('waiter', 'Waiter', 305);
  static MTGCreatureSubtype get wall => MTGCreatureSubtype('wall', 'Wall', 306);
  static MTGCreatureSubtype get walrus => MTGCreatureSubtype('walrus', 'Walrus', 307);
  static MTGCreatureSubtype get warlock => MTGCreatureSubtype('warlock', 'Warlock', 308);
  static MTGCreatureSubtype get warrior => MTGCreatureSubtype('warrior', 'Warrior', 309);
  static MTGCreatureSubtype get wasp => MTGCreatureSubtype('wasp', 'Wasp', 310);
  static MTGCreatureSubtype get weird => MTGCreatureSubtype('weird', 'Weird', 311);
  static MTGCreatureSubtype get werewolf => MTGCreatureSubtype('werewolf', 'Werewolf', 312);
  static MTGCreatureSubtype get whale => MTGCreatureSubtype('whale', 'Whale', 313);
  static MTGCreatureSubtype get wizard => MTGCreatureSubtype('wizard', 'Wizard', 314);
  static MTGCreatureSubtype get wolf => MTGCreatureSubtype('wolf', 'Wolf', 315);
  static MTGCreatureSubtype get wolverine => MTGCreatureSubtype('wolverine', 'Wolverine', 316);
  static MTGCreatureSubtype get wombat => MTGCreatureSubtype('wombat', 'Wombat', 317);
  static MTGCreatureSubtype get worm => MTGCreatureSubtype('worm', 'Worm', 318);
  static MTGCreatureSubtype get wraith => MTGCreatureSubtype('wraith', 'Wraith', 319);
  static MTGCreatureSubtype get wrestler => MTGCreatureSubtype('wrestler', 'Wrestler', 320);
  static MTGCreatureSubtype get wurm => MTGCreatureSubtype('wurm', 'Wurm', 321);
  static MTGCreatureSubtype get yeti => MTGCreatureSubtype('yeti', 'Yeti', 322);
  static MTGCreatureSubtype get zombie => MTGCreatureSubtype('zombie', 'Zombie', 323);
  static MTGCreatureSubtype get zubera => MTGCreatureSubtype('zubera', 'Zubera', 324);

  static MTGCreatureSubtype get unknown => MTGCreatureSubtype('unknown', 'Unknown', 65535);

  static List<MTGCreatureSubtype> get all => [
        advisor,
        aetherborn,
        alicorn,
        alien,
        ally,
        angel,
        antelope,
        ape,
        archer,
        archon,
        army,
        art,
        artificer,
        assassin,
        assemblyworker,
        astartes,
        atog,
        aurochs,
        autobot,
        avatar,
        azra,
        badger,
        balloon,
        barbarian,
        bard,
        basilisk,
        bat,
        bear,
        beast,
        beaver,
        beeble,
        beholder,
        berserker,
        bird,
        blinkmoth,
        boar,
        brainiac,
        bringer,
        brushwagg,
        bureaucrat,
        ctan,
        camarid,
        camel,
        caribou,
        carrier,
        cat,
        centaur,
        cephalid,
        chameleon,
        chicken,
        child,
        chimera,
        citizen,
        clamfolk,
        cleric,
        clown,
        cockatrice,
        construct,
        cow,
        coward,
        crab,
        crocodile,
        custodes,
        cyborg,
        cyclops,
        dauthi,
        deer,
        demigod,
        demon,
        deserter,
        designer,
        devil,
        dinosaur,
        djinn,
        dog,
        donkey,
        dragon,
        drake,
        dreadnought,
        drone,
        druid,
        dryad,
        dwarf,
        efreet,
        egg,
        elder,
        eldrazi,
        elemental,
        elementalQuestion,
        elephant,
        elf,
        elk,
        elves,
        employee,
        etiquette,
        eye,
        faerie,
        ferret,
        fish,
        flagbearer,
        fox,
        fractal,
        frog,
        fungus,
        gamer,
        gargoyle,
        germ,
        giant,
        gith,
        gnoll,
        gnome,
        goat,
        goblin,
        god,
        golem,
        gorgon,
        grandchild,
        graveborn,
        gremlin,
        griffin,
        guest,
        gus,
        hag,
        halfling,
        hamster,
        harpy,
        hatificer,
        head,
        hellion,
        hero,
        hippo,
        hippogriff,
        homarid,
        homunculus,
        hornet,
        horror,
        horse,
        human,
        hydra,
        hyena,
        illusion,
        imp,
        incarnation,
        inkling,
        inquisitor,
        insect,
        jackal,
        jellyfish,
        juggernaut,
        kangaroo,
        kavu,
        killbot,
        kirin,
        kithkin,
        knight,
        kobold,
        kor,
        kraken,
        lady,
        lamia,
        lammasu,
        leech,
        leviathan,
        lhurgoyf,
        licid,
        lizard,
        lobster,
        mammoth,
        manticore,
        masticore,
        mercenary,
        merfolk,
        metathran,
        mime,
        minion,
        minotaur,
        mole,
        monger,
        mongoose,
        monk,
        monkey,
        moonfolk,
        mouse,
        mummy,
        mutant,
        myr,
        mystic,
        naga,
        nautilus,
        necron,
        nephilim,
        nightmare,
        nightstalker,
        ninja,
        noble,
        noggle,
        nomad,
        nymph,
        octopus,
        ogre,
        ooze,
        orb,
        orc,
        orgg,
        otter,
        ouphe,
        ox,
        oyster,
        pangolin,
        paratrooper,
        peasant,
        pegasus,
        pentavite,
        performer,
        pest,
        phelddagrif,
        phoenix,
        phyrexian,
        pilot,
        pincher,
        pirate,
        plant,
        porcupine,
        praetor,
        primarch,
        prism,
        processor,
        proper,
        rabbit,
        raccoon,
        ranger,
        rat,
        rebel,
        reflection,
        reveler,
        rhino,
        rigger,
        robot,
        rogue,
        sable,
        salamander,
        samurai,
        sand,
        saproling,
        satyr,
        scarecrow,
        scientist,
        scion,
        scorpion,
        scout,
        sculpture,
        serf,
        serpent,
        servo,
        shade,
        shaman,
        shapeshifter,
        shark,
        sheep,
        ship,
        siren,
        skeleton,
        slith,
        sliver,
        slug,
        snake,
        soldier,
        soltari,
        spawn,
        specter,
        spellshaper,
        sphinx,
        spider,
        spike,
        spirit,
        splinter,
        sponge,
        spy,
        squid,
        squirrel,
        starfish,
        surrakar,
        survivor,
        teddy,
        tentacle,
        tetravite,
        thalakos,
        the,
        thopter,
        thrull,
        tiefling,
        townsfolk,
        treefolk,
        trilobite,
        triskelavite,
        troll,
        turtle,
        tyranid,
        unicorn,
        vampire,
        vampyre,
        vedalken,
        viashino,
        villain,
        volver,
        waiter,
        wall,
        walrus,
        warlock,
        warrior,
        wasp,
        weird,
        werewolf,
        whale,
        wizard,
        wolf,
        wolverine,
        wombat,
        worm,
        wraith,
        wrestler,
        wurm,
        yeti,
        zombie,
        zubera,
      ];

  static List<String> get allNames => [
        advisor.name,
        aetherborn.name,
        alicorn.name,
        alien.name,
        ally.name,
        angel.name,
        antelope.name,
        ape.name,
        archer.name,
        archon.name,
        army.name,
        art.name,
        artificer.name,
        assassin.name,
        assemblyworker.name,
        astartes.name,
        atog.name,
        aurochs.name,
        autobot.name,
        avatar.name,
        azra.name,
        badger.name,
        balloon.name,
        barbarian.name,
        bard.name,
        basilisk.name,
        bat.name,
        bear.name,
        beast.name,
        beaver.name,
        beeble.name,
        beholder.name,
        berserker.name,
        bird.name,
        blinkmoth.name,
        boar.name,
        brainiac.name,
        bringer.name,
        brushwagg.name,
        bureaucrat.name,
        ctan.name,
        camarid.name,
        camel.name,
        caribou.name,
        carrier.name,
        cat.name,
        centaur.name,
        cephalid.name,
        chameleon.name,
        chicken.name,
        child.name,
        chimera.name,
        citizen.name,
        clamfolk.name,
        cleric.name,
        clown.name,
        cockatrice.name,
        construct.name,
        cow.name,
        coward.name,
        crab.name,
        crocodile.name,
        custodes.name,
        cyborg.name,
        cyclops.name,
        dauthi.name,
        deer.name,
        demigod.name,
        demon.name,
        deserter.name,
        designer.name,
        devil.name,
        dinosaur.name,
        djinn.name,
        dog.name,
        donkey.name,
        dragon.name,
        drake.name,
        dreadnought.name,
        drone.name,
        druid.name,
        dryad.name,
        dwarf.name,
        efreet.name,
        egg.name,
        elder.name,
        eldrazi.name,
        elemental.name,
        elementalQuestion.name,
        elephant.name,
        elf.name,
        elk.name,
        elves.name,
        employee.name,
        etiquette.name,
        eye.name,
        faerie.name,
        ferret.name,
        fish.name,
        flagbearer.name,
        fox.name,
        fractal.name,
        frog.name,
        fungus.name,
        gamer.name,
        gargoyle.name,
        germ.name,
        giant.name,
        gith.name,
        gnoll.name,
        gnome.name,
        goat.name,
        goblin.name,
        god.name,
        golem.name,
        gorgon.name,
        grandchild.name,
        graveborn.name,
        gremlin.name,
        griffin.name,
        guest.name,
        gus.name,
        hag.name,
        halfling.name,
        hamster.name,
        harpy.name,
        hatificer.name,
        head.name,
        hellion.name,
        hero.name,
        hippo.name,
        hippogriff.name,
        homarid.name,
        homunculus.name,
        hornet.name,
        horror.name,
        horse.name,
        human.name,
        hydra.name,
        hyena.name,
        illusion.name,
        imp.name,
        incarnation.name,
        inkling.name,
        inquisitor.name,
        insect.name,
        jackal.name,
        jellyfish.name,
        juggernaut.name,
        kangaroo.name,
        kavu.name,
        killbot.name,
        kirin.name,
        kithkin.name,
        knight.name,
        kobold.name,
        kor.name,
        kraken.name,
        lady.name,
        lamia.name,
        lammasu.name,
        leech.name,
        leviathan.name,
        lhurgoyf.name,
        licid.name,
        lizard.name,
        lobster.name,
        mammoth.name,
        manticore.name,
        masticore.name,
        mercenary.name,
        merfolk.name,
        metathran.name,
        mime.name,
        minion.name,
        minotaur.name,
        mole.name,
        monger.name,
        mongoose.name,
        monk.name,
        monkey.name,
        moonfolk.name,
        mouse.name,
        mummy.name,
        mutant.name,
        myr.name,
        mystic.name,
        naga.name,
        nautilus.name,
        necron.name,
        nephilim.name,
        nightmare.name,
        nightstalker.name,
        ninja.name,
        noble.name,
        noggle.name,
        nomad.name,
        nymph.name,
        octopus.name,
        ogre.name,
        ooze.name,
        orb.name,
        orc.name,
        orgg.name,
        otter.name,
        ouphe.name,
        ox.name,
        oyster.name,
        pangolin.name,
        paratrooper.name,
        peasant.name,
        pegasus.name,
        pentavite.name,
        performer.name,
        pest.name,
        phelddagrif.name,
        phoenix.name,
        phyrexian.name,
        pilot.name,
        pincher.name,
        pirate.name,
        plant.name,
        porcupine.name,
        praetor.name,
        primarch.name,
        prism.name,
        processor.name,
        proper.name,
        rabbit.name,
        raccoon.name,
        ranger.name,
        rat.name,
        rebel.name,
        reflection.name,
        reveler.name,
        rhino.name,
        rigger.name,
        robot.name,
        rogue.name,
        sable.name,
        salamander.name,
        samurai.name,
        sand.name,
        saproling.name,
        satyr.name,
        scarecrow.name,
        scientist.name,
        scion.name,
        scorpion.name,
        scout.name,
        sculpture.name,
        serf.name,
        serpent.name,
        servo.name,
        shade.name,
        shaman.name,
        shapeshifter.name,
        shark.name,
        sheep.name,
        ship.name,
        siren.name,
        skeleton.name,
        slith.name,
        sliver.name,
        slug.name,
        snake.name,
        soldier.name,
        soltari.name,
        spawn.name,
        specter.name,
        spellshaper.name,
        sphinx.name,
        spider.name,
        spike.name,
        spirit.name,
        splinter.name,
        sponge.name,
        spy.name,
        squid.name,
        squirrel.name,
        starfish.name,
        surrakar.name,
        survivor.name,
        teddy.name,
        tentacle.name,
        tetravite.name,
        thalakos.name,
        the.name,
        thopter.name,
        thrull.name,
        tiefling.name,
        townsfolk.name,
        treefolk.name,
        trilobite.name,
        triskelavite.name,
        troll.name,
        turtle.name,
        tyranid.name,
        unicorn.name,
        vampire.name,
        vampyre.name,
        vedalken.name,
        viashino.name,
        villain.name,
        volver.name,
        waiter.name,
        wall.name,
        walrus.name,
        warlock.name,
        warrior.name,
        wasp.name,
        weird.name,
        werewolf.name,
        whale.name,
        wizard.name,
        wolf.name,
        wolverine.name,
        wombat.name,
        worm.name,
        wraith.name,
        wrestler.name,
        wurm.name,
        yeti.name,
        zombie.name,
        zubera.name,
      ];

  MTGCreatureSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCreatureSubtype.fromJson(Map<String, dynamic> json) {
    return MTGCreatureSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGCreatureSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  static MTGCreatureSubtype fromName(String subType) {
    switch (subType) {
      case 'advisor':
        return advisor;
      case 'aetherborn':
        return aetherborn;
      case 'alicorn':
        return alicorn;
      case 'alien':
        return alien;
      case 'ally':
        return ally;
      case 'angel':
        return angel;
      case 'antelope':
        return antelope;
      case 'ape':
        return ape;
      case 'archer':
        return archer;
      case 'archon':
        return archon;
      case 'army':
        return army;
      case 'art':
        return art;
      case 'artificer':
        return artificer;
      case 'assassin':
        return assassin;
      case 'assemblyworker':
        return assemblyworker;
      case 'astartes':
        return astartes;
      case 'atog':
        return atog;
      case 'aurochs':
        return aurochs;
      case 'autobot':
        return autobot;
      case 'avatar':
        return avatar;
      case 'azra':
        return azra;
      case 'badger':
        return badger;
      case 'balloon':
        return balloon;
      case 'barbarian':
        return barbarian;
      case 'bard':
        return bard;
      case 'basilisk':
        return basilisk;
      case 'bat':
        return bat;
      case 'bear':
        return bear;
      case 'beast':
        return beast;
      case 'beaver':
        return beaver;
      case 'beeble':
        return beeble;
      case 'beholder':
        return beholder;
      case 'berserker':
        return berserker;
      case 'bird':
        return bird;
      case 'blinkmoth':
        return blinkmoth;
      case 'boar':
        return boar;
      case 'brainiac':
        return brainiac;
      case 'bringer':
        return bringer;
      case 'brushwagg':
        return brushwagg;
      case 'bureaucrat':
        return bureaucrat;
      case 'ctan':
        return ctan;
      case 'camarid':
        return camarid;
      case 'camel':
        return camel;
      case 'caribou':
        return caribou;
      case 'carrier':
        return carrier;
      case 'cat':
        return cat;
      case 'centaur':
        return centaur;
      case 'cephalid':
        return cephalid;
      case 'chameleon':
        return chameleon;
      case 'chicken':
        return chicken;
      case 'child':
        return child;
      case 'chimera':
        return chimera;
      case 'citizen':
        return citizen;
      case 'clamfolk':
        return clamfolk;
      case 'cleric':
        return cleric;
      case 'clown':
        return clown;
      case 'cockatrice':
        return cockatrice;
      case 'construct':
        return construct;
      case 'cow':
        return cow;
      case 'coward':
        return coward;
      case 'crab':
        return crab;
      case 'crocodile':
        return crocodile;
      case 'custodes':
        return custodes;
      case 'cyborg':
        return cyborg;
      case 'cyclops':
        return cyclops;
      case 'dauthi':
        return dauthi;
      case 'deer':
        return deer;
      case 'demigod':
        return demigod;
      case 'demon':
        return demon;
      case 'deserter':
        return deserter;
      case 'designer':
        return designer;
      case 'devil':
        return devil;
      case 'dinosaur':
        return dinosaur;
      case 'djinn':
        return djinn;
      case 'dog':
        return dog;
      case 'donkey':
        return donkey;
      case 'dragon':
        return dragon;
      case 'drake':
        return drake;
      case 'dreadnought':
        return dreadnought;
      case 'drone':
        return drone;
      case 'druid':
        return druid;
      case 'dryad':
        return dryad;
      case 'dwarf':
        return dwarf;
      case 'efreet':
        return efreet;
      case 'egg':
        return egg;
      case 'elder':
        return elder;
      case 'eldrazi':
        return eldrazi;
      case 'elemental':
        return elemental;
      case 'elementalQuestion':
        return elementalQuestion;
      case 'elephant':
        return elephant;
      case 'elf':
        return elf;
      case 'elk':
        return elk;
      case 'elves':
        return elves;
      case 'employee':
        return employee;
      case 'etiquette':
        return etiquette;
      case 'eye':
        return eye;
      case 'faerie':
        return faerie;
      case 'ferret':
        return ferret;
      case 'fish':
        return fish;
      case 'flagbearer':
        return flagbearer;
      case 'fox':
        return fox;
      case 'fractal':
        return fractal;
      case 'frog':
        return frog;
      case 'fungus':
        return fungus;
      case 'gamer':
        return gamer;
      case 'gargoyle':
        return gargoyle;
      case 'germ':
        return germ;
      case 'giant':
        return giant;
      case 'gith':
        return gith;
      case 'gnoll':
        return gnoll;
      case 'gnome':
        return gnome;
      case 'goat':
        return goat;
      case 'goblin':
        return goblin;
      case 'god':
        return god;
      case 'golem':
        return golem;
      case 'gorgon':
        return gorgon;
      case 'grandchild':
        return grandchild;
      case 'graveborn':
        return graveborn;
      case 'gremlin':
        return gremlin;
      case 'griffin':
        return griffin;
      case 'guest':
        return guest;
      case 'gus':
        return gus;
      case 'hag':
        return hag;
      case 'halfling':
        return halfling;
      case 'hamster':
        return hamster;
      case 'harpy':
        return harpy;
      case 'hatificer':
        return hatificer;
      case 'head':
        return head;
      case 'hellion':
        return hellion;
      case 'hero':
        return hero;
      case 'hippo':
        return hippo;
      case 'hippogriff':
        return hippogriff;
      case 'homarid':
        return homarid;
      case 'homunculus':
        return homunculus;
      case 'hornet':
        return hornet;
      case 'horror':
        return horror;
      case 'horse':
        return horse;
      case 'human':
        return human;
      case 'hydra':
        return hydra;
      case 'hyena':
        return hyena;
      case 'illusion':
        return illusion;
      case 'imp':
        return imp;
      case 'incarnation':
        return incarnation;
      case 'inkling':
        return inkling;
      case 'inquisitor':
        return inquisitor;
      case 'insect':
        return insect;
      case 'jackal':
        return jackal;
      case 'jellyfish':
        return jellyfish;
      case 'juggernaut':
        return juggernaut;
      case 'kangaroo':
        return kangaroo;
      case 'kavu':
        return kavu;
      case 'killbot':
        return killbot;
      case 'kirin':
        return kirin;
      case 'kithkin':
        return kithkin;
      case 'knight':
        return knight;
      case 'kobold':
        return kobold;
      case 'kor':
        return kor;
      case 'kraken':
        return kraken;
      case 'lady':
        return lady;
      case 'lamia':
        return lamia;
      case 'lammasu':
        return lammasu;
      case 'leech':
        return leech;
      case 'leviathan':
        return leviathan;
      case 'lhurgoyf':
        return lhurgoyf;
      case 'licid':
        return licid;
      case 'lizard':
        return lizard;
      case 'lobster':
        return lobster;
      case 'mammoth':
        return mammoth;
      case 'manticore':
        return manticore;
      case 'masticore':
        return masticore;
      case 'mercenary':
        return mercenary;
      case 'merfolk':
        return merfolk;
      case 'metathran':
        return metathran;
      case 'mime':
        return mime;
      case 'minion':
        return minion;
      case 'minotaur':
        return minotaur;
      case 'mole':
        return mole;
      case 'monger':
        return monger;
      case 'mongoose':
        return mongoose;
      case 'monk':
        return monk;
      case 'monkey':
        return monkey;
      case 'moonfolk':
        return moonfolk;
      case 'mouse':
        return mouse;
      case 'mummy':
        return mummy;
      case 'mutant':
        return mutant;
      case 'myr':
        return myr;
      case 'mystic':
        return mystic;
      case 'naga':
        return naga;
      case 'nautilus':
        return nautilus;
      case 'necron':
        return necron;
      case 'nephilim':
        return nephilim;
      case 'nightmare':
        return nightmare;
      case 'nightstalker':
        return nightstalker;
      case 'ninja':
        return ninja;
      case 'noble':
        return noble;
      case 'noggle':
        return noggle;
      case 'nomad':
        return nomad;
      case 'nymph':
        return nymph;
      case 'octopus':
        return octopus;
      case 'ogre':
        return ogre;
      case 'ooze':
        return ooze;
      case 'orb':
        return orb;
      case 'orc':
        return orc;
      case 'orgg':
        return orgg;
      case 'otter':
        return otter;
      case 'ouphe':
        return ouphe;
      case 'ox':
        return ox;
      case 'oyster':
        return oyster;
      case 'pangolin':
        return pangolin;
      case 'paratrooper':
        return paratrooper;
      case 'peasant':
        return peasant;
      case 'pegasus':
        return pegasus;
      case 'pentavite':
        return pentavite;
      case 'performer':
        return performer;
      case 'pest':
        return pest;
      case 'phelddagrif':
        return phelddagrif;
      case 'phoenix':
        return phoenix;
      case 'phyrexian':
        return phyrexian;
      case 'pilot':
        return pilot;
      case 'pincher':
        return pincher;
      case 'pirate':
        return pirate;
      case 'plant':
        return plant;
      case 'porcupine':
        return porcupine;
      case 'praetor':
        return praetor;
      case 'primarch':
        return primarch;
      case 'prism':
        return prism;
      case 'processor':
        return processor;
      case 'proper':
        return proper;
      case 'rabbit':
        return rabbit;
      case 'raccoon':
        return raccoon;
      case 'ranger':
        return ranger;
      case 'rat':
        return rat;
      case 'rebel':
        return rebel;
      case 'reflection':
        return reflection;
      case 'reveler':
        return reveler;
      case 'rhino':
        return rhino;
      case 'rigger':
        return rigger;
      case 'robot':
        return robot;
      case 'rogue':
        return rogue;
      case 'sable':
        return sable;
      case 'salamander':
        return salamander;
      case 'samurai':
        return samurai;
      case 'sand':
        return sand;
      case 'saproling':
        return saproling;
      case 'satyr':
        return satyr;
      case 'scarecrow':
        return scarecrow;
      case 'scientist':
        return scientist;
      case 'scion':
        return scion;
      case 'scorpion':
        return scorpion;
      case 'scout':
        return scout;
      case 'sculpture':
        return sculpture;
      case 'serf':
        return serf;
      case 'serpent':
        return serpent;
      case 'servo':
        return servo;
      case 'shade':
        return shade;
      case 'shaman':
        return shaman;
      case 'shapeshifter':
        return shapeshifter;
      case 'shark':
        return shark;
      case 'sheep':
        return sheep;
      case 'ship':
        return ship;
      case 'siren':
        return siren;
      case 'skeleton':
        return skeleton;
      case 'slith':
        return slith;
      case 'sliver':
        return sliver;
      case 'slug':
        return slug;
      case 'snake':
        return snake;
      case 'soldier':
        return soldier;
      case 'soltari':
        return soltari;
      case 'spawn':
        return spawn;
      case 'specter':
        return specter;
      case 'spellshaper':
        return spellshaper;
      case 'sphinx':
        return sphinx;
      case 'spider':
        return spider;
      case 'spike':
        return spike;
      case 'spirit':
        return spirit;
      case 'splinter':
        return splinter;
      case 'sponge':
        return sponge;
      case 'spy':
        return spy;
      case 'squid':
        return squid;
      case 'squirrel':
        return squirrel;
      case 'starfish':
        return starfish;
      case 'surrakar':
        return surrakar;
      case 'survivor':
        return survivor;
      case 'teddy':
        return teddy;
      case 'tentacle':
        return tentacle;
      case 'tetravite':
        return tetravite;
      case 'thalakos':
        return thalakos;
      case 'the':
        return the;
      case 'thopter':
        return thopter;
      case 'thrull':
        return thrull;
      case 'tiefling':
        return tiefling;
      case 'townsfolk':
        return townsfolk;
      case 'treefolk':
        return treefolk;
      case 'trilobite':
        return trilobite;
      case 'triskelavite':
        return triskelavite;
      case 'troll':
        return troll;
      case 'turtle':
        return turtle;
      case 'tyranid':
        return tyranid;
      case 'unicorn':
        return unicorn;
      case 'vampire':
        return vampire;
      case 'vampyre':
        return vampyre;
      case 'vedalken':
        return vedalken;
      case 'viashino':
        return viashino;
      case 'villain':
        return villain;
      case 'volver':
        return volver;
      case 'waiter':
        return waiter;
      case 'wall':
        return wall;
      case 'walrus':
        return walrus;
      case 'warlock':
        return warlock;
      case 'warrior':
        return warrior;
      case 'wasp':
        return wasp;
      case 'weird':
        return weird;
      case 'werewolf':
        return werewolf;
      case 'whale':
        return whale;
      case 'wizard':
        return wizard;
      case 'wolf':
        return wolf;
      case 'wolverine':
        return wolverine;
      case 'wombat':
        return wombat;
      case 'worm':
        return worm;
      case 'wraith':
        return wraith;
      case 'wrestler':
        return wrestler;
      case 'wurm':
        return wurm;
      case 'yeti':
        return yeti;
      case 'zombie':
        return zombie;
      case 'zubera':
        return zubera;
      default:
        return unknown;
    }
  }

  static MTGCreatureSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Advisor':
        return advisor;
      case 'Aetherborn':
        return aetherborn;
      case 'Alicorn':
        return alicorn;
      case 'Alien':
        return alien;
      case 'Ally':
        return ally;
      case 'Angel':
        return angel;
      case 'Antelope':
        return antelope;
      case 'Ape':
        return ape;
      case 'Archer':
        return archer;
      case 'Archon':
        return archon;
      case 'Army':
        return army;
      case 'Art':
        return art;
      case 'Artificer':
        return artificer;
      case 'Assassin':
        return assassin;
      case 'Assembly-Worker':
        return assemblyworker;
      case 'Astartes':
        return astartes;
      case 'Atog':
        return atog;
      case 'Aurochs':
        return aurochs;
      case 'Autobot':
        return autobot;
      case 'Avatar':
        return avatar;
      case 'Azra':
        return azra;
      case 'Badger':
        return badger;
      case 'Balloon':
        return balloon;
      case 'Barbarian':
        return barbarian;
      case 'Bard':
        return bard;
      case 'Basilisk':
        return basilisk;
      case 'Bat':
        return bat;
      case 'Bear':
        return bear;
      case 'Beast':
        return beast;
      case 'Beaver':
        return beaver;
      case 'Beeble':
        return beeble;
      case 'Beholder':
        return beholder;
      case 'Berserker':
        return berserker;
      case 'Bird':
        return bird;
      case 'Blinkmoth':
        return blinkmoth;
      case 'Boar':
        return boar;
      case 'Brainiac':
        return brainiac;
      case 'Bringer':
        return bringer;
      case 'Brushwagg':
        return brushwagg;
      case 'Bureaucrat':
        return bureaucrat;
      case 'C\'tan':
        return ctan;
      case 'Camarid':
        return camarid;
      case 'Camel':
        return camel;
      case 'Caribou':
        return caribou;
      case 'Carrier':
        return carrier;
      case 'Cat':
        return cat;
      case 'Centaur':
        return centaur;
      case 'Cephalid':
        return cephalid;
      case 'Chameleon':
        return chameleon;
      case 'Chicken':
        return chicken;
      case 'Child':
        return child;
      case 'Chimera':
        return chimera;
      case 'Citizen':
        return citizen;
      case 'Clamfolk':
        return clamfolk;
      case 'Cleric':
        return cleric;
      case 'Clown':
        return clown;
      case 'Cockatrice':
        return cockatrice;
      case 'Construct':
        return construct;
      case 'Cow':
        return cow;
      case 'Coward':
        return coward;
      case 'Crab':
        return crab;
      case 'Crocodile':
        return crocodile;
      case 'Custodes':
        return custodes;
      case 'Cyborg':
        return cyborg;
      case 'Cyclops':
        return cyclops;
      case 'Dauthi':
        return dauthi;
      case 'Deer':
        return deer;
      case 'Demigod':
        return demigod;
      case 'Demon':
        return demon;
      case 'Deserter':
        return deserter;
      case 'Designer':
        return designer;
      case 'Devil':
        return devil;
      case 'Dinosaur':
        return dinosaur;
      case 'Djinn':
        return djinn;
      case 'Dog':
        return dog;
      case 'Donkey':
        return donkey;
      case 'Dragon':
        return dragon;
      case 'Drake':
        return drake;
      case 'Dreadnought':
        return dreadnought;
      case 'Drone':
        return drone;
      case 'Druid':
        return druid;
      case 'Dryad':
        return dryad;
      case 'Dwarf':
        return dwarf;
      case 'Efreet':
        return efreet;
      case 'Egg':
        return egg;
      case 'Elder':
        return elder;
      case 'Eldrazi':
        return eldrazi;
      case 'Elemental':
        return elemental;
      case 'Elemental?':
        return elementalQuestion;
      case 'Elephant':
        return elephant;
      case 'Elf':
        return elf;
      case 'Elk':
        return elk;
      case 'Elves':
        return elves;
      case 'Employee':
        return employee;
      case 'Etiquette':
        return etiquette;
      case 'Eye':
        return eye;
      case 'Faerie':
        return faerie;
      case 'Ferret':
        return ferret;
      case 'Fish':
        return fish;
      case 'Flagbearer':
        return flagbearer;
      case 'Fox':
        return fox;
      case 'Fractal':
        return fractal;
      case 'Frog':
        return frog;
      case 'Fungus':
        return fungus;
      case 'Gamer':
        return gamer;
      case 'Gargoyle':
        return gargoyle;
      case 'Germ':
        return germ;
      case 'Giant':
        return giant;
      case 'Gith':
        return gith;
      case 'Gnoll':
        return gnoll;
      case 'Gnome':
        return gnome;
      case 'Goat':
        return goat;
      case 'Goblin':
        return goblin;
      case 'God':
        return god;
      case 'Golem':
        return golem;
      case 'Gorgon':
        return gorgon;
      case 'Grandchild':
        return grandchild;
      case 'Graveborn':
        return graveborn;
      case 'Gremlin':
        return gremlin;
      case 'Griffin':
        return griffin;
      case 'Guest':
        return guest;
      case 'Gus':
        return gus;
      case 'Hag':
        return hag;
      case 'Halfling':
        return halfling;
      case 'Hamster':
        return hamster;
      case 'Harpy':
        return harpy;
      case 'Hatificer':
        return hatificer;
      case 'Head':
        return head;
      case 'Hellion':
        return hellion;
      case 'Hero':
        return hero;
      case 'Hippo':
        return hippo;
      case 'Hippogriff':
        return hippogriff;
      case 'Homarid':
        return homarid;
      case 'Homunculus':
        return homunculus;
      case 'Hornet':
        return hornet;
      case 'Horror':
        return horror;
      case 'Horse':
        return horse;
      case 'Human':
        return human;
      case 'Hydra':
        return hydra;
      case 'Hyena':
        return hyena;
      case 'Illusion':
        return illusion;
      case 'Imp':
        return imp;
      case 'Incarnation':
        return incarnation;
      case 'Inkling':
        return inkling;
      case 'Inquisitor':
        return inquisitor;
      case 'Insect':
        return insect;
      case 'Jackal':
        return jackal;
      case 'Jellyfish':
        return jellyfish;
      case 'Juggernaut':
        return juggernaut;
      case 'Kangaroo':
        return kangaroo;
      case 'Kavu':
        return kavu;
      case 'Killbot':
        return killbot;
      case 'Kirin':
        return kirin;
      case 'Kithkin':
        return kithkin;
      case 'Knight':
        return knight;
      case 'Kobold':
        return kobold;
      case 'Kor':
        return kor;
      case 'Kraken':
        return kraken;
      case 'Lady':
        return lady;
      case 'Lamia':
        return lamia;
      case 'Lammasu':
        return lammasu;
      case 'Leech':
        return leech;
      case 'Leviathan':
        return leviathan;
      case 'Lhurgoyf':
        return lhurgoyf;
      case 'Licid':
        return licid;
      case 'Lizard':
        return lizard;
      case 'Lobster':
        return lobster;
      case 'Mammoth':
        return mammoth;
      case 'Manticore':
        return manticore;
      case 'Masticore':
        return masticore;
      case 'Mercenary':
        return mercenary;
      case 'Merfolk':
        return merfolk;
      case 'Metathran':
        return metathran;
      case 'Mime':
        return mime;
      case 'Minion':
        return minion;
      case 'Minotaur':
        return minotaur;
      case 'Mole':
        return mole;
      case 'Monger':
        return monger;
      case 'Mongoose':
        return mongoose;
      case 'Monk':
        return monk;
      case 'Monkey':
        return monkey;
      case 'Moonfolk':
        return moonfolk;
      case 'Mouse':
        return mouse;
      case 'Mummy':
        return mummy;
      case 'Mutant':
        return mutant;
      case 'Myr':
        return myr;
      case 'Mystic':
        return mystic;
      case 'Naga':
        return naga;
      case 'Nautilus':
        return nautilus;
      case 'Necron':
        return necron;
      case 'Nephilim':
        return nephilim;
      case 'Nightmare':
        return nightmare;
      case 'Nightstalker':
        return nightstalker;
      case 'Ninja':
        return ninja;
      case 'Noble':
        return noble;
      case 'Noggle':
        return noggle;
      case 'Nomad':
        return nomad;
      case 'Nymph':
        return nymph;
      case 'Octopus':
        return octopus;
      case 'Ogre':
        return ogre;
      case 'Ooze':
        return ooze;
      case 'Orb':
        return orb;
      case 'Orc':
        return orc;
      case 'Orgg':
        return orgg;
      case 'Otter':
        return otter;
      case 'Ouphe':
        return ouphe;
      case 'Ox':
        return ox;
      case 'Oyster':
        return oyster;
      case 'Pangolin':
        return pangolin;
      case 'Paratrooper':
        return paratrooper;
      case 'Peasant':
        return peasant;
      case 'Pegasus':
        return pegasus;
      case 'Pentavite':
        return pentavite;
      case 'Performer':
        return performer;
      case 'Pest':
        return pest;
      case 'Phelddagrif':
        return phelddagrif;
      case 'Phoenix':
        return phoenix;
      case 'Phyrexian':
        return phyrexian;
      case 'Pilot':
        return pilot;
      case 'Pincher':
        return pincher;
      case 'Pirate':
        return pirate;
      case 'Plant':
        return plant;
      case 'Porcupine':
        return porcupine;
      case 'Praetor':
        return praetor;
      case 'Primarch':
        return primarch;
      case 'Prism':
        return prism;
      case 'Processor':
        return processor;
      case 'Proper':
        return proper;
      case 'Rabbit':
        return rabbit;
      case 'Raccoon':
        return raccoon;
      case 'Ranger':
        return ranger;
      case 'Rat':
        return rat;
      case 'Rebel':
        return rebel;
      case 'Reflection':
        return reflection;
      case 'Reveler':
        return reveler;
      case 'Rhino':
        return rhino;
      case 'Rigger':
        return rigger;
      case 'Robot':
        return robot;
      case 'Rogue':
        return rogue;
      case 'Sable':
        return sable;
      case 'Salamander':
        return salamander;
      case 'Samurai':
        return samurai;
      case 'Sand':
        return sand;
      case 'Saproling':
        return saproling;
      case 'Satyr':
        return satyr;
      case 'Scarecrow':
        return scarecrow;
      case 'Scientist':
        return scientist;
      case 'Scion':
        return scion;
      case 'Scorpion':
        return scorpion;
      case 'Scout':
        return scout;
      case 'Sculpture':
        return sculpture;
      case 'Serf':
        return serf;
      case 'Serpent':
        return serpent;
      case 'Servo':
        return servo;
      case 'Shade':
        return shade;
      case 'Shaman':
        return shaman;
      case 'Shapeshifter':
        return shapeshifter;
      case 'Shark':
        return shark;
      case 'Sheep':
        return sheep;
      case 'Ship':
        return ship;
      case 'Siren':
        return siren;
      case 'Skeleton':
        return skeleton;
      case 'Slith':
        return slith;
      case 'Sliver':
        return sliver;
      case 'Slug':
        return slug;
      case 'Snake':
        return snake;
      case 'Soldier':
        return soldier;
      case 'Soltari':
        return soltari;
      case 'Spawn':
        return spawn;
      case 'Specter':
        return specter;
      case 'Spellshaper':
        return spellshaper;
      case 'Sphinx':
        return sphinx;
      case 'Spider':
        return spider;
      case 'Spike':
        return spike;
      case 'Spirit':
        return spirit;
      case 'Splinter':
        return splinter;
      case 'Sponge':
        return sponge;
      case 'Spy':
        return spy;
      case 'Squid':
        return squid;
      case 'Squirrel':
        return squirrel;
      case 'Starfish':
        return starfish;
      case 'Surrakar':
        return surrakar;
      case 'Survivor':
        return survivor;
      case 'Teddy':
        return teddy;
      case 'Tentacle':
        return tentacle;
      case 'Tetravite':
        return tetravite;
      case 'Thalakos':
        return thalakos;
      case 'The':
        return the;
      case 'Thopter':
        return thopter;
      case 'Thrull':
        return thrull;
      case 'Tiefling':
        return tiefling;
      case 'Townsfolk':
        return townsfolk;
      case 'Treefolk':
        return treefolk;
      case 'Trilobite':
        return trilobite;
      case 'Triskelavite':
        return triskelavite;
      case 'Troll':
        return troll;
      case 'Turtle':
        return turtle;
      case 'Tyranid':
        return tyranid;
      case 'Unicorn':
        return unicorn;
      case 'Vampire':
        return vampire;
      case 'Vampyre':
        return vampyre;
      case 'Vedalken':
        return vedalken;
      case 'Viashino':
        return viashino;
      case 'Villain':
        return villain;
      case 'Volver':
        return volver;
      case 'Waiter':
        return waiter;
      case 'Wall':
        return wall;
      case 'Walrus':
        return walrus;
      case 'Warlock':
        return warlock;
      case 'Warrior':
        return warrior;
      case 'Wasp':
        return wasp;
      case 'Weird':
        return weird;
      case 'Werewolf':
        return werewolf;
      case 'Whale':
        return whale;
      case 'Wizard':
        return wizard;
      case 'Wolf':
        return wolf;
      case 'Wolverine':
        return wolverine;
      case 'Wombat':
        return wombat;
      case 'Worm':
        return worm;
      case 'Wraith':
        return wraith;
      case 'Wrestler':
        return wrestler;
      case 'Wurm':
        return wurm;
      case 'Yeti':
        return yeti;
      case 'Zombie':
        return zombie;
      case 'Zubera':
        return zubera;
      default:
        return unknown;
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGCreatureSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGEnchantmentSubtype extends MTGCardSubtype {
  static MTGEnchantmentSubtype get aura => MTGEnchantmentSubtype('aura', 'Aura', 0);
  static MTGEnchantmentSubtype get background => MTGEnchantmentSubtype('background', 'Background', 1);
  static MTGEnchantmentSubtype get cartouche => MTGEnchantmentSubtype('cartouche', 'Cartouche', 2);
  static MTGEnchantmentSubtype get class_ => MTGEnchantmentSubtype('class', 'Class', 3);
  static MTGEnchantmentSubtype get curse => MTGEnchantmentSubtype('curse', 'Curse', 4);
  static MTGEnchantmentSubtype get rune => MTGEnchantmentSubtype('rune', 'Rune', 5);
  static MTGEnchantmentSubtype get saga => MTGEnchantmentSubtype('saga', 'Saga', 6);
  static MTGEnchantmentSubtype get shard => MTGEnchantmentSubtype('shard', 'Shard', 7);
  static MTGEnchantmentSubtype get shrine => MTGEnchantmentSubtype('shrine', 'Shrine', 8);
  static MTGEnchantmentSubtype get unknown => MTGEnchantmentSubtype('unknown', 'Unknown', 255);

  static List<MTGEnchantmentSubtype> get all => [
        aura,
        background,
        cartouche,
        class_,
        curse,
        rune,
        saga,
        shard,
        shrine,
      ];

  static List<String> get allNames => [
        aura.name,
        background.name,
        cartouche.name,
        class_.name,
        curse.name,
        rune.name,
        saga.name,
        shard.name,
        shrine.name,
      ];

  MTGEnchantmentSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGEnchantmentSubtype.fromJson(Map<String, dynamic> json) {
    return MTGEnchantmentSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGEnchantmentSubtype fromName(String subType) {
    switch (subType) {
      case 'aura':
        return aura;
      case 'background':
        return background;
      case 'cartouche':
        return cartouche;
      case 'class':
        return class_;
      case 'curse':
        return curse;
      case 'rune':
        return rune;
      case 'saga':
        return saga;
      case 'shard':
        return shard;
      case 'shrine':
        return shrine;
      default:
        return unknown;
    }
  }

  static MTGEnchantmentSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Aura':
        return aura;
      case 'Background':
        return background;
      case 'Cartouche':
        return cartouche;
      case 'Class':
        return class_;
      case 'Curse':
        return curse;
      case 'Rune':
        return rune;
      case 'Saga':
        return saga;
      case 'Shard':
        return shard;
      case 'Shrine':
        return shrine;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGEnchantmentSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGEnchantmentSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGLandSubtype extends MTGCardSubtype {
  static MTGLandSubtype get desert => MTGLandSubtype('desert', 'Desert', 0);
  static MTGLandSubtype get forest => MTGLandSubtype('forest', 'Forest', 1);
  static MTGLandSubtype get gate => MTGLandSubtype('gate', 'Gate', 2);
  static MTGLandSubtype get island => MTGLandSubtype('island', 'Island', 3);
  static MTGLandSubtype get lair => MTGLandSubtype('lair', 'Lair', 4);
  static MTGLandSubtype get locus => MTGLandSubtype('locus', 'Locus', 5);
  static MTGLandSubtype get mine => MTGLandSubtype('mine', 'Mine', 6);
  static MTGLandSubtype get mountain => MTGLandSubtype('mountain', 'Mountain', 7);
  static MTGLandSubtype get plains => MTGLandSubtype('plains', 'Plains', 8);
  static MTGLandSubtype get powerplant => MTGLandSubtype('powerplant', 'Power-Plant', 9);
  static MTGLandSubtype get swamp => MTGLandSubtype('swamp', 'Swamp', 10);
  static MTGLandSubtype get tower => MTGLandSubtype('tower', 'Tower', 11);
  static MTGLandSubtype get urzas => MTGLandSubtype('urzas', 'Urza\'s', 12);
  static MTGLandSubtype get unknown => MTGLandSubtype('unknown', 'Unknown', 255);

  static List<MTGLandSubtype> get all => [
        desert,
        forest,
        gate,
        island,
        lair,
        locus,
        mine,
        mountain,
        plains,
        powerplant,
        swamp,
        tower,
        urzas,
      ];

  static List<String> get allNames => [
        desert.name,
        forest.name,
        gate.name,
        island.name,
        lair.name,
        locus.name,
        mine.name,
        mountain.name,
        plains.name,
        powerplant.name,
        swamp.name,
        tower.name,
        urzas.name,
      ];

  MTGLandSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGLandSubtype.fromJson(Map<String, dynamic> json) {
    return MTGLandSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGLandSubtype fromName(String subType) {
    switch (subType) {
      case 'desert':
        return desert;
      case 'forest':
        return forest;
      case 'gate':
        return gate;
      case 'island':
        return island;
      case 'lair':
        return lair;
      case 'locus':
        return locus;
      case 'mine':
        return mine;
      case 'mountain':
        return mountain;
      case 'plains':
        return plains;
      case 'powerplant':
        return powerplant;
      case 'swamp':
        return swamp;
      case 'tower':
        return tower;
      case 'urzas':
        return urzas;
      default:
        return unknown;
    }
  }

  static MTGLandSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Desert':
        return desert;
      case 'Forest':
        return forest;
      case 'Gate':
        return gate;
      case 'Island':
        return island;
      case 'Lair':
        return lair;
      case 'Locus':
        return locus;
      case 'Mine':
        return mine;
      case 'Mountain':
        return mountain;
      case 'Plains':
        return plains;
      case 'Power-Plant':
        return powerplant;
      case 'Swamp':
        return swamp;
      case 'Tower':
        return tower;
      case 'Urza\'s':
        return urzas;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGLandSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGLandSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGArtifactSubtype extends MTGCardSubtype {
  static MTGArtifactSubtype get attraction => MTGArtifactSubtype('attraction', 'Attraction', 0);
  static MTGArtifactSubtype get blood => MTGArtifactSubtype('blood', 'Blood', 1);
  static MTGArtifactSubtype get clue => MTGArtifactSubtype('clue', 'Clue', 2);
  static MTGArtifactSubtype get contraption => MTGArtifactSubtype('contraption', 'Contraption', 3);
  static MTGArtifactSubtype get equipment => MTGArtifactSubtype('equipment', 'Equipment', 4);
  static MTGArtifactSubtype get food => MTGArtifactSubtype('food', 'Food', 5);
  static MTGArtifactSubtype get fortification => MTGArtifactSubtype('fortification', 'Fortification', 6);
  static MTGArtifactSubtype get gold => MTGArtifactSubtype('gold', 'Gold', 7);
  static MTGArtifactSubtype get powerstone => MTGArtifactSubtype('powerstone', 'Powerstone', 8);
  static MTGArtifactSubtype get treasure => MTGArtifactSubtype('treasure', 'Treasure', 9);
  static MTGArtifactSubtype get vehicle => MTGArtifactSubtype('vehicle', 'Vehicle', 10);
  static MTGArtifactSubtype get unknown => MTGArtifactSubtype('unknown', 'Unknown', 255);

  static List<MTGArtifactSubtype> get all => [
        attraction,
        blood,
        clue,
        contraption,
        equipment,
        food,
        fortification,
        gold,
        powerstone,
        treasure,
        vehicle,
      ];

  static List<String> get allNames => [
        attraction.name,
        blood.name,
        clue.name,
        contraption.name,
        equipment.name,
        food.name,
        fortification.name,
        gold.name,
        powerstone.name,
        treasure.name,
        vehicle.name,
      ];

  MTGArtifactSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGArtifactSubtype.fromJson(Map<String, dynamic> json) {
    return MTGArtifactSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGArtifactSubtype fromName(String subType) {
    switch (subType) {
      case 'attraction':
        return attraction;
      case 'blood':
        return blood;
      case 'clue':
        return clue;
      case 'contraption':
        return contraption;
      case 'equipment':
        return equipment;
      case 'food':
        return food;
      case 'fortification':
        return fortification;
      case 'gold':
        return gold;
      case 'powerstone':
        return powerstone;
      case 'treasure':
        return treasure;
      case 'vehicle':
        return vehicle;
      default:
        return unknown;
    }
  }

  static MTGArtifactSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Attraction':
        return attraction;
      case 'Blood':
        return blood;
      case 'Clue':
        return clue;
      case 'Contraption':
        return contraption;
      case 'Equipment':
        return equipment;
      case 'Food':
        return food;
      case 'Fortification':
        return fortification;
      case 'Gold':
        return gold;
      case 'Powerstone':
        return powerstone;
      case 'Treasure':
        return treasure;
      case 'Vehicle':
        return vehicle;
      default:
        return unknown;
    }
  }
}

class MTGInstantSubtype extends MTGCardSubtype {
  static MTGInstantSubtype get adventure => MTGInstantSubtype('adventure', 'Adventure', 0);
  static MTGInstantSubtype get arcane => MTGInstantSubtype('arcane', 'Arcane', 1);
  static MTGInstantSubtype get trap => MTGInstantSubtype('trap', 'Trap', 2);
  static MTGInstantSubtype get unknown => MTGInstantSubtype('unknown', 'Unknown', 255);

  static List<MTGInstantSubtype> get all => [
        adventure,
        arcane,
        trap,
      ];

  static List<String> get allNames => [
        adventure.name,
        arcane.name,
        trap.name,
      ];

  MTGInstantSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGInstantSubtype.fromJson(Map<String, dynamic> json) {
    return MTGInstantSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGInstantSubtype fromName(String subType) {
    switch (subType) {
      case 'adventure':
        return adventure;
      case 'arcane':
        return arcane;
      case 'trap':
        return trap;
      default:
        return unknown;
    }
  }

  static MTGInstantSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Adventure':
        return adventure;
      case 'Arcane':
        return arcane;
      case 'Trap':
        return trap;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGInstantSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGInstantSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGSorcerySubtype extends MTGCardSubtype {
  static MTGSorcerySubtype get adventure => MTGSorcerySubtype('adventure', 'Adventure', 0);
  static MTGSorcerySubtype get arcane => MTGSorcerySubtype('arcane', 'Arcane', 1);
  static MTGSorcerySubtype get lesson => MTGSorcerySubtype('lesson', 'Lesson', 2);
  static MTGSorcerySubtype get unknown => MTGSorcerySubtype('unknown', 'Unknown', 255);
  static List<MTGSorcerySubtype> get all => [
        adventure,
        arcane,
        lesson,
      ];

  static List<String> get allNames => [
        adventure.name,
        arcane.name,
        lesson.name,
      ];

  MTGSorcerySubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGSorcerySubtype.fromJson(Map<String, dynamic> json) {
    return MTGSorcerySubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGSorcerySubtype fromName(String subType) {
    switch (subType) {
      case 'adventure':
        return adventure;
      case 'arcane':
        return arcane;
      case 'lesson':
        return lesson;
      default:
        return unknown;
    }
  }

  static MTGSorcerySubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Adventure':
        return adventure;
      case 'Arcane':
        return arcane;
      case 'Lesson':
        return lesson;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGSorcerySubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGSorcerySubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGPlaneswalkerSubtype extends MTGCardSubtype {
  static MTGPlaneswalkerSubtype get abian => MTGPlaneswalkerSubtype('abian', 'Abian', 0);
  static MTGPlaneswalkerSubtype get ajani => MTGPlaneswalkerSubtype('ajani', 'Ajani', 1);
  static MTGPlaneswalkerSubtype get aminatou => MTGPlaneswalkerSubtype('aminatou', 'Aminatou', 2);
  static MTGPlaneswalkerSubtype get angrath => MTGPlaneswalkerSubtype('angrath', 'Angrath', 3);
  static MTGPlaneswalkerSubtype get arlinn => MTGPlaneswalkerSubtype('arlinn', 'Arlinn', 4);
  static MTGPlaneswalkerSubtype get ashiok => MTGPlaneswalkerSubtype('ashiok', 'Ashiok', 5);
  static MTGPlaneswalkerSubtype get bob => MTGPlaneswalkerSubtype('bob', 'B.O.B.', 6);
  static MTGPlaneswalkerSubtype get bahamut => MTGPlaneswalkerSubtype('bahamut', 'Bahamut', 7);
  static MTGPlaneswalkerSubtype get basri => MTGPlaneswalkerSubtype('basri', 'Basri', 8);
  static MTGPlaneswalkerSubtype get bolas => MTGPlaneswalkerSubtype('bolas', 'Bolas', 9);
  static MTGPlaneswalkerSubtype get calix => MTGPlaneswalkerSubtype('calix', 'Calix', 10);
  static MTGPlaneswalkerSubtype get chandra => MTGPlaneswalkerSubtype('chandra', 'Chandra', 11);
  static MTGPlaneswalkerSubtype get comet => MTGPlaneswalkerSubtype('comet', 'Comet', 12);
  static MTGPlaneswalkerSubtype get dack => MTGPlaneswalkerSubtype('dack', 'Dack', 13);
  static MTGPlaneswalkerSubtype get dakkon => MTGPlaneswalkerSubtype('dakkon', 'Dakkon', 14);
  static MTGPlaneswalkerSubtype get daretti => MTGPlaneswalkerSubtype('daretti', 'Daretti', 15);
  static MTGPlaneswalkerSubtype get davriel => MTGPlaneswalkerSubtype('davriel', 'Davriel', 16);
  static MTGPlaneswalkerSubtype get dihada => MTGPlaneswalkerSubtype('dihada', 'Dihada', 17);
  static MTGPlaneswalkerSubtype get domri => MTGPlaneswalkerSubtype('domri', 'Domri', 18);
  static MTGPlaneswalkerSubtype get dovin => MTGPlaneswalkerSubtype('dovin', 'Dovin', 19);
  static MTGPlaneswalkerSubtype get duck => MTGPlaneswalkerSubtype('duck', 'Duck', 20);
  static MTGPlaneswalkerSubtype get dungeon => MTGPlaneswalkerSubtype('dungeon', 'Dungeon', 21);
  static MTGPlaneswalkerSubtype get ellywick => MTGPlaneswalkerSubtype('ellywick', 'Ellywick', 22);
  static MTGPlaneswalkerSubtype get elminster => MTGPlaneswalkerSubtype('elminster', 'Elminster', 23);
  static MTGPlaneswalkerSubtype get elspeth => MTGPlaneswalkerSubtype('elspeth', 'Elspeth', 24);
  static MTGPlaneswalkerSubtype get estrid => MTGPlaneswalkerSubtype('estrid', 'Estrid', 25);
  static MTGPlaneswalkerSubtype get freyalise => MTGPlaneswalkerSubtype('freyalise', 'Freyalise', 26);
  static MTGPlaneswalkerSubtype get garruk => MTGPlaneswalkerSubtype('garruk', 'Garruk', 27);
  static MTGPlaneswalkerSubtype get gideon => MTGPlaneswalkerSubtype('gideon', 'Gideon', 28);
  static MTGPlaneswalkerSubtype get grist => MTGPlaneswalkerSubtype('grist', 'Grist', 29);
  static MTGPlaneswalkerSubtype get huatli => MTGPlaneswalkerSubtype('huatli', 'Huatli', 30);
  static MTGPlaneswalkerSubtype get inzerva => MTGPlaneswalkerSubtype('inzerva', 'Inzerva', 31);
  static MTGPlaneswalkerSubtype get jace => MTGPlaneswalkerSubtype('jace', 'Jace', 32);
  static MTGPlaneswalkerSubtype get jared => MTGPlaneswalkerSubtype('jared', 'Jared', 33);
  static MTGPlaneswalkerSubtype get jaya => MTGPlaneswalkerSubtype('jaya', 'Jaya', 34);
  static MTGPlaneswalkerSubtype get jeska => MTGPlaneswalkerSubtype('jeska', 'Jeska', 35);
  static MTGPlaneswalkerSubtype get kaito => MTGPlaneswalkerSubtype('kaito', 'Kaito', 36);
  static MTGPlaneswalkerSubtype get karn => MTGPlaneswalkerSubtype('karn', 'Karn', 37);
  static MTGPlaneswalkerSubtype get kasmina => MTGPlaneswalkerSubtype('kasmina', 'Kasmina', 38);
  static MTGPlaneswalkerSubtype get kaya => MTGPlaneswalkerSubtype('kaya', 'Kaya', 39);
  static MTGPlaneswalkerSubtype get kiora => MTGPlaneswalkerSubtype('kiora', 'Kiora', 40);
  static MTGPlaneswalkerSubtype get koth => MTGPlaneswalkerSubtype('koth', 'Koth', 41);
  static MTGPlaneswalkerSubtype get liliana => MTGPlaneswalkerSubtype('liliana', 'Liliana', 42);
  static MTGPlaneswalkerSubtype get lolth => MTGPlaneswalkerSubtype('lolth', 'Lolth', 43);
  static MTGPlaneswalkerSubtype get lukka => MTGPlaneswalkerSubtype('lukka', 'Lukka', 44);
  static MTGPlaneswalkerSubtype get master => MTGPlaneswalkerSubtype('master', 'Master', 45);
  static MTGPlaneswalkerSubtype get minsc => MTGPlaneswalkerSubtype('minsc', 'Minsc', 46);
  static MTGPlaneswalkerSubtype get mordenkainen => MTGPlaneswalkerSubtype('mordenkainen', 'Mordenkainen', 47);
  static MTGPlaneswalkerSubtype get nahiri => MTGPlaneswalkerSubtype('nahiri', 'Nahiri', 48);
  static MTGPlaneswalkerSubtype get narset => MTGPlaneswalkerSubtype('narset', 'Narset', 49);
  static MTGPlaneswalkerSubtype get niko => MTGPlaneswalkerSubtype('niko', 'Niko', 50);
  static MTGPlaneswalkerSubtype get nissa => MTGPlaneswalkerSubtype('nissa', 'Nissa', 51);
  static MTGPlaneswalkerSubtype get nixilis => MTGPlaneswalkerSubtype('nixilis', 'Nixilis', 52);
  static MTGPlaneswalkerSubtype get oko => MTGPlaneswalkerSubtype('oko', 'Oko', 53);
  static MTGPlaneswalkerSubtype get ral => MTGPlaneswalkerSubtype('ral', 'Ral', 54);
  static MTGPlaneswalkerSubtype get rowan => MTGPlaneswalkerSubtype('rowan', 'Rowan', 55);
  static MTGPlaneswalkerSubtype get saheeli => MTGPlaneswalkerSubtype('saheeli', 'Saheeli', 56);
  static MTGPlaneswalkerSubtype get samut => MTGPlaneswalkerSubtype('samut', 'Samut', 57);
  static MTGPlaneswalkerSubtype get sarkhan => MTGPlaneswalkerSubtype('sarkhan', 'Sarkhan', 58);
  static MTGPlaneswalkerSubtype get serra => MTGPlaneswalkerSubtype('serra', 'Serra', 59);
  static MTGPlaneswalkerSubtype get sivitri => MTGPlaneswalkerSubtype('sivitri', 'Sivitri', 60);
  static MTGPlaneswalkerSubtype get sorin => MTGPlaneswalkerSubtype('sorin', 'Sorin', 61);
  static MTGPlaneswalkerSubtype get szat => MTGPlaneswalkerSubtype('szat', 'Szat', 62);
  static MTGPlaneswalkerSubtype get tamiyo => MTGPlaneswalkerSubtype('tamiyo', 'Tamiyo', 63);
  static MTGPlaneswalkerSubtype get tasha => MTGPlaneswalkerSubtype('tasha', 'Tasha', 64);
  static MTGPlaneswalkerSubtype get teferi => MTGPlaneswalkerSubtype('teferi', 'Teferi', 65);
  static MTGPlaneswalkerSubtype get teyo => MTGPlaneswalkerSubtype('teyo', 'Teyo', 66);
  static MTGPlaneswalkerSubtype get tezzeret => MTGPlaneswalkerSubtype('tezzeret', 'Tezzeret', 67);
  static MTGPlaneswalkerSubtype get tibalt => MTGPlaneswalkerSubtype('tibalt', 'Tibalt', 68);
  static MTGPlaneswalkerSubtype get tyvar => MTGPlaneswalkerSubtype('tyvar', 'Tyvar', 69);
  static MTGPlaneswalkerSubtype get ugin => MTGPlaneswalkerSubtype('ugin', 'Ugin', 70);
  static MTGPlaneswalkerSubtype get urza => MTGPlaneswalkerSubtype('urza', 'Urza', 71);
  static MTGPlaneswalkerSubtype get venser => MTGPlaneswalkerSubtype('venser', 'Venser', 72);
  static MTGPlaneswalkerSubtype get vivien => MTGPlaneswalkerSubtype('vivien', 'Vivien', 73);
  static MTGPlaneswalkerSubtype get vraska => MTGPlaneswalkerSubtype('vraska', 'Vraska', 74);
  static MTGPlaneswalkerSubtype get will => MTGPlaneswalkerSubtype('will', 'Will', 75);
  static MTGPlaneswalkerSubtype get windgrace => MTGPlaneswalkerSubtype('windgrace', 'Windgrace', 76);
  static MTGPlaneswalkerSubtype get wrenn => MTGPlaneswalkerSubtype('wrenn', 'Wrenn', 77);
  static MTGPlaneswalkerSubtype get xenagos => MTGPlaneswalkerSubtype('xenagos', 'Xenagos', 78);
  static MTGPlaneswalkerSubtype get yanggu => MTGPlaneswalkerSubtype('yanggu', 'Yanggu', 79);
  static MTGPlaneswalkerSubtype get yanling => MTGPlaneswalkerSubtype('yanling', 'Yanling', 80);
  static MTGPlaneswalkerSubtype get zariel => MTGPlaneswalkerSubtype('zariel', 'Zariel', 81);
  static MTGPlaneswalkerSubtype get unknown => MTGPlaneswalkerSubtype('unknown', 'Unknown', 255);

  static List<MTGPlaneswalkerSubtype> get all => [
        abian,
        ajani,
        aminatou,
        angrath,
        arlinn,
        ashiok,
        bob,
        bahamut,
        basri,
        bolas,
        calix,
        chandra,
        comet,
        dack,
        dakkon,
        daretti,
        davriel,
        dihada,
        domri,
        dovin,
        duck,
        dungeon,
        ellywick,
        elminster,
        elspeth,
        estrid,
        freyalise,
        garruk,
        gideon,
        grist,
        huatli,
        inzerva,
        jace,
        jared,
        jaya,
        jeska,
        kaito,
        karn,
        kasmina,
        kaya,
        kiora,
        koth,
        liliana,
        lolth,
        lukka,
        master,
        minsc,
        mordenkainen,
        nahiri,
        narset,
        niko,
        nissa,
        nixilis,
        oko,
        ral,
        rowan,
        saheeli,
        samut,
        sarkhan,
        serra,
        sivitri,
        sorin,
        szat,
        tamiyo,
        tasha,
        teferi,
        teyo,
        tezzeret,
        tibalt,
        tyvar,
        ugin,
        urza,
        venser,
        vivien,
        vraska,
        will,
        windgrace,
        wrenn,
        xenagos,
        yanggu,
        yanling,
        zariel,
      ];

  static List<String> get allNames => [
        abian.name,
        ajani.name,
        aminatou.name,
        angrath.name,
        arlinn.name,
        ashiok.name,
        bob.name,
        bahamut.name,
        basri.name,
        bolas.name,
        calix.name,
        chandra.name,
        comet.name,
        dack.name,
        dakkon.name,
        daretti.name,
        davriel.name,
        dihada.name,
        domri.name,
        dovin.name,
        duck.name,
        dungeon.name,
        ellywick.name,
        elminster.name,
        elspeth.name,
        estrid.name,
        freyalise.name,
        garruk.name,
        gideon.name,
        grist.name,
        huatli.name,
        inzerva.name,
        jace.name,
        jared.name,
        jaya.name,
        jeska.name,
        kaito.name,
        karn.name,
        kasmina.name,
        kaya.name,
        kiora.name,
        koth.name,
        liliana.name,
        lolth.name,
        lukka.name,
        master.name,
        minsc.name,
        mordenkainen.name,
        nahiri.name,
        narset.name,
        niko.name,
        nissa.name,
        nixilis.name,
        oko.name,
        ral.name,
        rowan.name,
        saheeli.name,
        samut.name,
        sarkhan.name,
        serra.name,
        sivitri.name,
        sorin.name,
        szat.name,
        tamiyo.name,
        tasha.name,
        teferi.name,
        teyo.name,
        tezzeret.name,
        tibalt.name,
        tyvar.name,
        ugin.name,
        urza.name,
        venser.name,
        vivien.name,
        vraska.name,
        will.name,
        windgrace.name,
        wrenn.name,
        xenagos.name,
        yanggu.name,
        yanling.name,
        zariel.name,
      ];

  MTGPlaneswalkerSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGPlaneswalkerSubtype.fromJson(Map<String, dynamic> json) {
    return MTGPlaneswalkerSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGPlaneswalkerSubtype fromName(String subType) {
    switch (subType) {
      case 'abian':
        return abian;
      case 'ajani':
        return ajani;
      case 'aminatou':
        return aminatou;
      case 'angrath':
        return angrath;
      case 'arlinn':
        return arlinn;
      case 'ashiok':
        return ashiok;
      case 'bob':
        return bob;
      case 'bahamut':
        return bahamut;
      case 'basri':
        return basri;
      case 'bolas':
        return bolas;
      case 'calix':
        return calix;
      case 'chandra':
        return chandra;
      case 'comet':
        return comet;
      case 'dack':
        return dack;
      case 'dakkon':
        return dakkon;
      case 'daretti':
        return daretti;
      case 'davriel':
        return davriel;
      case 'dihada':
        return dihada;
      case 'domri':
        return domri;
      case 'dovin':
        return dovin;
      case 'duck':
        return duck;
      case 'dungeon':
        return dungeon;
      case 'ellywick':
        return ellywick;
      case 'elminster':
        return elminster;
      case 'elspeth':
        return elspeth;
      case 'estrid':
        return estrid;
      case 'freyalise':
        return freyalise;
      case 'garruk':
        return garruk;
      case 'gideon':
        return gideon;
      case 'grist':
        return grist;
      case 'huatli':
        return huatli;
      case 'inzerva':
        return inzerva;
      case 'jace':
        return jace;
      case 'jared':
        return jared;
      case 'jaya':
        return jaya;
      case 'jeska':
        return jeska;
      case 'kaito':
        return kaito;
      case 'karn':
        return karn;
      case 'kasmina':
        return kasmina;
      case 'kaya':
        return kaya;
      case 'kiora':
        return kiora;
      case 'koth':
        return koth;
      case 'liliana':
        return liliana;
      case 'lolth':
        return lolth;
      case 'lukka':
        return lukka;
      case 'master':
        return master;
      case 'minsc':
        return minsc;
      case 'mordenkainen':
        return mordenkainen;
      case 'nahiri':
        return nahiri;
      case 'narset':
        return narset;
      case 'niko':
        return niko;
      case 'nissa':
        return nissa;
      case 'nixilis':
        return nixilis;
      case 'oko':
        return oko;
      case 'ral':
        return ral;
      case 'rowan':
        return rowan;
      case 'saheeli':
        return saheeli;
      case 'samut':
        return samut;
      case 'sarkhan':
        return sarkhan;
      case 'serra':
        return serra;
      case 'sivitri':
        return sivitri;
      case 'sorin':
        return sorin;
      case 'szat':
        return szat;
      case 'tamiyo':
        return tamiyo;
      case 'tasha':
        return tasha;
      case 'teferi':
        return teferi;
      case 'teyo':
        return teyo;
      case 'tezzeret':
        return tezzeret;
      case 'tibalt':
        return tibalt;
      case 'tyvar':
        return tyvar;
      case 'ugin':
        return ugin;
      case 'urza':
        return urza;
      case 'venser':
        return venser;
      case 'vivien':
        return vivien;
      case 'vraska':
        return vraska;
      case 'will':
        return will;
      case 'windgrace':
        return windgrace;
      case 'wrenn':
        return wrenn;
      case 'xenagos':
        return xenagos;
      case 'yanggu':
        return yanggu;
      case 'yanling':
        return yanling;
      case 'zariel':
        return zariel;
      default:
        return unknown;
    }
  }

  static MTGPlaneswalkerSubtype fromDisplay(String subType) {
    switch (subType) {
      case 'Abian':
        return abian;
      case 'Ajani':
        return ajani;
      case 'Aminatou':
        return aminatou;
      case 'Angrath':
        return angrath;
      case 'Arlinn':
        return arlinn;
      case 'Ashiok':
        return ashiok;
      case 'B.O.B.':
        return bob;
      case 'Bahamut':
        return bahamut;
      case 'Basri':
        return basri;
      case 'Bolas':
        return bolas;
      case 'Calix':
        return calix;
      case 'Chandra':
        return chandra;
      case 'Comet':
        return comet;
      case 'Dack':
        return dack;
      case 'Dakkon':
        return dakkon;
      case 'Daretti':
        return daretti;
      case 'Davriel':
        return davriel;
      case 'Dihada':
        return dihada;
      case 'Domri':
        return domri;
      case 'Dovin':
        return dovin;
      case 'Duck':
        return duck;
      case 'Dungeon':
        return dungeon;
      case 'Ellywick':
        return ellywick;
      case 'Elminster':
        return elminster;
      case 'Elspeth':
        return elspeth;
      case 'Estrid':
        return estrid;
      case 'Freyalise':
        return freyalise;
      case 'Garruk':
        return garruk;
      case 'Gideon':
        return gideon;
      case 'Grist':
        return grist;
      case 'Huatli':
        return huatli;
      case 'Inzerva':
        return inzerva;
      case 'Jace':
        return jace;
      case 'Jared':
        return jared;
      case 'Jaya':
        return jaya;
      case 'Jeska':
        return jeska;
      case 'Kaito':
        return kaito;
      case 'Karn':
        return karn;
      case 'Kasmina':
        return kasmina;
      case 'Kaya':
        return kaya;
      case 'Kiora':
        return kiora;
      case 'Koth':
        return koth;
      case 'Liliana':
        return liliana;
      case 'Lolth':
        return lolth;
      case 'Lukka':
        return lukka;
      case 'Master':
        return master;
      case 'Minsc':
        return minsc;
      case 'Mordenkainen':
        return mordenkainen;
      case 'Nahiri':
        return nahiri;
      case 'Narset':
        return narset;
      case 'Niko':
        return niko;
      case 'Nissa':
        return nissa;
      case 'Nixilis':
        return nixilis;
      case 'Oko':
        return oko;
      case 'Ral':
        return ral;
      case 'Rowan':
        return rowan;
      case 'Saheeli':
        return saheeli;
      case 'Samut':
        return samut;
      case 'Sarkhan':
        return sarkhan;
      case 'Serra':
        return serra;
      case 'Sivitri':
        return sivitri;
      case 'Sorin':
        return sorin;
      case 'Szat':
        return szat;
      case 'Tamiyo':
        return tamiyo;
      case 'Tasha':
        return tasha;
      case 'Teferi':
        return teferi;
      case 'Teyo':
        return teyo;
      case 'Tezzeret':
        return tezzeret;
      case 'Tibalt':
        return tibalt;
      case 'Tyvar':
        return tyvar;
      case 'Ugin':
        return ugin;
      case 'Urza':
        return urza;
      case 'Venser':
        return venser;
      case 'Vivien':
        return vivien;
      case 'Vraska':
        return vraska;
      case 'Will':
        return will;
      case 'Windgrace':
        return windgrace;
      case 'Wrenn':
        return wrenn;
      case 'Xenagos':
        return xenagos;
      case 'Yanggu':
        return yanggu;
      case 'Yanling':
        return yanling;
      case 'Zariel':
        return zariel;
      default:
        return unknown;
    }
  }

  @override
  MTGCardSubtype copyWith({String? name, String? display, int? sortOrder}) {
    return MTGPlaneswalkerSubtype(
      name ?? this.name,
      display ?? this.display,
      sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MTGPlaneswalkerSubtype && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class MTGCardTypeLine extends MTGField {
  MTGCardTypeLine(this.cardType, this.subType) : super('typeLine', 'Type Line', 0);

  MTGCardTypeLine.empty() : this([MTGCardType.unknown], []);

  final List<MTGCardType> cardType;
  final List<MTGCardSubtype> subType;

  factory MTGCardTypeLine.fromJson(Map<String, dynamic> json) {
    return MTGCardTypeLine(
      (json['cardType'] as List<dynamic>).map((e) => _MTGCardTypeParser.parseCardType(e as String)).toList(),
      (json['subType'] as List<dynamic>).map((e) => _MTGCardTypeParser.parseCardSubType(e as String)).toList(),
    );
  }

  factory MTGCardTypeLine.fromString(String typeLine) {
    return _MTGCardTypeParser.parseCardTypeLine(typeLine);
  }

  static MTGCardTypeLine get unknown => MTGCardTypeLine([MTGCardType.unknown], [MTGCardSubtype.unknown]);

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
    } else if (subType.length == 1 && subType[0] == MTGCardSubtype.unknown) {
      return cardType.map((e) => e.display).join(' ');
    } else if (subType.isEmpty) {
      return cardType.map((e) => e.display).join(' ');
    } else {
      return '${cardType.map((e) => e.display).join(' ')} — ${subType.map((e) => e.display).join(' ')}';
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MTGCardTypeLine &&
            Utils.listEquals(other.cardType, cardType) &&
            Utils.listEquals(other.subType, subType);
  }

  @override
  int get hashCode => cardType.hashCode ^ subType.hashCode;
}

class _MTGCardTypeParser {
  static MTGCardType parseCardType(String cardType) {
    if (MTGCardSupertype.allNames.contains(cardType.toLowerCase())) {
      return MTGCardSupertype.fromName(cardType.toLowerCase());
    } else if (MTGCardMainType.allNames.contains(cardType.toLowerCase())) {
      return MTGCardMainType.fromName(cardType.toLowerCase());
    } else {
      return MTGCardType.unknown;
    }
  }

  static MTGCardSubtype parseCardSubType(String cardSubType, {bool isInstant = false}) {
    if (MTGCreatureSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGCreatureSubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGEnchantmentSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGEnchantmentSubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGLandSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGLandSubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGArtifactSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGArtifactSubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGInstantSubtype.allNames.contains(cardSubType.toLowerCase()) &&
        MTGSorcerySubtype.allNames.contains(cardSubType.toLowerCase())) {
      if (isInstant) {
        return MTGInstantSubtype.fromName(cardSubType.toLowerCase());
      } else {
        return MTGSorcerySubtype.fromName(cardSubType.toLowerCase());
      }
    } else if (MTGInstantSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGInstantSubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGSorcerySubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGSorcerySubtype.fromName(cardSubType.toLowerCase());
    } else if (MTGPlaneswalkerSubtype.allNames.contains(cardSubType.toLowerCase())) {
      return MTGPlaneswalkerSubtype.fromName(cardSubType.toLowerCase());
    } else {
      return MTGCardSubtype.unknown;
    }
  }

  static MTGCardTypeLine parseCardTypeLine(String cardTypeLine) {
    List<String> cardTypeLineSplit;
    if (cardTypeLine.contains('-')) {
      cardTypeLineSplit = cardTypeLine.split(' - ');
    } else if (cardTypeLine.contains('—')) {
      cardTypeLineSplit = cardTypeLine.split(' — ');
    } else {
      cardTypeLineSplit = [cardTypeLine];
    }
    List<MTGCardType> cardType = [];
    List<MTGCardSubtype> subType = [];
    bool isInstant = false;

    if (cardTypeLineSplit.isNotEmpty) {
      cardTypeLineSplit[0].split(' ').forEach((element) {
        cardType.add(parseCardType(element));
        if (element == 'Instant') {
          isInstant = true;
        }
      });
    }

    if (cardTypeLineSplit.length > 1) {
      subType = cardTypeLineSplit[1].split(' ').map((e) => parseCardSubType(e, isInstant: isInstant)).toList();
    }

    return MTGCardTypeLine(cardType, subType);
  }
}
