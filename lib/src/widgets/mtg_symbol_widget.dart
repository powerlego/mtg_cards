import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/svg.dart';

class MTGSymbolWidget extends StatelessWidget {
  final MTGSymbol symbol;
  final double size;

  const MTGSymbolWidget({Key? key, required this.symbol, this.size = 25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Tooltip(
        message: symbol.tooltip,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (FluentTheme.of(context).brightness.isDark)
                    ? Colors.grey[70].withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ],
          ),
          child: symbol.copyWith(size: size),
        ),
      ),
    );
  }
}

class MTGSymbolParser {
  static Builder parseString(String str, {TextAlign? textAlign, double? size}) {
    return Builder(
      builder: ((context) {
        final textSpans = <InlineSpan>[];
        List<String> symbols = [];
        String text = "";
        for (int i = 0; i < str.length; i++) {
          if (str[i] == '{') {
            if (text.isNotEmpty) {
              symbols.add(text);
              text = "{";
            } else {
              text = "{";
            }
          } else if (str[i] == '}') {
            if (text.isNotEmpty) {
              symbols.add("$text}");
              text = "";
            } else {
              text = "}";
            }
          } else {
            text += str[i];
          }
        }
        if (text.isNotEmpty) {
          symbols.add(text);
        }
        for (final symbol in symbols) {
          if (symbol.startsWith('{') && symbol.endsWith('}')) {
            final symbolName = symbol.substring(1, symbol.length - 1);
            final symbolData = MTGSymbols.fromName(symbolName);
            textSpans.add(
              WidgetSpan(
                child: MTGSymbolWidget(
                  symbol: symbolData,
                  size: (size != null) ? size : FluentTheme.of(context).typography.body!.fontSize!,
                ),
              ),
            );
          } else {
            textSpans.add(
              TextSpan(
                text: symbol,
                style: (size != null)
                    ? FluentTheme.of(context).typography.body!.copyWith(fontSize: size)
                    : FluentTheme.of(context).typography.body,
              ),
            );
          }
        }
        return RichText(
          text: TextSpan(children: textSpans),
          textAlign: (textAlign == null) ? TextAlign.right : textAlign,
        );
      }),
    );
  }
}

