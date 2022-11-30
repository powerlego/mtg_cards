import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/models.dart';

class CardImageImpl extends StatefulWidget {
  const CardImageImpl({super.key, required this.cardID, required this.face});

  final String cardID;
  final MTGFace face;

  @override
  State<CardImageImpl> createState() => _CardImageImplState();
}

class _CardImageImplState extends State<CardImageImpl> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/mtg_card_back.png', fit: BoxFit.contain);
  }
}
