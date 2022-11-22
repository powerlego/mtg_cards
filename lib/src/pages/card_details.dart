// ignore_for_file: use_build_context_synchronously

import 'package:decimal/decimal.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/main.dart';
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/utils.dart';
import 'package:mtg_cards/widgets.dart';
import 'package:provider/provider.dart';

import 'package:window_manager/window_manager.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;

const double fontSize = 17;

class CardDetailsSearch extends StatelessWidget {
  const CardDetailsSearch({Key? key, required this.card}) : super(key: key);

  final MTGCardOld card;

  void showAddDialog(BuildContext context) async {
    final result = await showDialog<CardEntry>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        String? finish;
        return ContentDialog(
          title: const Text('Add card to collection'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text('Copies: '),
                  const Spacer(),
                  Expanded(
                    child: TextFormBox(
                      keyboardType: TextInputType.number,
                      controller: controller,
                      placeholder: 'How many copies?',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Finish: '),
                  const Spacer(),
                  Expanded(
                    child: FinishesSelection(
                      card: card,
                      onChanged: (value) {
                        finish = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Button(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Cancel'),
            ),
            Button(
              onPressed: () {
                final copies = int.tryParse(controller.text.trim(), radix: 10);
                if ((copies == null || copies <= 0) && finish == null) {
                  showSnackbar(
                    context,
                    const StatusSnackbar(
                      message: 'Please enter a valid number of copies and finish',
                      extended: true,
                    ),
                  );
                } else if ((copies == null || copies <= 0) && finish != null) {
                  showSnackbar(
                    context,
                    const StatusSnackbar(
                      message: 'Please enter a valid number of copies',
                      extended: true,
                    ),
                  );
                } else if ((copies != null && copies > 0) && finish == null) {
                  showSnackbar(
                    context,
                    const StatusSnackbar(
                      message: 'Please enter a valid finish',
                      extended: true,
                    ),
                  );
                } else {
                  return Navigator.pop(
                    context,
                    CardEntry(
                      id: m.ObjectId(),
                      card: card.copyWith(isFoil: (finish! == 'Foil') ? true : false),
                      quantity: copies!,
                      finish: finish!,
                      price: card.getPrice('usd', finish!),
                      currency: 'usd',
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      final duplicate = await cardDatabase.checkDuplicate(result);
      if (duplicate) {
        showSnackbar(
          context,
          const StatusSnackbar(
            message: 'This card is already in your collection',
            extended: true,
          ),
        );
      } else {
        await cardDatabase.insert(result);
        showSnackbar(
          context,
          StatusSnackbar(
            message: 'Added ${result.quantity}x ${result.card.name} (${result.finish}) to collection',
            extended: true,
          ),
        );
      }
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardNotifier(),
      builder: (context, _) {
        final cardNotifier = context.watch<CardNotifier>();
        return Builder(
          builder: (context) {
            return NavigationView(
              appBar: NavigationAppBar(
                automaticallyImplyLeading: true,
                title: () {
                  if (kIsWeb) {
                    return const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(appTitle),
                    );
                  }
                  return const DragToMoveArea(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(appTitle),
                    ),
                  );
                }(),
                actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  if (!kIsWeb) WindowButtons(),
                ]),
              ),
              content: ScaffoldPage(
                header: PageHeader(
                  title: Text(card.name),
                  commandBar: CommandBar(
                    overflowBehavior: CommandBarOverflowBehavior.noWrap,
                    primaryItems: [
                      CommandBarButton(
                        icon: const Icon(FluentIcons.add),
                        label: const Text('Add'),
                        onPressed: () {
                          showAddDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
                content: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: FluentTheme.of(context).brightness.isDark
                                      ? FluentTheme.of(context).resources.dividerStrokeColorDefault
                                      : Colors.grey[100],
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Builder(
                                builder: (context) {
                                  List<Widget> widgets = [];
                                  if (card.faces.length > 1) {
                                    if (cardNotifier.isFlipped) {
                                      if (card.faces[1].name.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(title: 'Name:', value: card[Side.back].name),
                                        );
                                      }
                                      if (card.faces[1].manaCost.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(title: 'Mana Cost:', manaString: card[Side.back].manaCost),
                                        );
                                      }
                                      if (card.faces[1].type.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(title: 'Type Line:', value: card[Side.back].type),
                                        );
                                      }
                                      if (card[Side.back].oracleText.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(
                                            title: 'Oracle Text:',
                                            manaString: card[Side.back].oracleText,
                                            textAlign: TextAlign.justify,
                                          ),
                                        );
                                      }
                                      if (card[Side.back].producedMana.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(
                                            title: 'Produced Mana:',
                                            manaString: card[Side.back].producedMana.join(''),
                                          ),
                                        );
                                      }
                                      if (card[Side.back].power.isNotEmpty && card[Side.back].toughness.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(
                                            title: 'Power/Toughness:',
                                            value: '${card[Side.back].power}/${card[Side.back].toughness}',
                                          ),
                                        );
                                      }
                                      if (card[Side.back].loyalty.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(
                                            title: 'Loyalty:',
                                            value: card[Side.back].loyalty,
                                          ),
                                        );
                                      }
                                    } else {
                                      if (card[Side.front].name.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(title: 'Name:', value: card[Side.front].name),
                                        );
                                      }
                                      if (card[Side.front].manaCost.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(title: 'Mana Cost:', manaString: card[Side.front].manaCost),
                                        );
                                      }
                                      if (card[Side.front].type.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(title: 'Type Line:', value: card[Side.front].type),
                                        );
                                      }
                                      if (card[Side.front].oracleText.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(
                                            title: 'Oracle Text:',
                                            manaString: card[Side.front].oracleText,
                                            textAlign: TextAlign.justify,
                                          ),
                                        );
                                      }
                                      if (card[Side.front].producedMana.isNotEmpty) {
                                        widgets.add(
                                          CardInfoMana(
                                            title: 'Produced Mana:',
                                            manaString: card[Side.front].producedMana.join(''),
                                          ),
                                        );
                                      }
                                      if (card[Side.front].power.isNotEmpty && card[Side.front].toughness.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(
                                            title: 'Power/Toughness:',
                                            value: '${card[Side.front].power}/${card[Side.front].toughness}',
                                          ),
                                        );
                                      }
                                      if (card[Side.front].loyalty.isNotEmpty) {
                                        widgets.add(
                                          CardInfoText(
                                            title: 'Loyalty:',
                                            value: card[Side.front].loyalty,
                                          ),
                                        );
                                      }
                                    }
                                  } else {
                                    if (card[Side.front].name.isNotEmpty) {
                                      widgets.add(
                                        CardInfoText(title: 'Name:', value: card[Side.front].name),
                                      );
                                    }
                                    if (card[Side.front].manaCost.isNotEmpty) {
                                      widgets.add(
                                        CardInfoMana(title: 'Mana Cost:', manaString: card[Side.front].manaCost),
                                      );
                                    }
                                    if (card[Side.front].type.isNotEmpty) {
                                      widgets.add(
                                        CardInfoText(title: 'Type Line:', value: card[Side.front].type),
                                      );
                                    }
                                    if (card[Side.front].oracleText.isNotEmpty) {
                                      widgets.add(
                                        CardInfoMana(
                                          title: 'Oracle Text:',
                                          manaString: card[Side.front].oracleText,
                                          textAlign: TextAlign.justify,
                                        ),
                                      );
                                    }
                                    if (card[Side.front].producedMana.isNotEmpty) {
                                      widgets.add(
                                        CardInfoMana(
                                          title: 'Produced Mana:',
                                          manaString: card[Side.front].producedMana.join(''),
                                        ),
                                      );
                                    }
                                    if (card[Side.front].power.isNotEmpty && card[Side.front].toughness.isNotEmpty) {
                                      widgets.add(
                                        CardInfoText(
                                          title: 'Power/Toughness:',
                                          value: '${card[Side.front].power}/${card[Side.front].toughness}',
                                        ),
                                      );
                                    }
                                    if (card[Side.front].loyalty.isNotEmpty) {
                                      widgets.add(
                                        CardInfoText(
                                          title: 'Loyalty:',
                                          value: card[Side.front].loyalty,
                                        ),
                                      );
                                    }
                                  }
                                  if (card.rarity.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Rarity:',
                                        value: card.rarity,
                                      ),
                                    );
                                  }
                                  if (card.setName.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Set:',
                                        value: card.setName,
                                      ),
                                    );
                                  }
                                  if (card.cmc.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Converted Mana Cost:',
                                        value: card.cmc,
                                      ),
                                    );
                                  }
                                  if (card.legalities.isNotEmpty) {
                                    widgets.add(
                                      CardLegalities(
                                        card: card,
                                      ),
                                    );
                                  }
                                  if (card.prices.isNotEmpty) {
                                    widgets.add(
                                      CardPrices(
                                        card: card,
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                      itemBuilder: (context, index) {
                                        return widgets[index];
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          style: FluentTheme.of(context).dividerTheme.merge(
                                                const DividerThemeData(
                                                  thickness: 3,
                                                ),
                                              ),
                                        );
                                      },
                                      itemCount: widgets.length);
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: (card.faces.length > 1)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlippableCardWidget(card: card),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CardWidget(
                                    card: card,
                                    side: Side.front,
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CardDetailsCollection extends StatefulWidget {
  const CardDetailsCollection({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final CardEntry entry;

  @override
  State<CardDetailsCollection> createState() => _CardDetailsCollectionState();
}

class _CardDetailsCollectionState extends State<CardDetailsCollection> {
  int _quantity = 1;
  MTGCardOld _card = MTGCardOld.empty();

  @override
  void initState() {
    super.initState();
    _quantity = widget.entry.quantity;
    _card = widget.entry.card;
  }

  void showUpdateDialog(BuildContext context) async {
    final result = await showDialog<CardEntry>(
      context: context,
      builder: (context) {
        final controller = TextEditingController.fromValue(
          TextEditingValue(
            text: _quantity.toString(),
          ),
        );
        return ContentDialog(
          title: const Text('Update Card Quantity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text('Copies: '),
                  const Spacer(),
                  Expanded(
                    child: TextFormBox(
                      keyboardType: TextInputType.number,
                      controller: controller,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Button(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Cancel'),
            ),
            Button(
              onPressed: () {
                final copies = int.tryParse(controller.text.trim(), radix: 10);
                if ((copies == null || copies <= 0)) {
                  showSnackbar(
                    context,
                    const StatusSnackbar(
                      message: 'Please enter a valid number of copies',
                      extended: true,
                    ),
                  );
                } else {
                  return Navigator.pop(
                    context,
                    widget.entry.copyWith(quantity: copies),
                  );
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      await cardDatabase.update(result);
      showSnackbar(
        context,
        const StatusSnackbar(
          message: 'Card updated',
          extended: true,
        ),
      );
      setState(() {
        _quantity = result.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = context.watch<SettingsNotifier>();
    return ChangeNotifierProvider(
      create: (_) => CardNotifier(),
      builder: (context, _) {
        final cardNotifier = context.watch<CardNotifier>();
        return NavigationView(
          appBar: NavigationAppBar(
            automaticallyImplyLeading: true,
            title: () {
              if (kIsWeb) {
                return const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(appTitle),
                );
              }
              return const DragToMoveArea(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(appTitle),
                ),
              );
            }(),
            actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
              if (!kIsWeb) WindowButtons(),
            ]),
          ),
          content: ScaffoldPage(
            header: PageHeader(
              title: Text(_card.name),
              commandBar: CommandBar(
                overflowBehavior: CommandBarOverflowBehavior.noWrap,
                primaryItems: [
                  CommandBarButton(
                    icon: const Icon(FluentIcons.sync),
                    label: const Text('Update'),
                    onPressed: () {
                      showUpdateDialog(
                        context,
                      );
                    },
                  ),
                  CommandBarButton(
                    icon: const Icon(FluentIcons.refresh),
                    label: const Text('Refresh'),
                    onPressed: () async {
                      final card = await Utils.refreshCard(_card);
                      await cardDatabase.update(
                        widget.entry.copyWith(
                            card: card.copyWith(
                              isFoil: (_card.isFoil),
                            ),
                            price: card.getPrice('usd', widget.entry.finish)),
                      );
                      setState(() {
                        _card = card;
                      });
                    },
                  ),
                  CommandBarButton(
                    icon: const Icon(FluentIcons.delete),
                    label: const Text('Delete'),
                    onPressed: () async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return ContentDialog(
                            title: const Text('Delete Card'),
                            content: const Text('Are you sure you want to delete this card?'),
                            actions: [
                              Button(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              Button(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                      if (result == true) {
                        await cardDatabase.delete(widget.entry);
                        showSnackbar(
                          context,
                          const StatusSnackbar(
                            message: 'Card deleted',
                            extended: true,
                          ),
                        );
                        Navigator.pop(context, true);
                      }
                    },
                  ),
                ],
              ),
            ),
            content: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FluentTheme.of(context).brightness.isDark
                                  ? FluentTheme.of(context).resources.dividerStrokeColorDefault
                                  : Colors.grey[100],
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Builder(
                            builder: (context) {
                              List<Widget> widgets = [];
                              if (_card.faces.length > 1) {
                                if (cardNotifier.isFlipped) {
                                  if (_card.faces[1].name.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(title: 'Name:', value: _card[Side.back].name),
                                    );
                                  }
                                  if (_quantity > 0) {
                                    widgets.add(
                                      CardInfoText(title: 'Quantity:', value: _quantity.toString()),
                                    );
                                  }
                                  if (_card.faces[1].manaCost.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(title: 'Mana Cost:', manaString: _card[Side.back].manaCost),
                                    );
                                  }
                                  if (_card.faces[1].type.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(title: 'Type Line:', value: _card[Side.back].type),
                                    );
                                  }
                                  if (_card[Side.back].oracleText.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(
                                        title: 'Oracle Text:',
                                        manaString: _card[Side.back].oracleText,
                                        textAlign: TextAlign.justify,
                                      ),
                                    );
                                  }
                                  if (_card[Side.back].producedMana.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(
                                        title: 'Produced Mana:',
                                        manaString: _card[Side.back].producedMana.join(''),
                                      ),
                                    );
                                  }
                                  if (_card[Side.back].power.isNotEmpty && _card[Side.back].toughness.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Power/Toughness:',
                                        value: '${_card[Side.back].power}/${_card[Side.back].toughness}',
                                      ),
                                    );
                                  }
                                  if (_card[Side.back].loyalty.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Loyalty:',
                                        value: _card[Side.back].loyalty,
                                      ),
                                    );
                                  }
                                } else {
                                  if (_card[Side.front].name.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(title: 'Name:', value: _card[Side.front].name),
                                    );
                                  }
                                  if (_quantity > 0) {
                                    widgets.add(
                                      CardInfoText(title: 'Quantity:', value: _quantity.toString()),
                                    );
                                  }
                                  if (_card[Side.front].manaCost.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(title: 'Mana Cost:', manaString: _card[Side.front].manaCost),
                                    );
                                  }
                                  if (_card[Side.front].type.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(title: 'Type Line:', value: _card[Side.front].type),
                                    );
                                  }
                                  if (_card[Side.front].oracleText.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(
                                        title: 'Oracle Text:',
                                        manaString: _card[Side.front].oracleText,
                                        textAlign: TextAlign.justify,
                                      ),
                                    );
                                  }
                                  if (_card[Side.front].producedMana.isNotEmpty) {
                                    widgets.add(
                                      CardInfoMana(
                                        title: 'Produced Mana:',
                                        manaString: _card[Side.front].producedMana.join(''),
                                      ),
                                    );
                                  }
                                  if (_card[Side.front].power.isNotEmpty && _card[Side.front].toughness.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Power/Toughness:',
                                        value: '${_card[Side.front].power}/${_card[Side.front].toughness}',
                                      ),
                                    );
                                  }
                                  if (_card[Side.front].loyalty.isNotEmpty) {
                                    widgets.add(
                                      CardInfoText(
                                        title: 'Loyalty:',
                                        value: _card[Side.front].loyalty,
                                      ),
                                    );
                                  }
                                }
                              } else {
                                if (_card[Side.front].name.isNotEmpty) {
                                  widgets.add(
                                    CardInfoText(title: 'Name:', value: _card[Side.front].name),
                                  );
                                }
                                if (_quantity > 0) {
                                  widgets.add(
                                    CardInfoText(title: 'Quantity:', value: _quantity.toString()),
                                  );
                                }
                                if (_card[Side.front].manaCost.isNotEmpty) {
                                  widgets.add(
                                    CardInfoMana(title: 'Mana Cost:', manaString: _card[Side.front].manaCost),
                                  );
                                }
                                if (_card[Side.front].type.isNotEmpty) {
                                  widgets.add(
                                    CardInfoText(title: 'Type Line:', value: _card[Side.front].type),
                                  );
                                }
                                if (_card[Side.front].oracleText.isNotEmpty) {
                                  widgets.add(
                                    CardInfoMana(
                                      title: 'Oracle Text:',
                                      manaString: _card[Side.front].oracleText,
                                      textAlign: TextAlign.justify,
                                    ),
                                  );
                                }
                                if (_card[Side.front].producedMana.isNotEmpty) {
                                  widgets.add(
                                    CardInfoMana(
                                      title: 'Produced Mana:',
                                      manaString: _card[Side.front].producedMana.join(''),
                                    ),
                                  );
                                }
                                if (_card[Side.front].power.isNotEmpty && _card[Side.front].toughness.isNotEmpty) {
                                  widgets.add(
                                    CardInfoText(
                                      title: 'Power/Toughness:',
                                      value: '${_card[Side.front].power}/${_card[Side.front].toughness}',
                                    ),
                                  );
                                }
                                if (_card[Side.front].loyalty.isNotEmpty) {
                                  widgets.add(
                                    CardInfoText(
                                      title: 'Loyalty:',
                                      value: _card[Side.front].loyalty,
                                    ),
                                  );
                                }
                              }
                              if (_card.rarity.isNotEmpty) {
                                widgets.add(
                                  CardInfoText(
                                    title: 'Rarity:',
                                    value: _card.rarity,
                                  ),
                                );
                              }
                              if (_card.setName.isNotEmpty) {
                                widgets.add(
                                  CardInfoText(
                                    title: 'Set:',
                                    value: _card.setName,
                                  ),
                                );
                              }
                              if (_card.cmc.isNotEmpty) {
                                widgets.add(
                                  CardInfoText(
                                    title: 'Converted Mana Cost:',
                                    value: _card.cmc,
                                  ),
                                );
                              }
                              if (_card.legalities.isNotEmpty) {
                                widgets.add(
                                  CardLegalities(
                                    card: _card,
                                  ),
                                );
                              }
                              if (widget.entry.price > Decimal.zero) {
                                widgets.add(
                                  FutureBuilder(
                                    future: currencyDatabase.getCurrency(settingsNotifier.currency),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CardInfoText(
                                          title: 'Price:',
                                          value: Utils.formatCurrency(
                                              settingsNotifier.currency,
                                              Utils.convertCurrency(settingsNotifier.currency, widget.entry.price,
                                                  snapshot.data!.exchangeRate)),
                                        );
                                      } else {
                                        return const CardInfoText(
                                          title: 'Price:',
                                          value: 'Loading...',
                                        );
                                      }
                                    },
                                  ),
                                );
                                if (_quantity > 0) {
                                  widgets.add(
                                    FutureBuilder(
                                      future: currencyDatabase.getCurrency(settingsNotifier.currency),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return CardInfoText(
                                            title: 'Total:',
                                            value: Utils.formatCurrency(
                                                settingsNotifier.currency,
                                                Utils.convertCurrency(
                                                    settingsNotifier.currency,
                                                    widget.entry.price * Decimal.parse(_quantity.toString()),
                                                    snapshot.data!.exchangeRate)),
                                          );
                                        } else {
                                          return const CardInfoText(
                                            title: 'Total:',
                                            value: 'Loading...',
                                          );
                                        }
                                      },
                                    ),
                                  );
                                }
                              }
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    return widgets[index];
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      style: FluentTheme.of(context).dividerTheme.merge(
                                            const DividerThemeData(
                                              thickness: 3,
                                            ),
                                          ),
                                    );
                                  },
                                  itemCount: widgets.length);
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: (_card.faces.length > 1)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlippableCardWidget(card: _card),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CardWidget(
                                card: _card,
                                side: Side.front,
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CardInfoMana extends StatelessWidget {
  const CardInfoMana({
    Key? key,
    required this.title,
    required this.manaString,
    this.textAlign = TextAlign.right,
  }) : super(key: key);

  final String title;
  final String manaString;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(title, style: FluentTheme.of(context).typography.body!.copyWith(fontSize: fontSize))),
          Expanded(
            flex: 3,
            child: MTGSymbolParser.parseString(manaString, textAlign: textAlign, size: fontSize),
          ),
        ],
      ),
    );
  }
}

