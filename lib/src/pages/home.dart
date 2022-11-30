import 'package:decimal/decimal.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/models.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/pages.dart';
import 'package:mtg_cards/utils.dart';
import 'package:mtg_cards/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final updateNotifier = context.watch<UpdateNotifier>();
    final settingsNotifier = context.watch<SettingsNotifier>();
    return ChangeNotifierProvider(
      create: (_) => CardNotifier(),
      builder: (context, _) {
        return ScaffoldPage(
          header: PageHeader(
            title: const Text('Home'),
            commandBar: CommandBar(
              overflowBehavior: CommandBarOverflowBehavior.noWrap,
              primaryItems: [
                CommandBarButton(
                  icon: const Icon(FluentIcons.refresh),
                  label: const Text('Refresh'),
                  onPressed: () {
                    Utils.updateCards();
                    updateNotifier.update = !updateNotifier.update;
                  },
                )
              ],
            ),
          ),
          content: Row(
            children: [
              Expanded(
                flex: 1,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder(
                          future: cardDatabase.totalCardCount(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: ProgressRing());
                            } else {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'Something went wrong, try again.  ${snapshot.error}',
                                    style: FluentTheme.of(context).typography.bodyLarge,
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Total Cards: ',
                                        style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 5,
                                        child: SelectableText(
                                          snapshot.data.toString(),
                                          textAlign: TextAlign.right,
                                          style: FluentTheme.of(context).typography.body!.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        Divider(
                            style: FluentTheme.of(context).dividerTheme.merge(const DividerThemeData(thickness: 3))),
                        FutureBuilder(
                          future: cardDatabase.getColorCount(),
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
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Color Count: ',
                                        style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 5,
                                        child: Builder(
                                          builder: (context) {
                                            final colorCount = snapshot.data as Map<String, int>;
                                            return Wrap(
                                              spacing: 5,
                                              children: colorCount.entries
                                                  .map(
                                                    ((e) => Text(
                                                          '${e.key.uppercaseFirst()}: ${e.value}',
                                                          style: FluentTheme.of(context).typography.body!.copyWith(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16,
                                                              ),
                                                        )),
                                                  )
                                                  .toList(),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        Divider(
                            style: FluentTheme.of(context).dividerTheme.merge(const DividerThemeData(thickness: 3))),
                        FutureBuilder(
                          future: cardDatabase.getTotalCollectionPrice(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: ProgressRing());
                            } else {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'Something went wrong, try again. ${snapshot.error}',
                                    style: FluentTheme.of(context).typography.bodyLarge,
                                  ),
                                );
                              } else {
                                final totalCollectionPrice = Price(price: Decimal.parse(snapshot.data.toString()));
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Total Collection Value: ',
                                        style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 5,
                                        child: FutureBuilder(
                                          future: totalCollectionPrice.formattedPriceIn(settingsNotifier.currency),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return const Center(child: ProgressRing());
                                            } else {
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(
                                                    'Something went wrong, try again. ${snapshot.error}',
                                                    style: FluentTheme.of(context).typography.bodyLarge,
                                                  ),
                                                );
                                              } else {
                                                return SelectableText(
                                                  snapshot.data!,
                                                  textAlign: TextAlign.right,
                                                  style: FluentTheme.of(context).typography.body!.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: cardDatabase.getMostExpensiveCard(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: ProgressRing());
                    } else {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Something went wrong, try again. ${snapshot.error}',
                            style: FluentTheme.of(context).typography.bodyLarge,
                          ),
                        );
                      } else {
                        final cardEntry = snapshot.data as CardEntry;
                        final card = cardEntry.card;
                        return (cardEntry.quantity == 0)
                            ? Center(
                                child: Text(
                                  "No Cards in Collection",
                                  style: FluentTheme.of(context).typography.title,
                                ),
                              )
                            : Column(
                                children: [
                                  Text("Most Expensive Card", style: FluentTheme.of(context).typography.title),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 10,
                                    runSpacing: 5,
                                    children: [
                                      Text('Name: ${card.name}'),
                                      FutureBuilder(
                                        future: cardEntry.price.formattedPriceIn(settingsNotifier.currency),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(snapshot.data!);
                                          } else {
                                            return const Center(child: ProgressRing());
                                          }
                                        },
                                      ),
                                      Button(
                                        onPressed: () async {
                                          await Navigator.of(context).push(FluentPageRoute(
                                            builder: (context) => CardDetailsCollection(entry: cardEntry),
                                          ));
                                          setState(() {});
                                        },
                                        child: const Text("More Info..."),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    flex: 2,
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
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