class MTGSymbols {
  static MTGSymbol fromName(String name) {
    switch (name) {
      case 'W':
        return MTGSymbols.white;
      case 'U':
        return MTGSymbols.blue;
      case 'B':
        return MTGSymbols.black;
      case 'R':
        return MTGSymbols.red;
      case 'G':
        return MTGSymbols.green;
      case 'C':
        return MTGSymbols.colorless;
      case 'X':
        return MTGSymbols.xGeneric;
      case 'Y':
        return MTGSymbols.yGeneric;
      case 'Z':
        return MTGSymbols.zGeneric;
      case '0':
        return MTGSymbols.zero;
      case '1':
        return MTGSymbols.one;
      case '2':
        return MTGSymbols.two;
      case '3':
        return MTGSymbols.three;
      case '4':
        return MTGSymbols.four;
      case '5':
        return MTGSymbols.five;
      case '6':
        return MTGSymbols.six;
      case '7':
        return MTGSymbols.seven;
      case '8':
        return MTGSymbols.eight;
      case '9':
        return MTGSymbols.nine;
      case '10':
        return MTGSymbols.ten;
      case '11':
        return MTGSymbols.eleven;
      case '12':
        return MTGSymbols.twelve;
      case '13':
        return MTGSymbols.thirteen;
      case '14':
        return MTGSymbols.fourteen;
      case '15':
        return MTGSymbols.fifteen;
      case '16':
        return MTGSymbols.sixteen;
      case '17':
        return MTGSymbols.seventeen;
      case '18':
        return MTGSymbols.eighteen;
      case '19':
        return MTGSymbols.nineteen;
      case '20':
        return MTGSymbols.twenty;
      case '100':
        return MTGSymbols.oneHundred;
      case 'W/U':
        return MTGSymbols.whiteBlue;
      case 'W/B':
        return MTGSymbols.whiteBlack;
      case 'U/B':
        return MTGSymbols.blueBlack;
      case 'U/R':
        return MTGSymbols.blueRed;
      case 'B/R':
        return MTGSymbols.blackRed;
      case 'B/G':
        return MTGSymbols.blackGreen;
      case 'R/G':
        return MTGSymbols.redGreen;
      case 'R/W':
        return MTGSymbols.redWhite;
      case 'G/W':
        return MTGSymbols.greenWhite;
      case 'G/U':
        return MTGSymbols.greenBlue;
      case '2/W':
        return MTGSymbols.genericWhite;
      case '2/U':
        return MTGSymbols.genericBlue;
      case '2/B':
        return MTGSymbols.genericBlack;
      case '2/R':
        return MTGSymbols.genericRed;
      case '2/G':
        return MTGSymbols.genericGreen;
      case 'P':
        return MTGSymbols.phyrexian;
      case 'S':
        return MTGSymbols.snow;
      case 'T':
        return MTGSymbols.tap;
      case 'Q':
        return MTGSymbols.untap;
      case 'E':
        return MTGSymbols.energy;
      case 'CHAOS':
        return MTGSymbols.chaos;
      case 'W/P':
        return MTGSymbols.phyrexianWhite;
      case 'U/P':
        return MTGSymbols.phyrexianBlue;
      case 'B/P':
        return MTGSymbols.phyrexianBlack;
      case 'R/P':
        return MTGSymbols.phyrexianRed;
      case 'G/P':
        return MTGSymbols.phyrexianGreen;
      case 'B/G/P':
        return MTGSymbols.phyrexianBlackGreen;
      case 'B/R/P':
        return MTGSymbols.phyrexianBlackRed;
      case 'G/U/P':
        return MTGSymbols.phyrexianGreenBlue;
      case 'G/W/P':
        return MTGSymbols.phyrexianGreenWhite;
      case 'R/G/P':
        return MTGSymbols.phyrexianRedGreen;
      case 'R/W/P':
        return MTGSymbols.phyrexianRedWhite;
      case 'U/B/P':
        return MTGSymbols.phyrexianBlueBlack;
      case 'U/R/P':
        return MTGSymbols.phyrexianBlueRed;
      case 'W/B/P':
        return MTGSymbols.phyrexianWhiteBlack;
      case 'W/U/P':
        return MTGSymbols.phyrexianWhiteBlue;
      case 'A':
        return MTGSymbols.acorn;
      case 'TK':
        return MTGSymbols.ticket;
      case 'PW':
        return MTGSymbols.planeswalker;
      default:
        return MTGSymbols.error;
    }
  }

