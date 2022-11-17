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
    return Image.network(widget.face.imageUrl.toString(), fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return const Center(child: ProgressRing());
    });
  }
}
