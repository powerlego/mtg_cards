import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:http/http.dart' as http;
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/pages.dart';
import 'package:mtg_cards/widgets.dart';
import 'package:provider/provider.dart';

Future<List<MTGCardOld>> fetchCards(String query) async {
  final response =
      await http.get(Uri.parse('https://api.scryfall.com/cards/search?q=$query&include_extras=true&unique=prints'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    List<MTGCardOld> cards = await compute(parseCards, response.body);
    if (json['has_more'] == true) {
      cards.addAll(await getMoreCards(json['next_page']));
      return cards;
    } else {
      return cards;
    }
  } else {
    return [];
  }
  // Use the compute function to run parseCards in a separate isolate.
}

Future<List<MTGCardOld>> getMoreCards(String next) async {
  final response = await http.get(Uri.parse(next));

  if (response.statusCode == 200) {
    List<MTGCardOld> cards = await compute(parseCards, response.body);
    final json = jsonDecode(response.body);
    if (json['has_more'] == true) {
      cards.addAll(await getMoreCards(json['next_page']));
      return cards;
    } else {
      return compute(parseCards, response.body);
    }
  } else {
    return [];
  }

  // Use the compute function to run parseCards in a separate isolate.
}

List<MTGCardOld> parseCards(String responseBody) {
  // Parses the JSON response and returns a list of MTGCard objects.
  final parsed = Map<String, dynamic>.from(jsonDecode(responseBody));
  if (parsed['data'] == null) {
    return [];
  } else {
    final List<dynamic> data = parsed['data'] as List<dynamic>;
    return data.map<MTGCardOld>((json) => MTGCardOld.fromJson(json)).toList();
  }
}

class CardSearch extends StatefulWidget {
  const CardSearch({Key? key}) : super(key: key);

  @override
  State<CardSearch> createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  final TextEditingController _controller = TextEditingController();
  List<MTGCardOld> _cards = <MTGCardOld>[];
  bool _isLoading = false;
  bool _emptySearch = true;
  bool _searched = false;
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardNotifier(),
      builder: (context, _) {
        return ScaffoldPage(
          header: const PageHeader(
            title: Text('Search for a card'),
          ),
          content: LayoutBuilder(builder: (context, constraints) {
            double width = constraints.maxWidth;
            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextBox(
                          controller: _controller,
                          placeholder: 'Search for a card',
                          focusNode: _focusNode,
                          autofocus: true,
                          prefix: IconButton(
                            icon: const Icon(FluentIcons.search),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                setState(() {
                                  _isLoading = true;
                                  _emptySearch = false;
                                  _searched = true;
                                });
                                fetchCards(_controller.text).then((value) {
                                  setState(() {
                                    _cards = value;
                                    _isLoading = false;
                                  });
                                });
                              } else {
                                setState(() {
                                  _emptySearch = true;
                                  _searched = false;
                                });
                              }
                            },
                          ),
                          suffix: IconButton(
                            icon: const Icon(FluentIcons.clear),
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                                _emptySearch = true;
                                _cards = <MTGCardOld>[];
                                _searched = false;
                                _isLoading = false;
                                _focusNode.requestFocus();
                              });
                            },
                          ),
                          suffixMode: OverlayVisibilityMode.editing,
                          onChanged: (String value) {
                            setState(() {
                              _cards = <MTGCardOld>[];
                              _isLoading = false;
                            });
                          },
                          onSubmitted: (String value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                _isLoading = true;
                                _emptySearch = false;
                                _searched = true;
                              });
                              fetchCards(value).then((value) {
                                setState(() {
                                  _cards = value;
                                  _isLoading = false;
                                });
                              });
                            } else {
                              setState(() {
                                _emptySearch = true;
                                _searched = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _isLoading
                      ? const Center(child: ProgressRing())
                      : (_cards.isEmpty && !_emptySearch && _searched)
                          ? Center(
                              child: Text(
                                'No cards found.',
                                style: FluentTheme.of(context).typography.bodyLarge,
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: (constraints.maxWidth > 1000 ? 4 : 2),
                              mainAxisSpacing: 15,
                              children: _cards
                                  .map(
                                    (card) => GestureDetector(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          FluentPageRoute(
                                            builder: (context) => CardDetailsSearch(card: card),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: width / (constraints.maxWidth > 1000 ? 4 : 2),
                                        child: Column(
                                          children: [
                                            Text(card.name),
                                            Expanded(
                                              child: CardWidget(
                                                card: card,
                                                side: Side.front,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