  static List<MTGSymbol> parseManaString(String manaString) {
    List<MTGSymbol> symbols = [];
    for (int i = 0; i < manaString.length; i++) {
      if (manaString[i] == '{') {
        int j = manaString.indexOf('}', i);
        if (j == -1) {
          j = manaString.length;
        }
        String symbol = manaString.substring(i + 1, j);
        switch (symbol) {
          case 'W':
            symbols.add(MTGSymbols.white);
            break;
          case 'U':
            symbols.add(MTGSymbols.blue);
            break;
          case 'B':
            symbols.add(MTGSymbols.black);
            break;
          case 'R':
            symbols.add(MTGSymbols.red);
            break;
          case 'G':
            symbols.add(MTGSymbols.green);
            break;
          case 'C':
            symbols.add(MTGSymbols.colorless);
            break;
          case 'X':
            symbols.add(MTGSymbols.xGeneric);
            break;
          case 'Y':
            symbols.add(MTGSymbols.yGeneric);
            break;
          case 'Z':
            symbols.add(MTGSymbols.zGeneric);
            break;
          case '0':
            symbols.add(MTGSymbols.zero);
            break;
          case '1':
            symbols.add(MTGSymbols.one);
            break;
          case '2':
            symbols.add(MTGSymbols.two);
            break;
          case '3':
            symbols.add(MTGSymbols.three);
            break;
          case '4':
            symbols.add(MTGSymbols.four);
            break;
          case '5':
            symbols.add(MTGSymbols.five);
            break;
          case '6':
            symbols.add(MTGSymbols.six);
            break;
          case '7':
            symbols.add(MTGSymbols.seven);
            break;
          case '8':
            symbols.add(MTGSymbols.eight);
            break;
          case '9':
            symbols.add(MTGSymbols.nine);
            break;
          case '10':
            symbols.add(MTGSymbols.ten);
            break;
          case '11':
            symbols.add(MTGSymbols.eleven);
            break;
          case '12':
            symbols.add(MTGSymbols.twelve);
            break;
          case '13':
            symbols.add(MTGSymbols.thirteen);
            break;
          case '14':
            symbols.add(MTGSymbols.fourteen);
            break;
          case '15':
            symbols.add(MTGSymbols.fifteen);
            break;
          case '16':
            symbols.add(MTGSymbols.sixteen);
            break;
          case '17':
            symbols.add(MTGSymbols.seventeen);
            break;
          case '18':
            symbols.add(MTGSymbols.eighteen);
            break;
          case '19':
            symbols.add(MTGSymbols.nineteen);
            break;
          case '20':
            symbols.add(MTGSymbols.twenty);
            break;
          case '100':
            symbols.add(MTGSymbols.oneHundred);
            break;
          case 'W/U':
            symbols.add(MTGSymbols.whiteBlue);
            break;
          case 'W/B':
            symbols.add(MTGSymbols.whiteBlack);
            break;
          case 'U/B':
            symbols.add(MTGSymbols.blueBlack);
            break;
          case 'U/R':
            symbols.add(MTGSymbols.blueRed);
            break;
          case 'B/R':
            symbols.add(MTGSymbols.blackRed);
            break;
          case 'B/G':
            symbols.add(MTGSymbols.blackGreen);
            break;
          case 'R/G':
            symbols.add(MTGSymbols.redGreen);
            break;
          case 'R/W':
            symbols.add(MTGSymbols.redWhite);
            break;
          case 'G/W':
            symbols.add(MTGSymbols.greenWhite);
            break;
          case 'G/U':
            symbols.add(MTGSymbols.greenBlue);
            break;
          case '2/W':
            symbols.add(MTGSymbols.genericWhite);
            break;
          case '2/U':
            symbols.add(MTGSymbols.genericBlue);
            break;
          case '2/B':
            symbols.add(MTGSymbols.genericBlack);
            break;
          case '2/R':
            symbols.add(MTGSymbols.genericRed);
            break;
          case '2/G':
            symbols.add(MTGSymbols.genericGreen);
            break;
          case 'P':
            symbols.add(MTGSymbols.phyrexian);
            break;
          case 'S':
            symbols.add(MTGSymbols.snow);
            break;
          case 'T':
            symbols.add(MTGSymbols.tap);
            break;
          case 'Q':
            symbols.add(MTGSymbols.untap);
            break;
          case 'E':
            symbols.add(MTGSymbols.energy);
            break;
          case 'CHAOS':
            symbols.add(MTGSymbols.chaos);
            break;
          case 'W/P':
            symbols.add(MTGSymbols.phyrexianWhite);
            break;
          case 'U/P':
            symbols.add(MTGSymbols.phyrexianBlue);
            break;
          case 'B/P':
            symbols.add(MTGSymbols.phyrexianBlack);
            break;
          case 'R/P':
            symbols.add(MTGSymbols.phyrexianRed);
            break;
          case 'G/P':
            symbols.add(MTGSymbols.phyrexianGreen);
            break;
          case 'B/G/P':
            symbols.add(MTGSymbols.phyrexianBlackGreen);
            break;
          case 'B/R/P':
            symbols.add(MTGSymbols.phyrexianBlackRed);
            break;
          case 'G/U/P':
            symbols.add(MTGSymbols.phyrexianGreenBlue);
            break;
          case 'G/W/P':
            symbols.add(MTGSymbols.phyrexianGreenWhite);
            break;
          case 'R/G/P':
            symbols.add(MTGSymbols.phyrexianRedGreen);
            break;
          case 'R/W/P':
            symbols.add(MTGSymbols.phyrexianRedWhite);
            break;
          case 'U/B/P':
            symbols.add(MTGSymbols.phyrexianBlueBlack);
            break;
          case 'U/R/P':
            symbols.add(MTGSymbols.phyrexianBlueRed);
            break;
          case 'W/B/P':
            symbols.add(MTGSymbols.phyrexianWhiteBlack);
            break;
          case 'W/U/P':
            symbols.add(MTGSymbols.phyrexianWhiteBlue);
            break;
          case 'A':
            symbols.add(MTGSymbols.acorn);
            break;
          case 'TK':
            symbols.add(MTGSymbols.ticket);
            break;
          case 'PW':
            symbols.add(MTGSymbols.planeswalker);
            break;
          default:
            break;
        }
      }
    }
    return symbols;
  }

