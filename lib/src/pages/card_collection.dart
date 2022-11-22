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
  final searchController = TextEditingController();

  void resetSearch() => searchController.clear();
  List<CardEntry> originalItems = [];
  List<CardEntry> items = [];
  List<CardEntry> filteredItems = [];
  String get searchValue => searchController.text;
  final searchFocusNode = FocusNode();
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
    originalItems = widget.cards;
    originalItems.sort((a, b) => a.card.name.compareTo(b.card.name));
    items = originalItems;
    searchController.addListener(() {
      setState(() {
        if (searchValue.isEmpty) {
          if (filteredItems.isNotEmpty) {
            items = filteredItems;
          } else {
            items = originalItems;
          }
        } else {
          if (filteredItems.isEmpty) {
            items = originalItems
                .where((element) => element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                .toList();
          } else {
            items = filteredItems
                .where((element) => element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                .toList();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collectionNotifier = context.watch<CollectionNotifier>();
    switch (collectionNotifier.sortValue) {
      case 'Name':
        items.sort((a, b) => a.card.name.compareTo(b.card.name));
        items = collectionNotifier.reversed ? items.reversed.toList() : items;
        break;
      case 'Set':
        items.sort((a, b) => a.card.set.compareTo(b.card.set));
        items = collectionNotifier.reversed ? items.reversed.toList() : items;
        break;
      case 'Rarity':
        items.sort((a, b) => a.card.rarity.compareTo(b.card.rarity));
        items = collectionNotifier.reversed ? items.reversed.toList() : items;
        break;
      case 'Price':
        items.sort((a, b) => a.price.compareTo(b.price));
        items = collectionNotifier.reversed ? items.reversed.toList() : items;
        break;
      case 'Quantity':
        items.sort((a, b) => a.quantity.compareTo(b.quantity));
        items = collectionNotifier.reversed ? items.reversed.toList() : items;
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
                        focusNode: searchFocusNode,
                        suffixMode: OverlayVisibilityMode.editing,
                        suffix: IconButton(
                          icon: const Icon(FluentIcons.clear),
                          onPressed: () {
                            setState(() {
                              resetSearch();
                            });
                          },
                        ),
                        controller: searchController,
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
                              items.sort((a, b) => a.card.name.compareTo(b.card.name));
                              items = collectionNotifier.reversed ? items.reversed.toList() : items;
                              break;
                            case 'Set':
                              items.sort((a, b) => a.card.set.compareTo(b.card.set));
                              items = collectionNotifier.reversed ? items.reversed.toList() : items;
                              break;
                            case 'Rarity':
                              items.sort((a, b) => a.card.rarity.compareTo(b.card.rarity));
                              items = collectionNotifier.reversed ? items.reversed.toList() : items;
                              break;
                            case 'Price':
                              items.sort((a, b) => a.price.compareTo(b.price));
                              items = collectionNotifier.reversed ? items.reversed.toList() : items;
                              break;
                            case 'Quantity':
                              items.sort((a, b) => a.quantity.compareTo(b.quantity));
                              items = collectionNotifier.reversed ? items.reversed.toList() : items;
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
                                items = items.reversed.toList();
                                collectionNotifier.reversed = false;
                              }
                              break;
                            case 'Descending':
                              if (!collectionNotifier.reversed) {
                                items = items.reversed.toList();
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

                            for (final item in items) {
                              if (collectionNotifier.filteringRarity) {
                                if (collectionNotifier.rarityFilter[MTGRarity.getRarityFromName(item.card.rarity)]! &&
                                    !filteredList.contains(item)) {
                                  filteredList.add(item);
                                } else if (!collectionNotifier
                                        .rarityFilter[MTGRarity.getRarityFromName(item.card.rarity)]! &&
                                    filteredList.contains(item)) {
                                  filteredList.remove(item);
                                }
                              }
                              if (collectionNotifier.filteringRarity) {
                                for (final color in item.card.colorIdentity) {
                                  if (collectionNotifier.colorFilter[MTGColor.getColorFromName(color)]! &&
                                      !filteredList.contains(item)) {
                                    filteredList.add(item);
                                  } else if (!collectionNotifier.colorFilter[MTGColor.getColorFromName(color)]! &&
                                      filteredList.contains(item)) {
                                    filteredList.remove(item);
                                  }
                                }
                              }
                            }
                            setState(() {
                              if (searchValue.isEmpty) {
                                if (filteredList.isNotEmpty) {
                                  filteredItems = filteredList;
                                  items = filteredList;
                                } else {
                                  filteredItems = [];
                                  items = originalItems;
                                }
                              } else {
                                if (filteredList.isNotEmpty) {
                                  filteredItems = [];
                                  items = filteredList
                                      .where((element) =>
                                          element.card.name.toLowerCase().contains(searchValue.toLowerCase()))
                                      .toList();
                                } else {
                                  filteredItems = [];
                                  items = originalItems
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
                child: GridView.count(
                  crossAxisCount: (constraints.maxWidth > 1000 ? 4 : 2),
                  mainAxisSpacing: 15,
                  children: items.map(
                    (entry) {
                      final MTGCardOld card = entry.card;
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
