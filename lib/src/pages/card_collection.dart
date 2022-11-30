import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/widgets.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/pages.dart';
import 'package:provider/provider.dart';

class CardCollectionBuilder extends StatefulWidget {
  const CardCollectionBuilder({Key? key}) : super(key: key);

  @override
  State<CardCollectionBuilder> createState() => _CardCollectionBuilderState();
}

class _CardCollectionBuilderState extends State<CardCollectionBuilder> {
  final _pageStorageBucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _pageStorageBucket,
      child: ChangeNotifierProvider(
          key: const PageStorageKey('CollectionNotifier'),
          create: (_) => CollectionNotifier(),
          builder: (context, _) {
            return FutureBuilder(
                future: cardDatabase.getCollection(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: ProgressRing());
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Something went wrong, try again.',
                          style: FluentTheme.of(context).typography.bodyLarge,
                        ),
                      );
                    } else {
                      return CardCollection(
                        key: const PageStorageKey('card_collection'),
                        cards: snapshot.data!.map((e) => CardEntry.fromJson(e)).toList(),
                        onRefresh: () {
                          setState(() {});
                        },
                      );
                    }
                  }
                });
          }),
    );
  }
}

class CardCollection extends StatefulWidget {
  const CardCollection({
    Key? key,
    required this.cards,
    required this.onRefresh,
  }) : super(key: key);

  final List<CardEntry> cards;
  final Function() onRefresh;

  @override
  State<CardCollection> createState() => _CardCollectionState();
}

class _CardCollectionState extends State<CardCollection> {
  final _searchController = TextEditingController();

  void resetSearch() => _searchController.clear();
  List<CardEntry> _originalItems = [];
  List<CardEntry> _items = [];
  List<CardEntry> _filteredItems = [];
  String get searchValue => _searchController.text;
  final _searchFocusNode = FocusNode();
  final List<String> _sortOptions = [
    'Name',
    'Set',
    'Rarity',
    'Price',
    'Quantity',
  ];
  final List<String> _sortDirections = ['Ascending', 'Descending'];
  final List<String> _typesOptions = [
    'Artifact',
    'Creature',
    'Enchantment',
    'Instant',
    'Land',
    'Planeswalker',
    'Sorcery',
  ];
  final List<String> _legalityOptions = [
    'Standard',
    'Future',
    'Historic',
    'Gladiator',
    'Pioneer',
    'Modern',
    'Legacy',
    'Pauper',
    'Vintage',
    'Penny',
    'Commander',
    'Brawl',
    'Duel',
    'Historic Brawl',
    'Pauper Commander',
    'Pre-Moderen',
    'Alchemy',
    'Explorer',
    'Old School',
  ];