  static const MTGSymbol error = MTGSymbol(
    'error',
    '',
    'https://svgs.scryfall.io/card-symbols/0.svg',
    'error',
  );

  static const MTGSymbol tap = MTGSymbol(
    'Tap',
    '{T}',
    "https://svgs.scryfall.io/card-symbols/T.svg",
    "tap this permanent",
  );
  static const MTGSymbol untap = MTGSymbol(
    'Untap',
    '{Q}',
    "https://svgs.scryfall.io/card-symbols/Q.svg",
    "untap this permanent",
  );
  static const MTGSymbol energy = MTGSymbol(
    'Energy',
    '{E}',
    "https://svgs.scryfall.io/card-symbols/E.svg",
    "an energy counter",
  );
  static const MTGSymbol planeswalker = MTGSymbol(
    'Planeswalker',
    '{PW}',
    "https://svgs.scryfall.io/card-symbols/PW.svg",
    "planeswalker",
  );
  static const MTGSymbol chaos = MTGSymbol(
    'Chaos',
    '{CHAOS}',
    "https://svgs.scryfall.io/card-symbols/CHAOS.svg",
    "chaos",
  );
  static const MTGSymbol acorn = MTGSymbol(
    'Acorn',
    '{A}',
    "https://svgs.scryfall.io/card-symbols/A.svg",
    "an acorn counter",
  );
  static const MTGSymbol ticket = MTGSymbol(
    'Ticket',
    '{TK}',
    "https://svgs.scryfall.io/card-symbols/TK.svg",
    "a ticket counter",
  );

  static const MTGSymbol xGeneric = MTGSymbol(
    'X Generic',
    '{X}',
    "https://svgs.scryfall.io/card-symbols/X.svg",
    "X generic mana",
  );
  static const MTGSymbol yGeneric = MTGSymbol(
    'Y Generic',
    '{Y}',
    "https://svgs.scryfall.io/card-symbols/Y.svg",
    "Y generic mana",
  );
  static const MTGSymbol zGeneric = MTGSymbol(
    'Z Generic',
    '{Z}',
    "https://svgs.scryfall.io/card-symbols/Z.svg",
    "Z generic mana",
  );
  static const MTGSymbol zero = MTGSymbol(
    'Zero',
    '{0}',
    "https://svgs.scryfall.io/card-symbols/0.svg",
    "zero generic mana",
  );

  static const MTGSymbol oneHalf = MTGSymbol(
    'One Half',
    '{½}',
    "https://svgs.scryfall.io/card-symbols/HALF.svg",
    "one half generic mana",
  );

