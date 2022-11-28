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

  static MTGCreatureSubtype getSubTypeFromName(String subType) {
    return unknown;
  }

  static MTGCreatureSubtype getSubTypeFromDisplay(String subType) {
    return unknown;
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

  static MTGEnchantmentSubtype getSubtypeFromName(String subType) {
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

  static MTGEnchantmentSubtype getSubtypeFromDisplay(String subType) {
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
  static MTGLandSubtype get urzas => MTGLandSubtype('urzas', "Urza's", 12);
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

  static MTGLandSubtype getSubtypeFromName(String subType) {
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

  static MTGLandSubtype getSubtypeFromDisplay(String subType) {
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
      case "Urza's":
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

  static MTGArtifactSubtype getSubtypeFromName(String subType) {
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

  static MTGArtifactSubtype getSubtypeFromDisplay(String subType) {
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

  static MTGInstantSubtype getSubtypeFromName(String subType) {
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

  static MTGInstantSubtype getSubtypeFromDisplay(String subType) {
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

  static MTGSorcerySubtype getSubtypeFromName(String subType) {
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

  static MTGSorcerySubtype getSubtypeFromDisplay(String subType) {
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
  static MTGPlaneswalkerSubtype get ajani => MTGPlaneswalkerSubtype('ajani', 'Ajani', 0);
  static MTGPlaneswalkerSubtype get chandra => MTGPlaneswalkerSubtype('chandra', 'Chandra', 1);
  static MTGPlaneswalkerSubtype get domri => MTGPlaneswalkerSubtype('domri', 'Domri', 2);
  static MTGPlaneswalkerSubtype get elspeth => MTGPlaneswalkerSubtype('elspeth', 'Elspeth', 3);
  static MTGPlaneswalkerSubtype get garruk => MTGPlaneswalkerSubtype('garruk', 'Garruk', 4);
  static MTGPlaneswalkerSubtype get jace => MTGPlaneswalkerSubtype('jace', 'Jace', 5);
  static MTGPlaneswalkerSubtype get karn => MTGPlaneswalkerSubtype('karn', 'Karn', 6);
  static MTGPlaneswalkerSubtype get nissa => MTGPlaneswalkerSubtype('nissa', 'Nissa', 7);
  static MTGPlaneswalkerSubtype get sorin => MTGPlaneswalkerSubtype('sorin', 'Sorin', 8);
  static MTGPlaneswalkerSubtype get teferi => MTGPlaneswalkerSubtype('teferi', 'Teferi', 9);
  static MTGPlaneswalkerSubtype get unknown => MTGPlaneswalkerSubtype('unknown', 'Unknown', 255);

  static List<MTGPlaneswalkerSubtype> get all => [
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

  static List<String> get allNames => [
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

  MTGPlaneswalkerSubtype(String name, String display, int sortOrder) : super(name, display, sortOrder);

  factory MTGPlaneswalkerSubtype.fromJson(Map<String, dynamic> json) {
    return MTGPlaneswalkerSubtype(
      json['name'] as String,
      json['display'] as String,
      json['sortOrder'] as int,
    );
  }

  static MTGPlaneswalkerSubtype getSubtypeFromName(String subType) {
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

  static MTGPlaneswalkerSubtype getSubtypeFromDisplay(String subType) {
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
  MTGCardTypeLine(this.cardType, this.subType) : super("typeLine", "Type Line", 0);

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

  static MTGCardSubtype parseCardSubType(String cardSubType) {
    if (MTGCreatureSubtype.allNames.contains(cardSubType)) {
      return MTGCreatureSubtype.getSubTypeFromName(cardSubType);
    } else if (MTGEnchantmentSubtype.allNames.contains(cardSubType)) {
      return MTGEnchantmentSubtype.getSubtypeFromName(cardSubType);
    } else if (MTGLandSubtype.allNames.contains(cardSubType)) {
      return MTGLandSubtype.getSubtypeFromName(cardSubType);
    } else if (MTGArtifactSubtype.allNames.contains(cardSubType)) {
      return MTGArtifactSubtype.getSubtypeFromName(cardSubType);
    } else if (MTGInstantSubtype.allNames.contains(cardSubType)) {
      return MTGInstantSubtype.getSubtypeFromName(cardSubType);
    } else if (MTGSorcerySubtype.allNames.contains(cardSubType)) {
      return MTGSorcerySubtype.getSubtypeFromName(cardSubType);
    } else if (MTGPlaneswalkerSubtype.allNames.contains(cardSubType)) {
      return MTGPlaneswalkerSubtype.getSubtypeFromName(cardSubType);
    } else {
      return MTGCardSubtype.unknown;
    }
  }

  static MTGCardTypeLine parseCardTypeLine(String cardTypeLine) {
    List<String> cardTypeLineSplit = cardTypeLine.split(' - ');
    List<MTGCardType> cardType = [];
    List<MTGCardSubtype> subType = [];

    if (cardTypeLineSplit.isNotEmpty) {
      cardType = cardTypeLineSplit[0].split(' ').map((e) => parseCardType(e)).toList();
    }

    if (cardTypeLineSplit.length > 1) {
      subType = cardTypeLineSplit[1].split(' ').map((e) => parseCardSubType(e)).toList();
    }

    return MTGCardTypeLine(cardType, subType);
  }
}
