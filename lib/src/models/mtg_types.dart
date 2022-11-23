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
  static MTGCreatureSubType get baddest => MTGCreatureSubType('baddest', 'Baddest', 21);
  static MTGCreatureSubType get badger => MTGCreatureSubType('badger', 'Badger', 22);
  static MTGCreatureSubType get balloon => MTGCreatureSubType('balloon', 'Balloon', 23);
  static MTGCreatureSubType get barbarian => MTGCreatureSubType('barbarian', 'Barbarian', 24);
  static MTGCreatureSubType get basilisk => MTGCreatureSubType('basilisk', 'Basilisk', 25);
  static MTGCreatureSubType get bat => MTGCreatureSubType('bat', 'Bat', 26);
  static MTGCreatureSubType get bear => MTGCreatureSubType('bear', 'Bear', 27);
  static MTGCreatureSubType get beast => MTGCreatureSubType('beast', 'Beast', 28);
  static MTGCreatureSubType get beaver => MTGCreatureSubType('beaver', 'Beaver', 29);
  static MTGCreatureSubType get beeble => MTGCreatureSubType('beeble', 'Beeble', 30);
  static MTGCreatureSubType get beholder => MTGCreatureSubType('beholder', 'Beholder', 31);
  static MTGCreatureSubType get berserker => MTGCreatureSubType('berserker', 'Berserker', 32);
  static MTGCreatureSubType get biggest => MTGCreatureSubType('biggest', 'Biggest', 33);
  static MTGCreatureSubType get bird => MTGCreatureSubType('bird', 'Bird', 34);
  static MTGCreatureSubType get blinkmoth => MTGCreatureSubType('blinkmoth', 'Blinkmoth', 35);
  static MTGCreatureSubType get boar => MTGCreatureSubType('boar', 'Boar', 36);
  static MTGCreatureSubType get brainiac => MTGCreatureSubType('brainiac', 'Brainiac', 37);
  static MTGCreatureSubType get bringer => MTGCreatureSubType('bringer', 'Bringer', 38);
  static MTGCreatureSubType get brushwagg => MTGCreatureSubType('brushwagg', 'Brushwagg', 39);
  static MTGCreatureSubType get bureaucrat => MTGCreatureSubType('bureaucrat', 'Bureaucrat', 40);
  static MTGCreatureSubType get ctan => MTGCreatureSubType('ctan', 'C\'Tan', 41);
  static MTGCreatureSubType get camarid => MTGCreatureSubType('camarid', 'Camarid', 42);
  static MTGCreatureSubType get camel => MTGCreatureSubType('camel', 'Camel', 43);
  static MTGCreatureSubType get caribou => MTGCreatureSubType('caribou', 'Caribou', 44);
  static MTGCreatureSubType get carrier => MTGCreatureSubType('carrier', 'Carrier', 45);
  static MTGCreatureSubType get cat => MTGCreatureSubType('cat', 'Cat', 46);
  static MTGCreatureSubType get centaur => MTGCreatureSubType('centaur', 'Centaur', 47);
  static MTGCreatureSubType get cephalid => MTGCreatureSubType('cephalid', 'Cephalid', 48);
  static MTGCreatureSubType get chameleon => MTGCreatureSubType('chameleon', 'Chameleon', 49);
  static MTGCreatureSubType get chicken => MTGCreatureSubType('chicken', 'Chicken', 50);
  static MTGCreatureSubType get child => MTGCreatureSubType('child', 'Child', 51);
  static MTGCreatureSubType get chimera => MTGCreatureSubType('chimera', 'Chimera', 52);
  static MTGCreatureSubType get citizen => MTGCreatureSubType('citizen', 'Citizen', 53);
  static MTGCreatureSubType get clamfolk => MTGCreatureSubType('clamfolk', 'Clamfolk', 54);
  static MTGCreatureSubType get cleric => MTGCreatureSubType('cleric', 'Cleric', 55);
  static MTGCreatureSubType get clown => MTGCreatureSubType('clown', 'Clown', 56);
  static MTGCreatureSubType get cockatrice => MTGCreatureSubType('cockatrice', 'Cockatrice', 57);
  static MTGCreatureSubType get construct => MTGCreatureSubType('construct', 'Construct', 58);
  static MTGCreatureSubType get cow => MTGCreatureSubType('cow', 'Cow', 59);
  static MTGCreatureSubType get coward => MTGCreatureSubType('coward', 'Coward', 60);
  static MTGCreatureSubType get crab => MTGCreatureSubType('crab', 'Crab', 61);
  static MTGCreatureSubType get crocodile => MTGCreatureSubType('crocodile', 'Crocodile', 62);
  static MTGCreatureSubType get custodes => MTGCreatureSubType('custodes', 'Custodes', 63);
  static MTGCreatureSubType get cyborg => MTGCreatureSubType('cyborg', 'Cyborg', 64);
  static MTGCreatureSubType get cyclops => MTGCreatureSubType('cyclops', 'Cyclops', 65);
  static MTGCreatureSubType get dauthi => MTGCreatureSubType('dauthi', 'Dauthi', 66);
  static MTGCreatureSubType get deer => MTGCreatureSubType('deer', 'Deer', 67);
  static MTGCreatureSubType get demigod => MTGCreatureSubType('demigod', 'Demigod', 68);
  static MTGCreatureSubType get demon => MTGCreatureSubType('demon', 'Demon', 69);
  static MTGCreatureSubType get deserter => MTGCreatureSubType('deserter', 'Deserter', 70);
  static MTGCreatureSubType get designer => MTGCreatureSubType('designer', 'Designer', 71);
  static MTGCreatureSubType get devil => MTGCreatureSubType('devil', 'Devil', 72);
  static MTGCreatureSubType get dinosaur => MTGCreatureSubType('dinosaur', 'Dinosaur', 73);
  static MTGCreatureSubType get djinn => MTGCreatureSubType('djinn', 'Djinn', 74);
  static MTGCreatureSubType get dog => MTGCreatureSubType('dog', 'Dog', 75);
  static MTGCreatureSubType get donkey => MTGCreatureSubType('donkey', 'Donkey', 76);
  static MTGCreatureSubType get dragon => MTGCreatureSubType('dragon', 'Dragon', 77);
  static MTGCreatureSubType get drake => MTGCreatureSubType('drake', 'Drake', 78);
  static MTGCreatureSubType get dreadnought => MTGCreatureSubType('dreadnought', 'Dreadnought', 79);
  static MTGCreatureSubType get drone => MTGCreatureSubType('drone', 'Drone', 80);
  static MTGCreatureSubType get druid => MTGCreatureSubType('druid', 'Druid', 81);
  static MTGCreatureSubType get dryad => MTGCreatureSubType('dryad', 'Dryad', 82);
  static MTGCreatureSubType get dwarf => MTGCreatureSubType('dwarf', 'Dwarf', 83);
  static MTGCreatureSubType get efreet => MTGCreatureSubType('efreet', 'Efreet', 84);
  static MTGCreatureSubType get egg => MTGCreatureSubType('egg', 'Egg', 85);
  static MTGCreatureSubType get elder => MTGCreatureSubType('elder', 'Elder', 86);
  static MTGCreatureSubType get eldrazi => MTGCreatureSubType('eldrazi', 'Eldrazi', 87);
  static MTGCreatureSubType get elemental => MTGCreatureSubType('elemental', 'Elemental', 88);
  static MTGCreatureSubType get elementalQuestion => MTGCreatureSubType('elementalQuestion', 'Elemental?', 89);
  static MTGCreatureSubType get elephant => MTGCreatureSubType('elephant', 'Elephant', 90);
  static MTGCreatureSubType get elf => MTGCreatureSubType('elf', 'Elf', 91);
  static MTGCreatureSubType get elk => MTGCreatureSubType('elk', 'Elk', 92);
  static MTGCreatureSubType get elves => MTGCreatureSubType('elves', 'Elves', 93);
  static MTGCreatureSubType get employee => MTGCreatureSubType('employee', 'Employee', 94);
  static MTGCreatureSubType get etiquette => MTGCreatureSubType('etiquette', 'Etiquette', 95);
  static MTGCreatureSubType get eye => MTGCreatureSubType('eye', 'Eye', 96);
  static MTGCreatureSubType get faerie => MTGCreatureSubType('faerie', 'Faerie', 97);
  static MTGCreatureSubType get ferret => MTGCreatureSubType('ferret', 'Ferret', 98);
  static MTGCreatureSubType get fish => MTGCreatureSubType('fish', 'Fish', 99);
  static MTGCreatureSubType get flagbearer => MTGCreatureSubType('flagbearer', 'Flagbearer', 100);
  static MTGCreatureSubType get fox => MTGCreatureSubType('fox', 'Fox', 101);
  static MTGCreatureSubType get fractal => MTGCreatureSubType('fractal', 'Fractal', 102);
  static MTGCreatureSubType get frog => MTGCreatureSubType('frog', 'Frog', 103);
  static MTGCreatureSubType get fungus => MTGCreatureSubType('fungus', 'Fungus', 104);
  static MTGCreatureSubType get gamer => MTGCreatureSubType('gamer', 'Gamer', 105);
  static MTGCreatureSubType get gargoyle => MTGCreatureSubType('gargoyle', 'Gargoyle', 106);
  static MTGCreatureSubType get germ => MTGCreatureSubType('germ', 'Germ', 107);
  static MTGCreatureSubType get giant => MTGCreatureSubType('giant', 'Giant', 108);
  static MTGCreatureSubType get gith => MTGCreatureSubType('gith', 'Gith', 109);
  static MTGCreatureSubType get gnoll => MTGCreatureSubType('gnoll', 'Gnoll', 110);
  static MTGCreatureSubType get gnome => MTGCreatureSubType('gnome', 'Gnome', 111);
  static MTGCreatureSubType get goat => MTGCreatureSubType('goat', 'Goat', 112);
  static MTGCreatureSubType get goblin => MTGCreatureSubType('goblin', 'Goblin', 113);
  static MTGCreatureSubType get god => MTGCreatureSubType('god', 'God', 114);
  static MTGCreatureSubType get golem => MTGCreatureSubType('golem', 'Golem', 115);
  static MTGCreatureSubType get gorgon => MTGCreatureSubType('gorgon', 'Gorgon', 116);
  static MTGCreatureSubType get grandchild => MTGCreatureSubType('grandchild', 'Grandchild', 117);
  static MTGCreatureSubType get graveborn => MTGCreatureSubType('graveborn', 'Graveborn', 118);
  static MTGCreatureSubType get gremlin => MTGCreatureSubType('gremlin', 'Gremlin', 119);
  static MTGCreatureSubType get griffin => MTGCreatureSubType('griffin', 'Griffin', 120);
  static MTGCreatureSubType get guest => MTGCreatureSubType('guest', 'Guest', 121);
  static MTGCreatureSubType get gus => MTGCreatureSubType('gus', 'Gus', 122);
  static MTGCreatureSubType get hag => MTGCreatureSubType('hag', 'Hag', 123);
  static MTGCreatureSubType get halfling => MTGCreatureSubType('halfling', 'Halfling', 124);
  static MTGCreatureSubType get hamster => MTGCreatureSubType('hamster', 'Hamster', 125);
  static MTGCreatureSubType get harpy => MTGCreatureSubType('harpy', 'Harpy', 126);
  static MTGCreatureSubType get hatificer => MTGCreatureSubType('hatificer', 'Hatificer', 127);
  static MTGCreatureSubType get head => MTGCreatureSubType('head', 'Head', 128);
  static MTGCreatureSubType get hellion => MTGCreatureSubType('hellion', 'Hellion', 129);
  static MTGCreatureSubType get hero => MTGCreatureSubType('hero', 'Hero', 130);
  static MTGCreatureSubType get hippo => MTGCreatureSubType('hippo', 'Hippo', 131);
  static MTGCreatureSubType get hippogriff => MTGCreatureSubType('hippogriff', 'Hippogriff', 132);
  static MTGCreatureSubType get homarid => MTGCreatureSubType('homarid', 'Homarid', 133);
  static MTGCreatureSubType get homunculus => MTGCreatureSubType('homunculus', 'Homunculus', 134);
  static MTGCreatureSubType get hornet => MTGCreatureSubType('hornet', 'Hornet', 135);
  static MTGCreatureSubType get horror => MTGCreatureSubType('horror', 'Horror', 136);
  static MTGCreatureSubType get horse => MTGCreatureSubType('horse', 'Horse', 137);
  static MTGCreatureSubType get human => MTGCreatureSubType('human', 'Human', 138);
  static MTGCreatureSubType get hydra => MTGCreatureSubType('hydra', 'Hydra', 139);
  static MTGCreatureSubType get hyena => MTGCreatureSubType('hyena', 'Hyena', 140);
  static MTGCreatureSubType get illusion => MTGCreatureSubType('illusion', 'Illusion', 141);
  static MTGCreatureSubType get imp => MTGCreatureSubType('imp', 'Imp', 142);
  static MTGCreatureSubType get incarnation => MTGCreatureSubType('incarnation', 'Incarnation', 143);
  static MTGCreatureSubType get inkling => MTGCreatureSubType('inkling', 'Inkling', 144);
  static MTGCreatureSubType get inquisitor => MTGCreatureSubType('inquisitor', 'Inquisitor', 145);
  static MTGCreatureSubType get insect => MTGCreatureSubType('insect', 'Insect', 146);
  static MTGCreatureSubType get jackal => MTGCreatureSubType('jackal', 'Jackal', 147);
  static MTGCreatureSubType get jellyfish => MTGCreatureSubType('jellyfish', 'Jellyfish', 148);
  static MTGCreatureSubType get juggernaut => MTGCreatureSubType('juggernaut', 'Juggernaut', 149);
  static MTGCreatureSubType get kangaroo => MTGCreatureSubType('kangaroo', 'Kangaroo', 150);
  static MTGCreatureSubType get kavu => MTGCreatureSubType('kavu', 'Kavu', 151);
  static MTGCreatureSubType get killbot => MTGCreatureSubType('killbot', 'Killbot', 152);
  static MTGCreatureSubType get kirin => MTGCreatureSubType('kirin', 'Kirin', 153);
  static MTGCreatureSubType get kithkin => MTGCreatureSubType('kithkin', 'Kithkin', 154);
  static MTGCreatureSubType get knight => MTGCreatureSubType('knight', 'Knight', 155);
  static MTGCreatureSubType get kobold => MTGCreatureSubType('kobold', 'Kobold', 156);
  static MTGCreatureSubType get kor => MTGCreatureSubType('kor', 'Kor', 157);
  static MTGCreatureSubType get kraken => MTGCreatureSubType('kraken', 'Kraken', 158);
  static MTGCreatureSubType get lady => MTGCreatureSubType('lady', 'Lady', 159);
  static MTGCreatureSubType get lamia => MTGCreatureSubType('lamia', 'Lamia', 160);
  static MTGCreatureSubType get lammasu => MTGCreatureSubType('lammasu', 'Lammasu', 161);
  static MTGCreatureSubType get leech => MTGCreatureSubType('leech', 'Leech', 162);
  static MTGCreatureSubType get leviathan => MTGCreatureSubType('leviathan', 'Leviathan', 163);
  static MTGCreatureSubType get lhurgoyf => MTGCreatureSubType('lhurgoyf', 'Lhurgoyf', 164);
  static MTGCreatureSubType get licid => MTGCreatureSubType('licid', 'Licid', 165);
  static MTGCreatureSubType get lizard => MTGCreatureSubType('lizard', 'Lizard', 166);
  static MTGCreatureSubType get lobster => MTGCreatureSubType('lobster', 'Lobster', 167);
  static MTGCreatureSubType get mammoth => MTGCreatureSubType('mammoth', 'Mammoth', 168);
  static MTGCreatureSubType get manticore => MTGCreatureSubType('manticore', 'Manticore', 169);
  static MTGCreatureSubType get masticore => MTGCreatureSubType('masticore', 'Masticore', 170);
  static MTGCreatureSubType get mercenary => MTGCreatureSubType('mercenary', 'Mercenary', 171);
  static MTGCreatureSubType get merfolk => MTGCreatureSubType('merfolk', 'Merfolk', 172);
  static MTGCreatureSubType get metathran => MTGCreatureSubType('metathran', 'Metathran', 173);
  static MTGCreatureSubType get mime => MTGCreatureSubType('mime', 'Mime', 174);
  static MTGCreatureSubType get minion => MTGCreatureSubType('minion', 'Minion', 175);
  static MTGCreatureSubType get minotaur => MTGCreatureSubType('minotaur', 'Minotaur', 176);
  static MTGCreatureSubType get mole => MTGCreatureSubType('mole', 'Mole', 177);
  static MTGCreatureSubType get monger => MTGCreatureSubType('monger', 'Monger', 178);
  static MTGCreatureSubType get mongoose => MTGCreatureSubType('mongoose', 'Mongoose', 179);
  static MTGCreatureSubType get monk => MTGCreatureSubType('monk', 'Monk', 180);
  static MTGCreatureSubType get monkey => MTGCreatureSubType('monkey', 'Monkey', 181);
  static MTGCreatureSubType get moonfolk => MTGCreatureSubType('moonfolk', 'Moonfolk', 182);
  static MTGCreatureSubType get mouse => MTGCreatureSubType('mouse', 'Mouse', 183);
  static MTGCreatureSubType get mummy => MTGCreatureSubType('mummy', 'Mummy', 184);
  static MTGCreatureSubType get mutant => MTGCreatureSubType('mutant', 'Mutant', 185);
  static MTGCreatureSubType get myr => MTGCreatureSubType('myr', 'Myr', 186);
  static MTGCreatureSubType get mystic => MTGCreatureSubType('mystic', 'Mystic', 187);
  static MTGCreatureSubType get naga => MTGCreatureSubType('naga', 'Naga', 188);
  static MTGCreatureSubType get nastiest => MTGCreatureSubType('nastiest', 'Nastiest', 189);
  static MTGCreatureSubType get nautilus => MTGCreatureSubType('nautilus', 'Nautilus', 190);
  static MTGCreatureSubType get necron => MTGCreatureSubType('necron', 'Necron', 191);
  static MTGCreatureSubType get nephilim => MTGCreatureSubType('nephilim', 'Nephilim', 192);
  static MTGCreatureSubType get nightmare => MTGCreatureSubType('nightmare', 'Nightmare', 193);
  static MTGCreatureSubType get nightstalker => MTGCreatureSubType('nightstalker', 'Nightstalker', 194);
  static MTGCreatureSubType get ninja => MTGCreatureSubType('ninja', 'Ninja', 195);
  static MTGCreatureSubType get noble => MTGCreatureSubType('noble', 'Noble', 196);
  static MTGCreatureSubType get noggle => MTGCreatureSubType('noggle', 'Noggle', 197);
  static MTGCreatureSubType get nomad => MTGCreatureSubType('nomad', 'Nomad', 198);
  static MTGCreatureSubType get nymph => MTGCreatureSubType('nymph', 'Nymph', 199);
  static MTGCreatureSubType get octopus => MTGCreatureSubType('octopus', 'Octopus', 200);
  static MTGCreatureSubType get ogre => MTGCreatureSubType('ogre', 'Ogre', 201);
  static MTGCreatureSubType get ooze => MTGCreatureSubType('ooze', 'Ooze', 202);
  static MTGCreatureSubType get orb => MTGCreatureSubType('orb', 'Orb', 203);
  static MTGCreatureSubType get orc => MTGCreatureSubType('orc', 'Orc', 204);
  static MTGCreatureSubType get orgg => MTGCreatureSubType('orgg', 'Orgg', 205);
  static MTGCreatureSubType get otter => MTGCreatureSubType('otter', 'Otter', 206);
  static MTGCreatureSubType get ouphe => MTGCreatureSubType('ouphe', 'Ouphe', 207);
  static MTGCreatureSubType get ox => MTGCreatureSubType('ox', 'Ox', 208);
  static MTGCreatureSubType get oyster => MTGCreatureSubType('oyster', 'Oyster', 209);
  static MTGCreatureSubType get pangolin => MTGCreatureSubType('pangolin', 'Pangolin', 210);
  static MTGCreatureSubType get paratrooper => MTGCreatureSubType('paratrooper', 'Paratrooper', 211);
  static MTGCreatureSubType get peasant => MTGCreatureSubType('peasant', 'Peasant', 212);
  static MTGCreatureSubType get pegasus => MTGCreatureSubType('pegasus', 'Pegasus', 213);
  static MTGCreatureSubType get pentavite => MTGCreatureSubType('pentavite', 'Pentavite', 214);
  static MTGCreatureSubType get performer => MTGCreatureSubType('performer', 'Performer', 215);
  static MTGCreatureSubType get pest => MTGCreatureSubType('pest', 'Pest', 216);
  static MTGCreatureSubType get phelddagrif => MTGCreatureSubType('phelddagrif', 'Phelddagrif', 217);
  static MTGCreatureSubType get phoenix => MTGCreatureSubType('phoenix', 'Phoenix', 218);
  static MTGCreatureSubType get phyrexian => MTGCreatureSubType('phyrexian', 'Phyrexian', 219);
  static MTGCreatureSubType get pilot => MTGCreatureSubType('pilot', 'Pilot', 220);
  static MTGCreatureSubType get pincher => MTGCreatureSubType('pincher', 'Pincher', 221);
  static MTGCreatureSubType get pirate => MTGCreatureSubType('pirate', 'Pirate', 222);
  static MTGCreatureSubType get plant => MTGCreatureSubType('plant', 'Plant', 223);
  static MTGCreatureSubType get porcupine => MTGCreatureSubType('porcupine', 'Porcupine', 224);
  static MTGCreatureSubType get praetor => MTGCreatureSubType('praetor', 'Praetor', 225);
  static MTGCreatureSubType get primarch => MTGCreatureSubType('primarch', 'Primarch', 226);
  static MTGCreatureSubType get prism => MTGCreatureSubType('prism', 'Prism', 227);
  static MTGCreatureSubType get processor => MTGCreatureSubType('processor', 'Processor', 228);
  static MTGCreatureSubType get proper => MTGCreatureSubType('proper', 'Proper', 229);
  static MTGCreatureSubType get rabbit => MTGCreatureSubType('rabbit', 'Rabbit', 230);
  static MTGCreatureSubType get raccoon => MTGCreatureSubType('raccoon', 'Raccoon', 231);
  static MTGCreatureSubType get ranger => MTGCreatureSubType('ranger', 'Ranger', 232);
  static MTGCreatureSubType get rat => MTGCreatureSubType('rat', 'Rat', 233);
  static MTGCreatureSubType get rebel => MTGCreatureSubType('rebel', 'Rebel', 234);
  static MTGCreatureSubType get reflection => MTGCreatureSubType('reflection', 'Reflection', 235);
  static MTGCreatureSubType get reveler => MTGCreatureSubType('reveler', 'Reveler', 236);
  static MTGCreatureSubType get rhino => MTGCreatureSubType('rhino', 'Rhino', 237);
  static MTGCreatureSubType get rigger => MTGCreatureSubType('rigger', 'Rigger', 238);
  static MTGCreatureSubType get robot => MTGCreatureSubType('robot', 'Robot', 239);
  static MTGCreatureSubType get rogue => MTGCreatureSubType('rogue', 'Rogue', 240);
  static MTGCreatureSubType get sable => MTGCreatureSubType('sable', 'Sable', 241);
  static MTGCreatureSubType get salamander => MTGCreatureSubType('salamander', 'Salamander', 242);
  static MTGCreatureSubType get samurai => MTGCreatureSubType('samurai', 'Samurai', 243);
  static MTGCreatureSubType get sand => MTGCreatureSubType('sand', 'Sand', 244);
  static MTGCreatureSubType get saproling => MTGCreatureSubType('saproling', 'Saproling', 245);
  static MTGCreatureSubType get satyr => MTGCreatureSubType('satyr', 'Satyr', 246);
  static MTGCreatureSubType get scarecrow => MTGCreatureSubType('scarecrow', 'Scarecrow', 247);
  static MTGCreatureSubType get scientist => MTGCreatureSubType('scientist', 'Scientist', 248);
  static MTGCreatureSubType get scion => MTGCreatureSubType('scion', 'Scion', 249);
  static MTGCreatureSubType get scorpion => MTGCreatureSubType('scorpion', 'Scorpion', 250);
  static MTGCreatureSubType get scout => MTGCreatureSubType('scout', 'Scout', 251);
  static MTGCreatureSubType get sculpture => MTGCreatureSubType('sculpture', 'Sculpture', 252);
  static MTGCreatureSubType get serf => MTGCreatureSubType('serf', 'Serf', 253);
  static MTGCreatureSubType get serpent => MTGCreatureSubType('serpent', 'Serpent', 254);
  static MTGCreatureSubType get servo => MTGCreatureSubType('servo', 'Servo', 255);
  static MTGCreatureSubType get shade => MTGCreatureSubType('shade', 'Shade', 256);
  static MTGCreatureSubType get shaman => MTGCreatureSubType('shaman', 'Shaman', 257);
  static MTGCreatureSubType get shapeshifter => MTGCreatureSubType('shapeshifter', 'Shapeshifter', 258);
  static MTGCreatureSubType get shark => MTGCreatureSubType('shark', 'Shark', 259);
  static MTGCreatureSubType get sheep => MTGCreatureSubType('sheep', 'Sheep', 260);
  static MTGCreatureSubType get ship => MTGCreatureSubType('ship', 'Ship', 261);
  static MTGCreatureSubType get siren => MTGCreatureSubType('siren', 'Siren', 262);
  static MTGCreatureSubType get skeleton => MTGCreatureSubType('skeleton', 'Skeleton', 263);
  static MTGCreatureSubType get slith => MTGCreatureSubType('slith', 'Slith', 264);
  static MTGCreatureSubType get sliver => MTGCreatureSubType('sliver', 'Sliver', 265);
  static MTGCreatureSubType get slug => MTGCreatureSubType('slug', 'Slug', 266);
  static MTGCreatureSubType get snake => MTGCreatureSubType('snake', 'Snake', 267);
  static MTGCreatureSubType get soldier => MTGCreatureSubType('soldier', 'Soldier', 268);
  static MTGCreatureSubType get soltari => MTGCreatureSubType('soltari', 'Soltari', 269);
  static MTGCreatureSubType get spawn => MTGCreatureSubType('spawn', 'Spawn', 270);
  static MTGCreatureSubType get specter => MTGCreatureSubType('specter', 'Specter', 271);
  static MTGCreatureSubType get spellshaper => MTGCreatureSubType('spellshaper', 'Spellshaper', 272);
  static MTGCreatureSubType get sphinx => MTGCreatureSubType('sphinx', 'Sphinx', 273);
  static MTGCreatureSubType get spider => MTGCreatureSubType('spider', 'Spider', 274);
  static MTGCreatureSubType get spike => MTGCreatureSubType('spike', 'Spike', 275);
  static MTGCreatureSubType get spirit => MTGCreatureSubType('spirit', 'Spirit', 276);
  static MTGCreatureSubType get splinter => MTGCreatureSubType('splinter', 'Splinter', 277);
  static MTGCreatureSubType get sponge => MTGCreatureSubType('sponge', 'Sponge', 278);
  static MTGCreatureSubType get spy => MTGCreatureSubType('spy', 'Spy', 279);
  static MTGCreatureSubType get squid => MTGCreatureSubType('squid', 'Squid', 280);
  static MTGCreatureSubType get squirrel => MTGCreatureSubType('squirrel', 'Squirrel', 281);
  static MTGCreatureSubType get starfish => MTGCreatureSubType('starfish', 'Starfish', 282);
  static MTGCreatureSubType get surrakar => MTGCreatureSubType('surrakar', 'Surrakar', 283);
  static MTGCreatureSubType get survivor => MTGCreatureSubType('survivor', 'Survivor', 284);
  static MTGCreatureSubType get teddy => MTGCreatureSubType('teddy', 'Teddy', 285);
  static MTGCreatureSubType get tentacle => MTGCreatureSubType('tentacle', 'Tentacle', 286);
  static MTGCreatureSubType get tetravite => MTGCreatureSubType('tetravite', 'Tetravite', 287);
  static MTGCreatureSubType get thalakos => MTGCreatureSubType('thalakos', 'Thalakos', 288);
  static MTGCreatureSubType get the => MTGCreatureSubType('the', 'The', 289);
  static MTGCreatureSubType get thopter => MTGCreatureSubType('thopter', 'Thopter', 290);
  static MTGCreatureSubType get thrull => MTGCreatureSubType('thrull', 'Thrull', 291);
  static MTGCreatureSubType get tiefling => MTGCreatureSubType('tiefling', 'Tiefling', 292);
  static MTGCreatureSubType get townsfolk => MTGCreatureSubType('townsfolk', 'Townsfolk', 293);
  static MTGCreatureSubType get treefolk => MTGCreatureSubType('treefolk', 'Treefolk', 294);
  static MTGCreatureSubType get trilobite => MTGCreatureSubType('trilobite', 'Trilobite', 295);
  static MTGCreatureSubType get triskelavite => MTGCreatureSubType('triskelavite', 'Triskelavite', 296);
  static MTGCreatureSubType get troll => MTGCreatureSubType('troll', 'Troll', 297);
  static MTGCreatureSubType get turtle => MTGCreatureSubType('turtle', 'Turtle', 298);
  static MTGCreatureSubType get tyranid => MTGCreatureSubType('tyranid', 'Tyranid', 299);
  static MTGCreatureSubType get unicorn => MTGCreatureSubType('unicorn', 'Unicorn', 300);
  static MTGCreatureSubType get vampire => MTGCreatureSubType('vampire', 'Vampire', 301);
  static MTGCreatureSubType get vampyre => MTGCreatureSubType('vampyre', 'Vampyre', 302);
  static MTGCreatureSubType get vedalken => MTGCreatureSubType('vedalken', 'Vedalken', 303);
  static MTGCreatureSubType get viashino => MTGCreatureSubType('viashino', 'Viashino', 304);
  static MTGCreatureSubType get villain => MTGCreatureSubType('villain', 'Villain', 305);
  static MTGCreatureSubType get volver => MTGCreatureSubType('volver', 'Volver', 306);
  static MTGCreatureSubType get waiter => MTGCreatureSubType('waiter', 'Waiter', 307);
  static MTGCreatureSubType get wall => MTGCreatureSubType('wall', 'Wall', 308);
  static MTGCreatureSubType get walrus => MTGCreatureSubType('walrus', 'Walrus', 309);
  static MTGCreatureSubType get warlock => MTGCreatureSubType('warlock', 'Warlock', 310);
  static MTGCreatureSubType get warrior => MTGCreatureSubType('warrior', 'Warrior', 311);
  static MTGCreatureSubType get wasp => MTGCreatureSubType('wasp', 'Wasp', 312);
  static MTGCreatureSubType get weird => MTGCreatureSubType('weird', 'Weird', 313);
  static MTGCreatureSubType get werewolf => MTGCreatureSubType('werewolf', 'Werewolf', 314);
  static MTGCreatureSubType get whale => MTGCreatureSubType('whale', 'Whale', 315);
  static MTGCreatureSubType get wizard => MTGCreatureSubType('wizard', 'Wizard', 316);
  static MTGCreatureSubType get wolf => MTGCreatureSubType('wolf', 'Wolf', 317);
  static MTGCreatureSubType get wolverine => MTGCreatureSubType('wolverine', 'Wolverine', 318);
  static MTGCreatureSubType get wombat => MTGCreatureSubType('wombat', 'Wombat', 319);
  static MTGCreatureSubType get worm => MTGCreatureSubType('worm', 'Worm', 320);
  static MTGCreatureSubType get wraith => MTGCreatureSubType('wraith', 'Wraith', 321);
  static MTGCreatureSubType get wrestler => MTGCreatureSubType('wrestler', 'Wrestler', 322);
  static MTGCreatureSubType get wurm => MTGCreatureSubType('wurm', 'Wurm', 323);
  static MTGCreatureSubType get yeti => MTGCreatureSubType('yeti', 'Yeti', 324);
  static MTGCreatureSubType get zombie => MTGCreatureSubType('zombie', 'Zombie', 325);
  static MTGCreatureSubType get zubera => MTGCreatureSubType('zubera', 'Zubera', 326);
  static MTGCreatureSubType get unknown => MTGCreatureSubType('unknown', 'Unknown', 65535);

  static List<MTGCreatureSubType> get subTypes => [
        unknown,
      ];

  static List<String> get subTypeNames => [
        unknown.name,
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
  static MTGEnchantmentSubType get curse => MTGEnchantmentSubType('curse', 'Curse', 1);
  static MTGEnchantmentSubType get shrine => MTGEnchantmentSubType('shrine', 'Shrine', 2);
  static MTGEnchantmentSubType get unknown => MTGEnchantmentSubType('unknown', 'Unknown', 255);

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