  static const MTGSymbol one = MTGSymbol(
    'One',
    '{1}',
    "https://svgs.scryfall.io/card-symbols/1.svg",
    "one generic mana",
  );
  static const MTGSymbol two = MTGSymbol(
    'Two',
    '{2}',
    "https://svgs.scryfall.io/card-symbols/2.svg",
    "two generic mana",
  );
  static const MTGSymbol three = MTGSymbol(
    'Three',
    '{3}',
    "https://svgs.scryfall.io/card-symbols/3.svg",
    "three generic mana",
  );
  static const MTGSymbol four = MTGSymbol(
    'Four',
    '{4}',
    "https://svgs.scryfall.io/card-symbols/4.svg",
    "four generic mana",
  );
  static const MTGSymbol five = MTGSymbol(
    'Five',
    '{5}',
    "https://svgs.scryfall.io/card-symbols/5.svg",
    "five generic mana",
  );
  static const MTGSymbol six = MTGSymbol(
    'Six',
    '{6}',
    "https://svgs.scryfall.io/card-symbols/6.svg",
    "six generic mana",
  );
  static const MTGSymbol seven = MTGSymbol(
    'Seven',
    '{7}',
    "https://svgs.scryfall.io/card-symbols/7.svg",
    "seven generic mana",
  );
  static const MTGSymbol eight = MTGSymbol(
    'Eight',
    '{8}',
    "https://svgs.scryfall.io/card-symbols/8.svg",
    "eight generic mana",
  );
  static const MTGSymbol nine = MTGSymbol(
    'Nine',
    '{9}',
    "https://svgs.scryfall.io/card-symbols/9.svg",
    "nine generic mana",
  );
  static const MTGSymbol ten = MTGSymbol(
    'Ten',
    '{10}',
    "https://svgs.scryfall.io/card-symbols/10.svg",
    "ten generic mana",
  );
  static const MTGSymbol eleven = MTGSymbol(
    'Eleven',
    '{11}',
    "https://svgs.scryfall.io/card-symbols/11.svg",
    "eleven generic mana",
  );
  static const MTGSymbol twelve = MTGSymbol(
    'Twelve',
    '{12}',
    "https://svgs.scryfall.io/card-symbols/12.svg",
    "twelve generic mana",
  );
  static const MTGSymbol thirteen = MTGSymbol(
    'Thirteen',
    '{13}',
    "https://svgs.scryfall.io/card-symbols/13.svg",
    "thirteen generic mana",
  );
  static const MTGSymbol fourteen = MTGSymbol(
    'Fourteen',
    '{14}',
    "https://svgs.scryfall.io/card-symbols/14.svg",
    "fourteen generic mana",
  );
  static const MTGSymbol fifteen = MTGSymbol(
    'Fifteen',
    '{15}',
    "https://svgs.scryfall.io/card-symbols/15.svg",
    "fifteen generic mana",
  );
  static const MTGSymbol sixteen = MTGSymbol(
    'Sixteen',
    '{16}',
    "https://svgs.scryfall.io/card-symbols/16.svg",
    "sixteen generic mana",
  );
  static const MTGSymbol seventeen = MTGSymbol(
    'Seventeen',
    '{17}',
    "https://svgs.scryfall.io/card-symbols/17.svg",
    "seventeen generic mana",
  );
  static const MTGSymbol eighteen = MTGSymbol(
    'Eighteen',
    '{18}',
    "https://svgs.scryfall.io/card-symbols/18.svg",
    "eighteen generic mana",
  );
  static const MTGSymbol nineteen = MTGSymbol(
    'Nineteen',
    '{19}',
    "https://svgs.scryfall.io/card-symbols/19.svg",
    "nineteen generic mana",
  );
  static const MTGSymbol twenty = MTGSymbol(
    'Twenty',
    '{20}',
    "https://svgs.scryfall.io/card-symbols/20.svg",
    "twenty generic mana",
  );
  static const MTGSymbol oneHundred = MTGSymbol(
    'One Hundred',
    '{100}',
    "https://svgs.scryfall.io/card-symbols/100.svg",
    "one hundred generic mana",
  );

  static const MTGSymbol whiteBlue = MTGSymbol(
    'White Blue',
    '{W/U}',
    "https://svgs.scryfall.io/card-symbols/WU.svg",
    "one white or blue mana",
  );

  static const MTGSymbol whiteBlack = MTGSymbol(
    'White Black',
    '{W/B}',
    "https://svgs.scryfall.io/card-symbols/WB.svg",
    "one white or black mana",
  );

  static const MTGSymbol blackRed = MTGSymbol(
    'Black Red',
    '{B/R}',
    "https://svgs.scryfall.io/card-symbols/BR.svg",
    "one black or red mana",
  );

  static const MTGSymbol blackGreen = MTGSymbol(
    'Black Green',
    '{B/G}',
    "https://svgs.scryfall.io/card-symbols/BG.svg",
    "one black or green mana",
  );

