import 'package:mtg_cards/models.dart';

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
  static MTGCardSupertype get token => MTGCardSupertype('token', "Token", 5);
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

  static MTGCardSupertype getSupertypeFromName(String name) {
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

  static MTGCardSupertype getSupertypeFromDisplay(String display) {
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
      ];

  MTGCardMainType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCardMainType.fromJson(Map<String, dynamic> json) {
    return MTGCardMainType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGCardMainType getTypeFromName(String name) {
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
      default:
        return unknown;
    }
  }

  static MTGCardMainType getTypeFromDisplay(String display) {
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

class MTGCardSubType extends MTGField {
  static MTGCardSubType get unknown => MTGCardSubType('unknown', 'Unknown', 255);

  MTGCardSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

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
  static MTGCreatureSubType get advisor => MTGCreatureSubType('advisor', 'Advisor', 0);
  static MTGCreatureSubType get aetherborn => MTGCreatureSubType('aetherborn', 'Aetherborn', 1);
  static MTGCreatureSubType get alicorn => MTGCreatureSubType('alicorn', 'Alicorn', 2);
  static MTGCreatureSubType get alien => MTGCreatureSubType('alien', 'Alien', 3);
  static MTGCreatureSubType get ally => MTGCreatureSubType('ally', 'Ally', 4);
  static MTGCreatureSubType get angel => MTGCreatureSubType('angel', 'Angel', 5);
  static MTGCreatureSubType get antelope => MTGCreatureSubType('antelope', 'Antelope', 6);
  static MTGCreatureSubType get ape => MTGCreatureSubType('ape', 'Ape', 7);
  static MTGCreatureSubType get archer => MTGCreatureSubType('archer', 'Archer', 8);
  static MTGCreatureSubType get archon => MTGCreatureSubType('archon', 'Archon', 9);
  static MTGCreatureSubType get army => MTGCreatureSubType('army', 'Army', 10);
  static MTGCreatureSubType get art => MTGCreatureSubType('art', 'Art', 11);
  static MTGCreatureSubType get artificer => MTGCreatureSubType('artificer', 'Artificer', 12);
  static MTGCreatureSubType get assassin => MTGCreatureSubType('assassin', 'Assassin', 13);
  static MTGCreatureSubType get assemblyworker => MTGCreatureSubType('assemblyworker', 'Assembly-Worker', 14);
  static MTGCreatureSubType get astartes => MTGCreatureSubType('astartes', 'Astartes', 15);
  static MTGCreatureSubType get atog => MTGCreatureSubType('atog', 'Atog', 16);
  static MTGCreatureSubType get aurochs => MTGCreatureSubType('aurochs', 'Aurochs', 17);
  static MTGCreatureSubType get autobot => MTGCreatureSubType('autobot', 'Autobot', 18);
  static MTGCreatureSubType get avatar => MTGCreatureSubType('avatar', 'Avatar', 19);
  static MTGCreatureSubType get azra => MTGCreatureSubType('azra', 'Azra', 20);
  static MTGCreatureSubType get badger => MTGCreatureSubType('badger', 'Badger', 21);
  static MTGCreatureSubType get balloon => MTGCreatureSubType('balloon', 'Balloon', 22);
  static MTGCreatureSubType get barbarian => MTGCreatureSubType('barbarian', 'Barbarian', 23);
  static MTGCreatureSubType get bard => MTGCreatureSubType('bard', 'Bard', 24);
  static MTGCreatureSubType get basilisk => MTGCreatureSubType('basilisk', 'Basilisk', 25);
  static MTGCreatureSubType get bat => MTGCreatureSubType('bat', 'Bat', 26);
  static MTGCreatureSubType get bear => MTGCreatureSubType('bear', 'Bear', 27);
  static MTGCreatureSubType get beast => MTGCreatureSubType('beast', 'Beast', 28);
  static MTGCreatureSubType get beaver => MTGCreatureSubType('beaver', 'Beaver', 29);
  static MTGCreatureSubType get beeble => MTGCreatureSubType('beeble', 'Beeble', 30);
  static MTGCreatureSubType get beholder => MTGCreatureSubType('beholder', 'Beholder', 31);
  static MTGCreatureSubType get berserker => MTGCreatureSubType('berserker', 'Berserker', 32);
  static MTGCreatureSubType get bird => MTGCreatureSubType('bird', 'Bird', 33);
  static MTGCreatureSubType get blinkmoth => MTGCreatureSubType('blinkmoth', 'Blinkmoth', 34);
  static MTGCreatureSubType get boar => MTGCreatureSubType('boar', 'Boar', 35);
  static MTGCreatureSubType get brainiac => MTGCreatureSubType('brainiac', 'Brainiac', 36);
  static MTGCreatureSubType get bringer => MTGCreatureSubType('bringer', 'Bringer', 37);
  static MTGCreatureSubType get brushwagg => MTGCreatureSubType('brushwagg', 'Brushwagg', 38);
  static MTGCreatureSubType get bureaucrat => MTGCreatureSubType('bureaucrat', 'Bureaucrat', 39);
  static MTGCreatureSubType get ctan => MTGCreatureSubType('ctan', 'C\'tan', 40);
  static MTGCreatureSubType get camarid => MTGCreatureSubType('camarid', 'Camarid', 41);
  static MTGCreatureSubType get camel => MTGCreatureSubType('camel', 'Camel', 42);
  static MTGCreatureSubType get caribou => MTGCreatureSubType('caribou', 'Caribou', 43);
  static MTGCreatureSubType get carrier => MTGCreatureSubType('carrier', 'Carrier', 44);
  static MTGCreatureSubType get cat => MTGCreatureSubType('cat', 'Cat', 45);
  static MTGCreatureSubType get centaur => MTGCreatureSubType('centaur', 'Centaur', 46);
  static MTGCreatureSubType get cephalid => MTGCreatureSubType('cephalid', 'Cephalid', 47);
  static MTGCreatureSubType get chameleon => MTGCreatureSubType('chameleon', 'Chameleon', 48);
  static MTGCreatureSubType get chicken => MTGCreatureSubType('chicken', 'Chicken', 49);
  static MTGCreatureSubType get child => MTGCreatureSubType('child', 'Child', 50);
  static MTGCreatureSubType get chimera => MTGCreatureSubType('chimera', 'Chimera', 51);
  static MTGCreatureSubType get citizen => MTGCreatureSubType('citizen', 'Citizen', 52);
  static MTGCreatureSubType get clamfolk => MTGCreatureSubType('clamfolk', 'Clamfolk', 53);
  static MTGCreatureSubType get cleric => MTGCreatureSubType('cleric', 'Cleric', 54);
  static MTGCreatureSubType get clown => MTGCreatureSubType('clown', 'Clown', 55);
  static MTGCreatureSubType get cockatrice => MTGCreatureSubType('cockatrice', 'Cockatrice', 56);
  static MTGCreatureSubType get construct => MTGCreatureSubType('construct', 'Construct', 57);
  static MTGCreatureSubType get cow => MTGCreatureSubType('cow', 'Cow', 58);
  static MTGCreatureSubType get coward => MTGCreatureSubType('coward', 'Coward', 59);
  static MTGCreatureSubType get crab => MTGCreatureSubType('crab', 'Crab', 60);
  static MTGCreatureSubType get crocodile => MTGCreatureSubType('crocodile', 'Crocodile', 61);
  static MTGCreatureSubType get custodes => MTGCreatureSubType('custodes', 'Custodes', 62);
  static MTGCreatureSubType get cyborg => MTGCreatureSubType('cyborg', 'Cyborg', 63);
  static MTGCreatureSubType get cyclops => MTGCreatureSubType('cyclops', 'Cyclops', 64);
  static MTGCreatureSubType get dauthi => MTGCreatureSubType('dauthi', 'Dauthi', 65);
  static MTGCreatureSubType get deer => MTGCreatureSubType('deer', 'Deer', 66);
  static MTGCreatureSubType get demigod => MTGCreatureSubType('demigod', 'Demigod', 67);
  static MTGCreatureSubType get demon => MTGCreatureSubType('demon', 'Demon', 68);
  static MTGCreatureSubType get deserter => MTGCreatureSubType('deserter', 'Deserter', 69);
  static MTGCreatureSubType get designer => MTGCreatureSubType('designer', 'Designer', 70);
  static MTGCreatureSubType get devil => MTGCreatureSubType('devil', 'Devil', 71);
  static MTGCreatureSubType get dinosaur => MTGCreatureSubType('dinosaur', 'Dinosaur', 72);
  static MTGCreatureSubType get djinn => MTGCreatureSubType('djinn', 'Djinn', 73);
  static MTGCreatureSubType get dog => MTGCreatureSubType('dog', 'Dog', 74);
  static MTGCreatureSubType get donkey => MTGCreatureSubType('donkey', 'Donkey', 75);
  static MTGCreatureSubType get dragon => MTGCreatureSubType('dragon', 'Dragon', 76);
  static MTGCreatureSubType get drake => MTGCreatureSubType('drake', 'Drake', 77);
  static MTGCreatureSubType get dreadnought => MTGCreatureSubType('dreadnought', 'Dreadnought', 78);
  static MTGCreatureSubType get drone => MTGCreatureSubType('drone', 'Drone', 79);
  static MTGCreatureSubType get druid => MTGCreatureSubType('druid', 'Druid', 80);
  static MTGCreatureSubType get dryad => MTGCreatureSubType('dryad', 'Dryad', 81);
  static MTGCreatureSubType get dwarf => MTGCreatureSubType('dwarf', 'Dwarf', 82);
  static MTGCreatureSubType get efreet => MTGCreatureSubType('efreet', 'Efreet', 83);
  static MTGCreatureSubType get egg => MTGCreatureSubType('egg', 'Egg', 84);
  static MTGCreatureSubType get elder => MTGCreatureSubType('elder', 'Elder', 85);
  static MTGCreatureSubType get eldrazi => MTGCreatureSubType('eldrazi', 'Eldrazi', 86);
  static MTGCreatureSubType get elemental => MTGCreatureSubType('elemental', 'Elemental', 87);
  static MTGCreatureSubType get elementalQuestion => MTGCreatureSubType('elementalQuestion', 'Elemental?', 88);
  static MTGCreatureSubType get elephant => MTGCreatureSubType('elephant', 'Elephant', 89);
  static MTGCreatureSubType get elf => MTGCreatureSubType('elf', 'Elf', 90);
  static MTGCreatureSubType get elk => MTGCreatureSubType('elk', 'Elk', 91);
  static MTGCreatureSubType get elves => MTGCreatureSubType('elves', 'Elves', 92);
  static MTGCreatureSubType get employee => MTGCreatureSubType('employee', 'Employee', 93);
  static MTGCreatureSubType get etiquette => MTGCreatureSubType('etiquette', 'Etiquette', 94);
  static MTGCreatureSubType get eye => MTGCreatureSubType('eye', 'Eye', 95);
  static MTGCreatureSubType get faerie => MTGCreatureSubType('faerie', 'Faerie', 96);
  static MTGCreatureSubType get ferret => MTGCreatureSubType('ferret', 'Ferret', 97);
  static MTGCreatureSubType get fish => MTGCreatureSubType('fish', 'Fish', 98);
  static MTGCreatureSubType get flagbearer => MTGCreatureSubType('flagbearer', 'Flagbearer', 99);
  static MTGCreatureSubType get fox => MTGCreatureSubType('fox', 'Fox', 100);
  static MTGCreatureSubType get fractal => MTGCreatureSubType('fractal', 'Fractal', 101);
  static MTGCreatureSubType get frog => MTGCreatureSubType('frog', 'Frog', 102);
  static MTGCreatureSubType get fungus => MTGCreatureSubType('fungus', 'Fungus', 103);
  static MTGCreatureSubType get gamer => MTGCreatureSubType('gamer', 'Gamer', 104);
  static MTGCreatureSubType get gargoyle => MTGCreatureSubType('gargoyle', 'Gargoyle', 105);
  static MTGCreatureSubType get germ => MTGCreatureSubType('germ', 'Germ', 106);
  static MTGCreatureSubType get giant => MTGCreatureSubType('giant', 'Giant', 107);
  static MTGCreatureSubType get gith => MTGCreatureSubType('gith', 'Gith', 108);
  static MTGCreatureSubType get gnoll => MTGCreatureSubType('gnoll', 'Gnoll', 109);
  static MTGCreatureSubType get gnome => MTGCreatureSubType('gnome', 'Gnome', 110);
  static MTGCreatureSubType get goat => MTGCreatureSubType('goat', 'Goat', 111);
  static MTGCreatureSubType get goblin => MTGCreatureSubType('goblin', 'Goblin', 112);
  static MTGCreatureSubType get god => MTGCreatureSubType('god', 'God', 113);
  static MTGCreatureSubType get golem => MTGCreatureSubType('golem', 'Golem', 114);
  static MTGCreatureSubType get gorgon => MTGCreatureSubType('gorgon', 'Gorgon', 115);
  static MTGCreatureSubType get grandchild => MTGCreatureSubType('grandchild', 'Grandchild', 116);
  static MTGCreatureSubType get graveborn => MTGCreatureSubType('graveborn', 'Graveborn', 117);
  static MTGCreatureSubType get gremlin => MTGCreatureSubType('gremlin', 'Gremlin', 118);
  static MTGCreatureSubType get griffin => MTGCreatureSubType('griffin', 'Griffin', 119);
  static MTGCreatureSubType get guest => MTGCreatureSubType('guest', 'Guest', 120);
  static MTGCreatureSubType get gus => MTGCreatureSubType('gus', 'Gus', 121);
  static MTGCreatureSubType get hag => MTGCreatureSubType('hag', 'Hag', 122);
  static MTGCreatureSubType get halfling => MTGCreatureSubType('halfling', 'Halfling', 123);
  static MTGCreatureSubType get hamster => MTGCreatureSubType('hamster', 'Hamster', 124);
  static MTGCreatureSubType get harpy => MTGCreatureSubType('harpy', 'Harpy', 125);
  static MTGCreatureSubType get hatificer => MTGCreatureSubType('hatificer', 'Hatificer', 126);
  static MTGCreatureSubType get head => MTGCreatureSubType('head', 'Head', 127);
  static MTGCreatureSubType get hellion => MTGCreatureSubType('hellion', 'Hellion', 128);
  static MTGCreatureSubType get hero => MTGCreatureSubType('hero', 'Hero', 129);
  static MTGCreatureSubType get hippo => MTGCreatureSubType('hippo', 'Hippo', 130);
  static MTGCreatureSubType get hippogriff => MTGCreatureSubType('hippogriff', 'Hippogriff', 131);
  static MTGCreatureSubType get homarid => MTGCreatureSubType('homarid', 'Homarid', 132);
  static MTGCreatureSubType get homunculus => MTGCreatureSubType('homunculus', 'Homunculus', 133);
  static MTGCreatureSubType get hornet => MTGCreatureSubType('hornet', 'Hornet', 134);
  static MTGCreatureSubType get horror => MTGCreatureSubType('horror', 'Horror', 135);
  static MTGCreatureSubType get horse => MTGCreatureSubType('horse', 'Horse', 136);
  static MTGCreatureSubType get human => MTGCreatureSubType('human', 'Human', 137);
  static MTGCreatureSubType get hydra => MTGCreatureSubType('hydra', 'Hydra', 138);
  static MTGCreatureSubType get hyena => MTGCreatureSubType('hyena', 'Hyena', 139);
  static MTGCreatureSubType get illusion => MTGCreatureSubType('illusion', 'Illusion', 140);
  static MTGCreatureSubType get imp => MTGCreatureSubType('imp', 'Imp', 141);
  static MTGCreatureSubType get incarnation => MTGCreatureSubType('incarnation', 'Incarnation', 142);
  static MTGCreatureSubType get inkling => MTGCreatureSubType('inkling', 'Inkling', 143);
  static MTGCreatureSubType get inquisitor => MTGCreatureSubType('inquisitor', 'Inquisitor', 144);
  static MTGCreatureSubType get insect => MTGCreatureSubType('insect', 'Insect', 145);
  static MTGCreatureSubType get jackal => MTGCreatureSubType('jackal', 'Jackal', 146);
  static MTGCreatureSubType get jellyfish => MTGCreatureSubType('jellyfish', 'Jellyfish', 147);
  static MTGCreatureSubType get juggernaut => MTGCreatureSubType('juggernaut', 'Juggernaut', 148);
  static MTGCreatureSubType get kangaroo => MTGCreatureSubType('kangaroo', 'Kangaroo', 149);
  static MTGCreatureSubType get kavu => MTGCreatureSubType('kavu', 'Kavu', 150);
  static MTGCreatureSubType get killbot => MTGCreatureSubType('killbot', 'Killbot', 151);
  static MTGCreatureSubType get kirin => MTGCreatureSubType('kirin', 'Kirin', 152);
  static MTGCreatureSubType get kithkin => MTGCreatureSubType('kithkin', 'Kithkin', 153);
  static MTGCreatureSubType get knight => MTGCreatureSubType('knight', 'Knight', 154);
  static MTGCreatureSubType get kobold => MTGCreatureSubType('kobold', 'Kobold', 155);
  static MTGCreatureSubType get kor => MTGCreatureSubType('kor', 'Kor', 156);
  static MTGCreatureSubType get kraken => MTGCreatureSubType('kraken', 'Kraken', 157);
  static MTGCreatureSubType get lady => MTGCreatureSubType('lady', 'Lady', 158);
  static MTGCreatureSubType get lamia => MTGCreatureSubType('lamia', 'Lamia', 159);
  static MTGCreatureSubType get lammasu => MTGCreatureSubType('lammasu', 'Lammasu', 160);
  static MTGCreatureSubType get leech => MTGCreatureSubType('leech', 'Leech', 161);
  static MTGCreatureSubType get leviathan => MTGCreatureSubType('leviathan', 'Leviathan', 162);
  static MTGCreatureSubType get lhurgoyf => MTGCreatureSubType('lhurgoyf', 'Lhurgoyf', 163);
  static MTGCreatureSubType get licid => MTGCreatureSubType('licid', 'Licid', 164);
  static MTGCreatureSubType get lizard => MTGCreatureSubType('lizard', 'Lizard', 165);
  static MTGCreatureSubType get lobster => MTGCreatureSubType('lobster', 'Lobster', 166);
  static MTGCreatureSubType get mammoth => MTGCreatureSubType('mammoth', 'Mammoth', 167);
  static MTGCreatureSubType get manticore => MTGCreatureSubType('manticore', 'Manticore', 168);
  static MTGCreatureSubType get masticore => MTGCreatureSubType('masticore', 'Masticore', 169);
  static MTGCreatureSubType get mercenary => MTGCreatureSubType('mercenary', 'Mercenary', 170);
  static MTGCreatureSubType get merfolk => MTGCreatureSubType('merfolk', 'Merfolk', 171);
  static MTGCreatureSubType get metathran => MTGCreatureSubType('metathran', 'Metathran', 172);
  static MTGCreatureSubType get mime => MTGCreatureSubType('mime', 'Mime', 173);
  static MTGCreatureSubType get minion => MTGCreatureSubType('minion', 'Minion', 174);
  static MTGCreatureSubType get minotaur => MTGCreatureSubType('minotaur', 'Minotaur', 175);
  static MTGCreatureSubType get mole => MTGCreatureSubType('mole', 'Mole', 176);
  static MTGCreatureSubType get monger => MTGCreatureSubType('monger', 'Monger', 177);
  static MTGCreatureSubType get mongoose => MTGCreatureSubType('mongoose', 'Mongoose', 178);
  static MTGCreatureSubType get monk => MTGCreatureSubType('monk', 'Monk', 179);
  static MTGCreatureSubType get monkey => MTGCreatureSubType('monkey', 'Monkey', 180);
  static MTGCreatureSubType get moonfolk => MTGCreatureSubType('moonfolk', 'Moonfolk', 181);
  static MTGCreatureSubType get mouse => MTGCreatureSubType('mouse', 'Mouse', 182);
  static MTGCreatureSubType get mummy => MTGCreatureSubType('mummy', 'Mummy', 183);
  static MTGCreatureSubType get mutant => MTGCreatureSubType('mutant', 'Mutant', 184);
  static MTGCreatureSubType get myr => MTGCreatureSubType('myr', 'Myr', 185);
  static MTGCreatureSubType get mystic => MTGCreatureSubType('mystic', 'Mystic', 186);
  static MTGCreatureSubType get naga => MTGCreatureSubType('naga', 'Naga', 187);
  static MTGCreatureSubType get nautilus => MTGCreatureSubType('nautilus', 'Nautilus', 188);
  static MTGCreatureSubType get necron => MTGCreatureSubType('necron', 'Necron', 189);
  static MTGCreatureSubType get nephilim => MTGCreatureSubType('nephilim', 'Nephilim', 190);
  static MTGCreatureSubType get nightmare => MTGCreatureSubType('nightmare', 'Nightmare', 191);
  static MTGCreatureSubType get nightstalker => MTGCreatureSubType('nightstalker', 'Nightstalker', 192);
  static MTGCreatureSubType get ninja => MTGCreatureSubType('ninja', 'Ninja', 193);
  static MTGCreatureSubType get noble => MTGCreatureSubType('noble', 'Noble', 194);
  static MTGCreatureSubType get noggle => MTGCreatureSubType('noggle', 'Noggle', 195);
  static MTGCreatureSubType get nomad => MTGCreatureSubType('nomad', 'Nomad', 196);
  static MTGCreatureSubType get nymph => MTGCreatureSubType('nymph', 'Nymph', 197);
  static MTGCreatureSubType get octopus => MTGCreatureSubType('octopus', 'Octopus', 198);
  static MTGCreatureSubType get ogre => MTGCreatureSubType('ogre', 'Ogre', 199);
  static MTGCreatureSubType get ooze => MTGCreatureSubType('ooze', 'Ooze', 200);
  static MTGCreatureSubType get orb => MTGCreatureSubType('orb', 'Orb', 201);
  static MTGCreatureSubType get orc => MTGCreatureSubType('orc', 'Orc', 202);
  static MTGCreatureSubType get orgg => MTGCreatureSubType('orgg', 'Orgg', 203);
  static MTGCreatureSubType get otter => MTGCreatureSubType('otter', 'Otter', 204);
  static MTGCreatureSubType get ouphe => MTGCreatureSubType('ouphe', 'Ouphe', 205);
  static MTGCreatureSubType get ox => MTGCreatureSubType('ox', 'Ox', 206);
  static MTGCreatureSubType get oyster => MTGCreatureSubType('oyster', 'Oyster', 207);
  static MTGCreatureSubType get pangolin => MTGCreatureSubType('pangolin', 'Pangolin', 208);
  static MTGCreatureSubType get paratrooper => MTGCreatureSubType('paratrooper', 'Paratrooper', 209);
  static MTGCreatureSubType get peasant => MTGCreatureSubType('peasant', 'Peasant', 210);
  static MTGCreatureSubType get pegasus => MTGCreatureSubType('pegasus', 'Pegasus', 211);
  static MTGCreatureSubType get pentavite => MTGCreatureSubType('pentavite', 'Pentavite', 212);
  static MTGCreatureSubType get performer => MTGCreatureSubType('performer', 'Performer', 213);
  static MTGCreatureSubType get pest => MTGCreatureSubType('pest', 'Pest', 214);
  static MTGCreatureSubType get phelddagrif => MTGCreatureSubType('phelddagrif', 'Phelddagrif', 215);
  static MTGCreatureSubType get phoenix => MTGCreatureSubType('phoenix', 'Phoenix', 216);
  static MTGCreatureSubType get phyrexian => MTGCreatureSubType('phyrexian', 'Phyrexian', 217);
  static MTGCreatureSubType get pilot => MTGCreatureSubType('pilot', 'Pilot', 218);
  static MTGCreatureSubType get pincher => MTGCreatureSubType('pincher', 'Pincher', 219);
  static MTGCreatureSubType get pirate => MTGCreatureSubType('pirate', 'Pirate', 220);
  static MTGCreatureSubType get plant => MTGCreatureSubType('plant', 'Plant', 221);
  static MTGCreatureSubType get porcupine => MTGCreatureSubType('porcupine', 'Porcupine', 222);
  static MTGCreatureSubType get praetor => MTGCreatureSubType('praetor', 'Praetor', 223);
  static MTGCreatureSubType get primarch => MTGCreatureSubType('primarch', 'Primarch', 224);
  static MTGCreatureSubType get prism => MTGCreatureSubType('prism', 'Prism', 225);
  static MTGCreatureSubType get processor => MTGCreatureSubType('processor', 'Processor', 226);
  static MTGCreatureSubType get proper => MTGCreatureSubType('proper', 'Proper', 227);
  static MTGCreatureSubType get rabbit => MTGCreatureSubType('rabbit', 'Rabbit', 228);
  static MTGCreatureSubType get raccoon => MTGCreatureSubType('raccoon', 'Raccoon', 229);
  static MTGCreatureSubType get ranger => MTGCreatureSubType('ranger', 'Ranger', 230);
  static MTGCreatureSubType get rat => MTGCreatureSubType('rat', 'Rat', 231);
  static MTGCreatureSubType get rebel => MTGCreatureSubType('rebel', 'Rebel', 232);
  static MTGCreatureSubType get reflection => MTGCreatureSubType('reflection', 'Reflection', 233);
  static MTGCreatureSubType get reveler => MTGCreatureSubType('reveler', 'Reveler', 234);
  static MTGCreatureSubType get rhino => MTGCreatureSubType('rhino', 'Rhino', 235);
  static MTGCreatureSubType get rigger => MTGCreatureSubType('rigger', 'Rigger', 236);
  static MTGCreatureSubType get robot => MTGCreatureSubType('robot', 'Robot', 237);
  static MTGCreatureSubType get rogue => MTGCreatureSubType('rogue', 'Rogue', 238);
  static MTGCreatureSubType get sable => MTGCreatureSubType('sable', 'Sable', 239);
  static MTGCreatureSubType get salamander => MTGCreatureSubType('salamander', 'Salamander', 240);
  static MTGCreatureSubType get samurai => MTGCreatureSubType('samurai', 'Samurai', 241);
  static MTGCreatureSubType get sand => MTGCreatureSubType('sand', 'Sand', 242);
  static MTGCreatureSubType get saproling => MTGCreatureSubType('saproling', 'Saproling', 243);
  static MTGCreatureSubType get satyr => MTGCreatureSubType('satyr', 'Satyr', 244);
  static MTGCreatureSubType get scarecrow => MTGCreatureSubType('scarecrow', 'Scarecrow', 245);
  static MTGCreatureSubType get scientist => MTGCreatureSubType('scientist', 'Scientist', 246);
  static MTGCreatureSubType get scion => MTGCreatureSubType('scion', 'Scion', 247);
  static MTGCreatureSubType get scorpion => MTGCreatureSubType('scorpion', 'Scorpion', 248);
  static MTGCreatureSubType get scout => MTGCreatureSubType('scout', 'Scout', 249);
  static MTGCreatureSubType get sculpture => MTGCreatureSubType('sculpture', 'Sculpture', 250);
  static MTGCreatureSubType get serf => MTGCreatureSubType('serf', 'Serf', 251);
  static MTGCreatureSubType get serpent => MTGCreatureSubType('serpent', 'Serpent', 252);
  static MTGCreatureSubType get servo => MTGCreatureSubType('servo', 'Servo', 253);
  static MTGCreatureSubType get shade => MTGCreatureSubType('shade', 'Shade', 254);
  static MTGCreatureSubType get shaman => MTGCreatureSubType('shaman', 'Shaman', 255);
  static MTGCreatureSubType get shapeshifter => MTGCreatureSubType('shapeshifter', 'Shapeshifter', 256);
  static MTGCreatureSubType get shark => MTGCreatureSubType('shark', 'Shark', 257);
  static MTGCreatureSubType get sheep => MTGCreatureSubType('sheep', 'Sheep', 258);
  static MTGCreatureSubType get ship => MTGCreatureSubType('ship', 'Ship', 259);
  static MTGCreatureSubType get siren => MTGCreatureSubType('siren', 'Siren', 260);
  static MTGCreatureSubType get skeleton => MTGCreatureSubType('skeleton', 'Skeleton', 261);
  static MTGCreatureSubType get slith => MTGCreatureSubType('slith', 'Slith', 262);
  static MTGCreatureSubType get sliver => MTGCreatureSubType('sliver', 'Sliver', 263);
  static MTGCreatureSubType get slug => MTGCreatureSubType('slug', 'Slug', 264);
  static MTGCreatureSubType get snake => MTGCreatureSubType('snake', 'Snake', 265);
  static MTGCreatureSubType get soldier => MTGCreatureSubType('soldier', 'Soldier', 266);
  static MTGCreatureSubType get soltari => MTGCreatureSubType('soltari', 'Soltari', 267);
  static MTGCreatureSubType get spawn => MTGCreatureSubType('spawn', 'Spawn', 268);
  static MTGCreatureSubType get specter => MTGCreatureSubType('specter', 'Specter', 269);
  static MTGCreatureSubType get spellshaper => MTGCreatureSubType('spellshaper', 'Spellshaper', 270);
  static MTGCreatureSubType get sphinx => MTGCreatureSubType('sphinx', 'Sphinx', 271);
  static MTGCreatureSubType get spider => MTGCreatureSubType('spider', 'Spider', 272);
  static MTGCreatureSubType get spike => MTGCreatureSubType('spike', 'Spike', 273);
  static MTGCreatureSubType get spirit => MTGCreatureSubType('spirit', 'Spirit', 274);
  static MTGCreatureSubType get splinter => MTGCreatureSubType('splinter', 'Splinter', 275);
  static MTGCreatureSubType get sponge => MTGCreatureSubType('sponge', 'Sponge', 276);
  static MTGCreatureSubType get spy => MTGCreatureSubType('spy', 'Spy', 277);
  static MTGCreatureSubType get squid => MTGCreatureSubType('squid', 'Squid', 278);
  static MTGCreatureSubType get squirrel => MTGCreatureSubType('squirrel', 'Squirrel', 279);
  static MTGCreatureSubType get starfish => MTGCreatureSubType('starfish', 'Starfish', 280);
  static MTGCreatureSubType get surrakar => MTGCreatureSubType('surrakar', 'Surrakar', 281);
  static MTGCreatureSubType get survivor => MTGCreatureSubType('survivor', 'Survivor', 282);
  static MTGCreatureSubType get teddy => MTGCreatureSubType('teddy', 'Teddy', 283);
  static MTGCreatureSubType get tentacle => MTGCreatureSubType('tentacle', 'Tentacle', 284);
  static MTGCreatureSubType get tetravite => MTGCreatureSubType('tetravite', 'Tetravite', 285);
  static MTGCreatureSubType get thalakos => MTGCreatureSubType('thalakos', 'Thalakos', 286);
  static MTGCreatureSubType get the => MTGCreatureSubType('the', 'The', 287);
  static MTGCreatureSubType get thopter => MTGCreatureSubType('thopter', 'Thopter', 288);
  static MTGCreatureSubType get thrull => MTGCreatureSubType('thrull', 'Thrull', 289);
  static MTGCreatureSubType get tiefling => MTGCreatureSubType('tiefling', 'Tiefling', 290);
  static MTGCreatureSubType get townsfolk => MTGCreatureSubType('townsfolk', 'Townsfolk', 291);
  static MTGCreatureSubType get treefolk => MTGCreatureSubType('treefolk', 'Treefolk', 292);
  static MTGCreatureSubType get trilobite => MTGCreatureSubType('trilobite', 'Trilobite', 293);
  static MTGCreatureSubType get triskelavite => MTGCreatureSubType('triskelavite', 'Triskelavite', 294);
  static MTGCreatureSubType get troll => MTGCreatureSubType('troll', 'Troll', 295);
  static MTGCreatureSubType get turtle => MTGCreatureSubType('turtle', 'Turtle', 296);
  static MTGCreatureSubType get tyranid => MTGCreatureSubType('tyranid', 'Tyranid', 297);
  static MTGCreatureSubType get unicorn => MTGCreatureSubType('unicorn', 'Unicorn', 298);
  static MTGCreatureSubType get vampire => MTGCreatureSubType('vampire', 'Vampire', 299);
  static MTGCreatureSubType get vampyre => MTGCreatureSubType('vampyre', 'Vampyre', 300);
  static MTGCreatureSubType get vedalken => MTGCreatureSubType('vedalken', 'Vedalken', 301);
  static MTGCreatureSubType get viashino => MTGCreatureSubType('viashino', 'Viashino', 302);
  static MTGCreatureSubType get villain => MTGCreatureSubType('villain', 'Villain', 303);
  static MTGCreatureSubType get volver => MTGCreatureSubType('volver', 'Volver', 304);
  static MTGCreatureSubType get waiter => MTGCreatureSubType('waiter', 'Waiter', 305);
  static MTGCreatureSubType get wall => MTGCreatureSubType('wall', 'Wall', 306);
  static MTGCreatureSubType get walrus => MTGCreatureSubType('walrus', 'Walrus', 307);
  static MTGCreatureSubType get warlock => MTGCreatureSubType('warlock', 'Warlock', 308);
  static MTGCreatureSubType get warrior => MTGCreatureSubType('warrior', 'Warrior', 309);
  static MTGCreatureSubType get wasp => MTGCreatureSubType('wasp', 'Wasp', 310);
  static MTGCreatureSubType get weird => MTGCreatureSubType('weird', 'Weird', 311);
  static MTGCreatureSubType get werewolf => MTGCreatureSubType('werewolf', 'Werewolf', 312);
  static MTGCreatureSubType get whale => MTGCreatureSubType('whale', 'Whale', 313);
  static MTGCreatureSubType get wizard => MTGCreatureSubType('wizard', 'Wizard', 314);
  static MTGCreatureSubType get wolf => MTGCreatureSubType('wolf', 'Wolf', 315);
  static MTGCreatureSubType get wolverine => MTGCreatureSubType('wolverine', 'Wolverine', 316);
  static MTGCreatureSubType get wombat => MTGCreatureSubType('wombat', 'Wombat', 317);
  static MTGCreatureSubType get worm => MTGCreatureSubType('worm', 'Worm', 318);
  static MTGCreatureSubType get wraith => MTGCreatureSubType('wraith', 'Wraith', 319);
  static MTGCreatureSubType get wrestler => MTGCreatureSubType('wrestler', 'Wrestler', 320);
  static MTGCreatureSubType get wurm => MTGCreatureSubType('wurm', 'Wurm', 321);
  static MTGCreatureSubType get yeti => MTGCreatureSubType('yeti', 'Yeti', 322);
  static MTGCreatureSubType get zombie => MTGCreatureSubType('zombie', 'Zombie', 323);
  static MTGCreatureSubType get zubera => MTGCreatureSubType('zubera', 'Zubera', 324);

  static MTGCreatureSubType get unknown => MTGCreatureSubType('unknown', 'Unknown', 65535);

  static List<MTGCreatureSubType> get all => [
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

  MTGCreatureSubType(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGCreatureSubType.fromJson(Map<String, dynamic> json) {
    return MTGCreatureSubType(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

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

  static MTGEnchantmentSubType get aura => MTGEnchantmentSubType('aura', 'Aura', 0);
  static MTGEnchantmentSubType get background => MTGEnchantmentSubType('background', 'Background', 1);
  static MTGEnchantmentSubType get cartouche => MTGEnchantmentSubType('cartouche', 'Cartouche', 2);
  static MTGEnchantmentSubType get class_ => MTGEnchantmentSubType('class', 'Class', 3);
  static MTGEnchantmentSubType get curse => MTGEnchantmentSubType('curse', 'Curse', 4);
  static MTGEnchantmentSubType get rune => MTGEnchantmentSubType('rune', 'Rune', 5);
  static MTGEnchantmentSubType get saga => MTGEnchantmentSubType('saga', 'Saga', 6);
  static MTGEnchantmentSubType get shard => MTGEnchantmentSubType('shard', 'Shard', 7);
  static MTGEnchantmentSubType get shrine => MTGEnchantmentSubType('shrine', 'Shrine', 8);
  static MTGEnchantmentSubType get unknown => MTGEnchantmentSubType('unknown', 'Unknown', 255);

  static List<MTGEnchantmentSubType> get subTypes => [
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

  static List<String> get subTypeNames => [
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

  static MTGEnchantmentSubType getSubTypeFromName(String subType) {
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

  static MTGEnchantmentSubType getSubTypeFromDisplay(String subType) {
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

  static MTGLandSubType get basic => MTGLandSubType('basic', 'Basic', 0);
  static MTGLandSubType get legendary => MTGLandSubType('legendary', 'Legendary', 1);
  static MTGLandSubType get snow => MTGLandSubType('snow', 'Snow', 2);
  static MTGLandSubType get world => MTGLandSubType('world', 'World', 3);
  static MTGLandSubType get unknown => MTGLandSubType('unknown', 'Unknown', 255);

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

  static MTGArtifactSubType get equipment => MTGArtifactSubType('equipment', 'Equipment', 0);
  static MTGArtifactSubType get unknown => MTGArtifactSubType('unknown', 'Unknown', 255);

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

  static MTGInstantSubType get unknown => MTGInstantSubType('unknown', 'Unknown', 255);

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

  static MTGSorcerySubType get unknown => MTGSorcerySubType('unknown', 'Unknown', 255);

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

  static MTGPlaneswalkerSubType get ajani => MTGPlaneswalkerSubType('ajani', 'Ajani', 0);
  static MTGPlaneswalkerSubType get chandra => MTGPlaneswalkerSubType('chandra', 'Chandra', 1);
  static MTGPlaneswalkerSubType get domri => MTGPlaneswalkerSubType('domri', 'Domri', 2);
  static MTGPlaneswalkerSubType get elspeth => MTGPlaneswalkerSubType('elspeth', 'Elspeth', 3);
  static MTGPlaneswalkerSubType get garruk => MTGPlaneswalkerSubType('garruk', 'Garruk', 4);
  static MTGPlaneswalkerSubType get jace => MTGPlaneswalkerSubType('jace', 'Jace', 5);
  static MTGPlaneswalkerSubType get karn => MTGPlaneswalkerSubType('karn', 'Karn', 6);
  static MTGPlaneswalkerSubType get nissa => MTGPlaneswalkerSubType('nissa', 'Nissa', 7);
  static MTGPlaneswalkerSubType get sorin => MTGPlaneswalkerSubType('sorin', 'Sorin', 8);
  static MTGPlaneswalkerSubType get teferi => MTGPlaneswalkerSubType('teferi', 'Teferi', 9);
  static MTGPlaneswalkerSubType get unknown => MTGPlaneswalkerSubType('unknown', 'Unknown', 255);

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

  static MTGCardTypeLine get unknown => MTGCardTypeLine([MTGCardType.unknown], [MTGCardSubType.unknown]);

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
    if (MTGCardSupertype.allNames.contains(cardType)) {
      return MTGCardSupertype.getSupertypeFromName(cardType);
    } else if (MTGCardMainType.allNames.contains(cardType)) {
      return MTGCardMainType.getTypeFromName(cardType);
    } else {
      return MTGCardType.unknown;
    }
  }

  static MTGCardSubType parseCardSubType(String cardSubType) {
    if (MTGCreatureSubType.allNames.contains(cardSubType)) {
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
