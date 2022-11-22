import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/src/constants.dart';

class CardImageImpl extends StatefulWidget {
  const CardImageImpl({super.key, required this.cardID, required this.face});

  final String cardID;
  final MTGFaceOld face;

  @override
  State<CardImageImpl> createState() => _CardImageImplState();
}

class _CardImageImplState extends State<CardImageImpl> {
  Future<void> _cacheImage() async {
    final file = File('${Constants.cachePath}/${widget.cardID}/${widget.face.illustrationId}.png');
    if (!file.existsSync()) {
      final request = await HttpClient().getUrl(widget.face.imageUrl);
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      await file.create(recursive: true);
      await file.writeAsBytes(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!File('${Constants.cachePath}/${widget.cardID}/${widget.face.illustrationId}.png').existsSync()) {
        if (widget.face.imageUrl.toString().isNotEmpty) {
          return FutureBuilder(
              future: _cacheImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.file(File('${Constants.cachePath}/${widget.cardID}/${widget.face.illustrationId}.png'),
                      fit: BoxFit.contain);
                } else {
                  return const Center(child: ProgressRing());
                }
              });
        } else {
          return Image.asset('assets/mtg_card_back.png', fit: BoxFit.contain);
        }
      } else {
        return Image.file(File('${Constants.cachePath}/${widget.cardID}/${widget.face.illustrationId}.png'),
            fit: BoxFit.contain);
      }
    });
  }
}
