///@nodoc

import 'dart:convert';
import 'dart:io';

import 'package:cron/cron.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:mtg_cards/databases.dart';
import 'package:mtg_cards/notifiers.dart';
import 'package:mtg_cards/pages.dart';
import 'package:mtg_cards/src/models/mtg_card.dart';
import 'package:mtg_cards/src/models/mtg_card_old.dart';
import 'package:mtg_cards/utils.dart';
import 'package:provider/provider.dart';
import 'package:mtg_cards/theme.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

const String appTitle = "MTG Cards";

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.android,
      ].contains(defaultTargetPlatform)) {
    SystemTheme.accentColor.load();
  }
  await cardDatabase.connect();
  await currencyDatabase.connect();
  await settings.loadSettings();
  //await Utils.updateCards();
  await Utils.updateExhangeRates();
  if (isDesktop) {
    await flutter_acrylic.Window.initialize();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setSize(const Size(1200, 720));
      await windowManager.setMinimumSize(const Size(826, 540));
      await windowManager.center();
      await windowManager.show();
      await windowManager.setSkipTaskbar(false);
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return ChangeNotifierProvider(
          create: (_) => UpdateNotifier(),
          builder: (context, _) {
            final updateNotifier = context.watch<UpdateNotifier>();
            return ChangeNotifierProvider(
                create: (_) => SettingsNotifier(),
                builder: (context, _) {
                  return FluentApp(
                    title: appTitle,
                    themeMode: appTheme.mode,
                    debugShowCheckedModeBanner: false,
                    color: appTheme.color,
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      accentColor: appTheme.color,
                      visualDensity: VisualDensity.standard,
                      focusTheme: FocusThemeData(
                        glowFactor: is10footScreen() ? 2.0 : 0.0,
                      ),
                    ),
                    theme: ThemeData(
                      accentColor: appTheme.color,
                      visualDensity: VisualDensity.standard,
                      dividerTheme: DividerThemeData(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                      ),
                      focusTheme: FocusThemeData(
                        glowFactor: is10footScreen() ? 2.0 : 0.0,
                      ),
                    ),
                    locale: appTheme.locale,
                    builder: (context, child) {
                      final cron = Cron();

                      cron.schedule(Schedule.parse('30 0 * * *'), () async {
                        await Utils.updateCards();
                        updateNotifier.update = !updateNotifier.update;
                      });

                      return Directionality(
                        textDirection: appTheme.textDirection,
                        child: NavigationPaneTheme(
                          data: NavigationPaneThemeData(
                            backgroundColor: appTheme.windowEffect != flutter_acrylic.WindowEffect.disabled
                                ? Colors.transparent
                                : null,
                          ),
                          child: child!,
                        ),
                      );
                    },
                    initialRoute: '/',
                    routes: {'/': (context) => const MyHomePage()},
                  );
                });
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  int index = 0;
  final viewKey = GlobalKey();

  final key = GlobalKey();
  final List<NavigationPaneItem> _items = [
    PaneItem(
      title: const Text('Home'),
      icon: const Icon(FluentIcons.home),
      body: const HomePage(),
    ),
    PaneItem(
      title: const Text('Search'),
      icon: const Icon(FluentIcons.search),
      body: const CardSearch(),
    ),
    PaneItem(
      title: const Text('Collection'),
      icon: const Icon(FluentIcons.library),
      body: const CardCollectionBuilder(),
    ),
  ];

  late List<NavigationPaneItem> items = _items;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final appTheme = context.watch<AppTheme>();
    return NavigationView(
      key: viewKey,
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
      pane: NavigationPane(
        selected: () {
          return index;
        }(),
        onChanged: (i) {
          setState(() => index = i);
        },
        displayMode: appTheme.displayMode,
        indicator: () {
          switch (appTheme.indicator) {
            case NavigationIndicators.end:
              return const EndNavigationIndicator();
            case NavigationIndicators.sticky:
            default:
              return const StickyNavigationIndicator();
          }
        }(),
        size: const NavigationPaneSize(openWidth: 150),
        items: items,
        footerItems: [
          PaneItem(
            title: const Text('Settings'),
            icon: const Icon(FluentIcons.settings),
            body: const SettingsPage(),
          ),
        ],
      ),
    );
  }

  @override
  void onWindowClose() async {
    await settings.saveSettings();
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