  @override
  void initState() {
    super.initState();
    _originalItems = widget.cards;
    _originalItems.sort((a, b) => a.card.name.compareTo(b.card.name));
    _items = _originalItems;
    _searchController.addListener(() {
      setState(() {
        if (searchValue.isEmpty) {
          if (_filteredItems.isNotEmpty) {
            _items = _filteredItems;
          } else {
            _items = _originalItems;
          }
        } else {
          if (_filteredItems.isEmpty &&
              (!context.read<CollectionNotifier>().filteringRarity &&
                  !context.read<CollectionNotifier>().filteringColor)) {
            _items = _originalItems
                .where((element) => element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                .toList();
          } else if (_filteredItems.isEmpty &&
              (context.read<CollectionNotifier>().filteringColor ||
                  context.read<CollectionNotifier>().filteringColor)) {
            _items = [];
          } else {
            _items = _filteredItems
                .where((element) => element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                .toList();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collectionNotifier = context.watch<CollectionNotifier>();
    switch (collectionNotifier.sortValue) {
      case 'Name':
        _items.sort((a, b) => a.card.name.compareTo(b.card.name));
        _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
        break;
      case 'Set':
        _items.sort((a, b) => a.card.set.compareTo(b.card.set));
        _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
        break;
      case 'Rarity':
        _items.sort((a, b) => a.card.rarity.compareTo(b.card.rarity));
        _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
        break;
      case 'Price':
        _items.sort((a, b) => a.price.compareTo(b.price));
        _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
        break;
      case 'Quantity':
        _items.sort((a, b) => a.quantity.compareTo(b.quantity));
        _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
        break;
    }
    return ChangeNotifierProvider(
        create: (_) => CardNotifier(),
        builder: (context, _) {
          return LayoutBuilder(builder: (context, constraints) {
            double width = constraints.maxWidth;
            return Column(children: <Widget>[
              Container(
                key: const PageStorageKey('card_collection_search'),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextBox(
                        key: const PageStorageKey('search_box'),
                        placeholder: 'Search for a card',
                        focusNode: _searchFocusNode,
                        suffixMode: OverlayVisibilityMode.editing,
                        suffix: IconButton(
                          icon: const Icon(FluentIcons.clear),
                          onPressed: () {
                            setState(() {
                              resetSearch();
                            });
                          },
                        ),
                        controller: _searchController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ComboBox<String>(
                      key: const PageStorageKey('sort_by'),
                      items: _sortOptions
                          .map((e) => ComboBoxItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      value: collectionNotifier.sortValue,
                      onChanged: (value) {
                        setState(() {
                          collectionNotifier.sortValue = value!;
                          switch (collectionNotifier.sortValue) {
                            case 'Name':
                              _items.sort((a, b) => a.card.name.compareTo(b.card.name));
                              _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
                              break;
                            case 'Set':
                              _items.sort((a, b) => a.card.set.compareTo(b.card.set));
                              _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
                              break;
                            case 'Rarity':
                              _items.sort((a, b) => a.card.rarity.compareTo(b.card.rarity));
                              _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
                              break;
                            case 'Price':
                              _items.sort((a, b) => a.price.compareTo(b.price));
                              _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
                              break;
                            case 'Quantity':
                              _items.sort((a, b) => a.quantity.compareTo(b.quantity));
                              _items = collectionNotifier.reversed ? _items.reversed.toList() : _items;
                              break;
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    ComboBox<String>(
                      key: const PageStorageKey('sort_direction'),
                      items: _sortDirections
                          .map((e) => ComboBoxItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      value: collectionNotifier.sortDirection,
                      onChanged: (value) {
                        setState(() {
                          collectionNotifier.sortDirection = value!;
                          switch (collectionNotifier.sortDirection) {
                            case 'Ascending':
                              if (collectionNotifier.reversed) {
                                _items = _items.reversed.toList();
                                collectionNotifier.reversed = false;
                              }
                              break;
                            case 'Descending':
                              if (!collectionNotifier.reversed) {
                                _items = _items.reversed.toList();
                                collectionNotifier.reversed = true;
                              }
                              break;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expander(
                header: const Text("Filter"),
                content: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: () {
                                      List<Widget> widgets = [
                                        Text('Rarity',
                                            style: FluentTheme.of(context)
                                                .typography
                                                .bodyLarge!
                                                .copyWith(fontWeight: FontWeight.bold)),
                                      ];
                                      widgets.addAll(MTGRarity.rarities
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: Checkbox(
                                                  content: Text(e.display),
                                                  checked: collectionNotifier.rarityFilter[e],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      collectionNotifier.setRarityFilter(e, value!);
                                                    });
                                                  },
                                                ),
                                              ))
                                          .toList());
                                      return widgets;
                                    }()),
                                const SizedBox(width: 8),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: () {
                                      List<Widget> widgets = [
                                        Text('Color',
                                            style: FluentTheme.of(context)
                                                .typography
                                                .bodyLarge!
                                                .copyWith(fontWeight: FontWeight.bold)),
                                      ];
                                      widgets.addAll(MTGColor.colors
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: Checkbox(
                                                  content: Text(e.display),
                                                  checked: collectionNotifier.colorFilter[e],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      collectionNotifier.setColorFilter(e, value!);
                                                    });
                                                  },
                                                ),
                                              ))
                                          .toList());
                                      return widgets;
                                    }()),
                              ],
                            )
                          ]),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          child: const Text("Apply"),
                          onPressed: () {
                            List<CardEntry> filteredList = [];
                            for (final item in _originalItems) {
                              if (collectionNotifier.filteringRarity) {
                                if (collectionNotifier.rarityFilter[item.card.rarity]! &&
                                    !filteredList.contains(item)) {
                                  filteredList.add(item);
                                } else if (!collectionNotifier.rarityFilter[item.card.rarity]! &&
                                    filteredList.contains(item)) {
                                  filteredList.remove(item);
                                } else if (!collectionNotifier.rarityFilter[item.card.rarity]! &&
                                    !filteredList.contains(item)) {
                                  continue;
                                }
                              }
                              if (collectionNotifier.filteringColor) {
                                for (final color in item.card.colors) {
                                  if (collectionNotifier.colorFilter[color]! && !filteredList.contains(item)) {
                                    filteredList.add(item);
                                  } else if (!collectionNotifier.colorFilter[color]! && filteredList.contains(item)) {
                                    filteredList.remove(item);
                                  } else if (!collectionNotifier.colorFilter[color]! && !filteredList.contains(item)) {
                                    continue;
                                  }
                                }
                              }
                            }
                            setState(() {
                              if (searchValue.isEmpty) {
                                if (filteredList.isNotEmpty) {
                                  _filteredItems = filteredList;
                                  _items = filteredList;
                                } else if (filteredList.isEmpty &&
                                    (collectionNotifier.filteringRarity || collectionNotifier.filteringColor)) {
                                  _filteredItems = [];
                                  _items = [];
                                } else {
                                  _filteredItems = [];
                                  _items = _originalItems;
                                }
                              } else {
                                if (filteredList.isNotEmpty) {
                                  _filteredItems = [];
                                  _items = filteredList
                                      .where((element) =>
                                          element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                                      .toList();
                                } else if (filteredList.isEmpty &&
                                    (collectionNotifier.filteringRarity || collectionNotifier.filteringColor)) {
                                  _filteredItems = [];
                                  _items = [];
                                } else {
                                  _filteredItems = [];
                                  _items = _originalItems
                                      .where((element) =>
                                          element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                                      .toList();
                                }
                              }
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: (_items.isEmpty)
                    ? Center(
                        child: Text(
                          'No cards found.',
                          style: FluentTheme.of(context).typography.bodyLarge,
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: (constraints.maxWidth > 1000 ? 4 : 2),
                        mainAxisSpacing: 15,
                        children: _items.map(
                          (entry) {
                            final MTGCard card = entry.card;
                            return GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  FluentPageRoute(
                                    builder: (context) => CardDetailsCollection(
                                      entry: entry,
                                    ),
                                  ),
                                );
                                setState(() {});
                                widget.onRefresh();
                              },
                              child: SizedBox(
                                width: width / (constraints.maxWidth > 1000 ? 4 : 2),
                                child: Column(
                                  children: [
                                    Text(
                                      "${card.name} x ${entry.quantity}",
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: CardWidget(
                                        card: card,
                                        side: Side.front,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
              ),
            ]);
          });
        });
  }
}