  static const MTGSymbol blueBlack = MTGSymbol(
    'Blue Black',
    '{U/B}',
    "https://svgs.scryfall.io/card-symbols/UB.svg",
    "one blue or black mana",
  );

  static const MTGSymbol blueRed = MTGSymbol(
    'Blue Red',
    '{U/R}',
    "https://svgs.scryfall.io/card-symbols/UR.svg",
    "one blue or red mana",
  );

  static const MTGSymbol redGreen = MTGSymbol(
    'Red Green',
    '{R/G}',
    "https://svgs.scryfall.io/card-symbols/RG.svg",
    "one red or green mana",
  );

  static const MTGSymbol redWhite = MTGSymbol(
    'Red White',
    '{R/W}',
    "https://svgs.scryfall.io/card-symbols/RW.svg",
    "one red or white mana",
  );

  static const MTGSymbol greenWhite = MTGSymbol(
    'Green White',
    '{G/W}',
    "https://svgs.scryfall.io/card-symbols/GW.svg",
    "one green or white mana",
  );

  static const MTGSymbol greenBlue = MTGSymbol(
    'Green Blue',
    '{G/U}',
    "https://svgs.scryfall.io/card-symbols/GU.svg",
    "one green or blue mana",
  );

  static const MTGSymbol snow = MTGSymbol(
    'Snow',
    '{S}',
    "https://svgs.scryfall.io/card-symbols/S.svg",
    "one snow mana",
  );
  static const MTGSymbol white = MTGSymbol(
    'White',
    '{W}',
    "https://svgs.scryfall.io/card-symbols/W.svg",
    "one white mana",
  );
  static const MTGSymbol blue = MTGSymbol(
    'Blue',
    '{U}',
    "https://svgs.scryfall.io/card-symbols/U.svg",
    "one blue mana",
  );
  static const MTGSymbol black = MTGSymbol(
    'Black',
    '{B}',
    "https://svgs.scryfall.io/card-symbols/B.svg",
    "one black mana",
  );
  static const MTGSymbol red = MTGSymbol(
    'Red',
    '{R}',
    "https://svgs.scryfall.io/card-symbols/R.svg",
    "one red mana",
  );
  static const MTGSymbol green = MTGSymbol(
    'Green',
    '{G}',
    "https://svgs.scryfall.io/card-symbols/G.svg",
    "one green mana",
  );
  static const MTGSymbol colorless = MTGSymbol(
    'Colorless',
    '{C}',
    "https://svgs.scryfall.io/card-symbols/C.svg",
    "one colorless mana",
  );
  static const MTGSymbol phyrexianWhite = MTGSymbol(
    'Phyrexian White',
    '{W/P}',
    "https://svgs.scryfall.io/card-symbols/WP.svg",
    "one white mana or two life",
  );
  static const MTGSymbol phyrexianBlue = MTGSymbol(
    'Phyrexian Blue',
    '{U/P}',
    "https://svgs.scryfall.io/card-symbols/UP.svg",
    "one blue mana or two life",
  );
  static const MTGSymbol phyrexianBlack = MTGSymbol(
    'Phyrexian Black',
    '{B/P}',
    "https://svgs.scryfall.io/card-symbols/BP.svg",
    "one black mana or two life",
  );
  static const MTGSymbol phyrexianRed = MTGSymbol(
    'Phyrexian Red',
    '{R/P}',
    "https://svgs.scryfall.io/card-symbols/RP.svg",
    "one red mana or two life",
  );
  static const MTGSymbol phyrexianGreen = MTGSymbol(
    'Phyrexian Green',
    '{G/P}',
    "https://svgs.scryfall.io/card-symbols/GP.svg",
    "one green mana or two life",
  );

  static const MTGSymbol phyrexianBlackGreen = MTGSymbol(
    'Phyrexian Black Green',
    '{B/G/P}',
    "https://svgs.scryfall.io/card-symbols/BGP.svg",
    "one black, one green mana, or two life",
  );

