import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:foil/foil.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/models.dart';

import 'package:mtg_cards/src/widgets/card_image/card_widget_stub.dart'
    if (dart.library.io) 'package:mtg_cards/src/widgets/card_image/card_widget_local.dart'
    if (dart.library.html) 'package:mtg_cards/src/widgets/card_image/card_widget_web.dart';

import 'package:provider/provider.dart';

/// A widget that displays a card.
class FlippableCardWidget extends StatefulWidget {
  /// The card to display.
  final MTGCardOld card;

  /// Creates a widget that displays a card.
  const FlippableCardWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<FlippableCardWidget> createState() => _FlippableCardWidgetState();
}

class _FlippableCardWidgetState extends State<FlippableCardWidget> {
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    final cardNotifier = context.watch<CardNotifier>();

    return SizedBox(
      child: GestureDetector(
        onTap: () {
          cardNotifier.isFlipped = !_isFlipped;
          setState(() => _isFlipped = !_isFlipped);
        },
        child: CardFace(
          isFlipped: _isFlipped,
          front: CardWidget(
            key: const ValueKey(true),
            card: widget.card,
            side: SideOld.front,
          ),
          back: CardWidget(
            key: const ValueKey(false),
            card: widget.card,
            side: SideOld.back,
          ),
        ),
      ),
    );
  }
}

class CardFace extends StatelessWidget {
  final bool isFlipped;
  final Widget front;
  final Widget back;

  const CardFace({
    Key? key,
    required this.isFlipped,
    required this.front,
    required this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn.flipped,
      layoutBuilder: (currentChild, previousChildren) {
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          ),
        );
      },
      transitionBuilder: __transitionBuilder,
      child: isFlipped ? back : front,
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(isFlipped) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.card, required this.side});

  final MTGCardOld card;
  final SideOld side;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: (FluentTheme.of(context).brightness.isDark)
                ? Colors.grey[130].withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: (card.isFoil)
          ? Roll(
              crinkle: Crinkle.twinkling,
              child: Foil(
                opacity: 0.25,
                useSensor: false,
                child: CardImage(
                  cardID: card.id,
                  face: card[side],
                ),
              ),
            )
          : CardImage(
              cardID: card.id,
              face: card[side],
            ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.cardID, required this.face});

  final String cardID;
  final MTGFaceOld face;

  @override
  @override
  Widget build(BuildContext context) {
    return CardImageImpl(
      cardID: cardID,
      face: face,
    );
  }
}