class CardInfoText extends StatelessWidget {
  const CardInfoText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: FluentTheme.of(context).typography.body!.copyWith(
                  fontSize: fontSize,
                ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: SelectableText(
              (value.isNotEmpty) ? value.uppercaseFirst() : value,
              textAlign: TextAlign.right,
              style: FluentTheme.of(context).typography.body!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardLegalities extends StatelessWidget {
  const CardLegalities({
    Key? key,
    required this.card,
  }) : super(key: key);

  final MTGCardOld card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
      child: Row(
        children: <Widget>[
          Text(
            'Legalities:',
            style: FluentTheme.of(context).typography.body!.copyWith(
                  fontSize: fontSize,
                ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: Wrap(
              spacing: 2.0,
              runSpacing: 2.0,
              children: card.legalities
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: (e.legality == 'legal')
                                ? Colors.green
                                : (e.legality == 'banned')
                                    ? Colors.red
                                    : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            '${e.formattedFormat}: ${e.formattedLegality}',
                            style: FluentTheme.of(context).typography.body!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CardPrices extends StatelessWidget {
  const CardPrices({
    Key? key,
    required this.card,
  }) : super(key: key);

  final MTGCardOld card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
      child: Row(
        children: <Widget>[
          Text(
            'Prices:',
            style: FluentTheme.of(context).typography.body!.copyWith(
                  fontSize: fontSize,
                ),
          ),
          Expanded(
            child: Builder(builder: (context) {
              final List<TableRow> prices = <TableRow>[];
              const columns = 3;
              for (int i = 0; i < card.prices.length / columns; i++) {
                List<TableCell> row = <TableCell>[];
                for (int j = 0; j < columns; j++) {
                  if (i * columns + j < card.prices.length) {
                    row.add(
                      TableCell(
                        child: Text(
                          '${card.prices[i * columns + j].formattedCurrency}: ${card.prices[i * columns + j].formattedPrice}',
                          textAlign: TextAlign.right,
                          style: FluentTheme.of(context).typography.body!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize - 2,
                              ),
                        ),
                      ),
                    );
                  } else {
                    row.add(
                      const TableCell(
                        child: SizedBox(),
                      ),
                    );
                  }
                }
                prices.add(TableRow(children: row));
              }

              return Table(
                children: prices,
              );
            }),
          ),
        ],
      ),
    );
  }
}