  static const MTGSymbol phyrexianBlackRed = MTGSymbol(
    'Phyrexian Black Red',
    '{B/R/P}',
    "https://svgs.scryfall.io/card-symbols/BRP.svg",
    "one black, one red mana, or two life",
  );

  static const MTGSymbol phyrexianBlueBlack = MTGSymbol(
    'Phyrexian Blue Black',
    '{U/B/P}',
    "https://svgs.scryfall.io/card-symbols/UBP.svg",
    "one blue, one black mana, or two life",
  );

  static const MTGSymbol phyrexianBlueRed = MTGSymbol(
    'Phyrexian Blue Red',
    '{U/R/P}',
    "https://svgs.scryfall.io/card-symbols/URP.svg",
    "one blue, one red mana, or two life",
  );

  static const MTGSymbol phyrexianRedGreen = MTGSymbol(
    'Phyrexian Red Green',
    '{R/G/P}',
    "https://svgs.scryfall.io/card-symbols/RGP.svg",
    "one red, one green mana, or two life",
  );

  static const MTGSymbol phyrexianRedWhite = MTGSymbol(
    'Phyrexian Red White',
    '{R/W/P}',
    "https://svgs.scryfall.io/card-symbols/RWP.svg",
    "one red, one white mana, or two life",
  );

  static const MTGSymbol phyrexianWhiteBlue = MTGSymbol(
    'Phyrexian White Blue',
    '{W/U/P}',
    "https://svgs.scryfall.io/card-symbols/WUP.svg",
    "one white, one blue mana, or two life",
  );

  static const MTGSymbol phyrexianWhiteBlack = MTGSymbol(
    'Phyrexian White Black',
    '{W/B/P}',
    "https://svgs.scryfall.io/card-symbols/WBP.svg",
    "one white, one black mana, or two life",
  );

  static const MTGSymbol phyrexianGreenWhite = MTGSymbol(
    'Phyrexian Green White',
    '{G/W/P}',
    "https://svgs.scryfall.io/card-symbols/GWP.svg",
    "one green, one white mana, or two life",
  );

  static const MTGSymbol phyrexianGreenBlue = MTGSymbol(
    'Phyrexian Green Blue',
    '{G/U/P}',
    "https://svgs.scryfall.io/card-symbols/GUP.svg",
    "one green, one blue mana, or two life",
  );

  static const MTGSymbol phyrexian = MTGSymbol(
    'Phyrexian',
    '{P}',
    "https://svgs.scryfall.io/card-symbols/P.svg",
    "one colored mana or two life",
  );

  static const MTGSymbol genericWhite = MTGSymbol(
    'Generic White',
    '{2/W}',
    "https://svgs.scryfall.io/card-symbols/2W.svg",
    "two generic mana and one white mana",
  );

  static const MTGSymbol genericBlue = MTGSymbol(
    'Generic Blue',
    '{2/U}',
    "https://svgs.scryfall.io/card-symbols/2U.svg",
    "two generic mana and one blue mana",
  );

  static const MTGSymbol genericBlack = MTGSymbol(
    'Generic Black',
    '{2/B}',
    "https://svgs.scryfall.io/card-symbols/2B.svg",
    "two generic mana and one black mana",
  );

  static const MTGSymbol genericRed = MTGSymbol(
    'Generic Red',
    '{2/R}',
    "https://svgs.scryfall.io/card-symbols/2R.svg",
    "two generic mana and one red mana",
  );

  static const MTGSymbol genericGreen = MTGSymbol(
    'Generic Green',
    '{2/G}',
    "https://svgs.scryfall.io/card-symbols/2G.svg",
    "two generic mana and one green mana",
  );
}

class MTGSymbol extends StatelessWidget {
  final String name;
  final String symbol;
  final String symbolUrl;
  final String tooltip;
  final double size;

  const MTGSymbol(this.name, this.symbol, this.symbolUrl, this.tooltip, {super.key, this.size = 25});

  MTGSymbol copyWith({required double size}) {
    return MTGSymbol(name, symbol, symbolUrl, tooltip, size: size);
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      symbolUrl,
      width: size,
      height: size,
      placeholderBuilder: (context) => const Center(
        child: ProgressRing(),
      ),
    );
  }
}
