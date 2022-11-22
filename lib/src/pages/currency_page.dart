import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/src/notifiers/settings_notifier.dart';
import 'package:provider/provider.dart';

/// A class that allow the user to change the currency used for prices
class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);
  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  late String _currency;
  final List<String> _currencies = [
    "aed",
    "afn",
    "all",
    "amd",
    "ang",
    "aoa",
    "ars",
    "aud",
    "awg",
    "azn",
    "bam",
    "bbd",
    "bdt",
    "bgn",
    "bhd",
    "bif",
    "bmd",
    "bnd",
    "bob",
    "brl",
    "bsd",
    "btc",
    "btn",
    "bwp",
    "byn",
    "bzd",
    "cad",
    "cdf",
    "chf",
    "clf",
    "clp",
    "cnh",
    "cny",
    "cop",
    "crc",
    "cuc",
    "cup",
    "cve",
    "czk",
    "djf",
    "dkk",
    "dop",
    "dzd",
    "egp",
    "ern",
    "etb",
    "eur",
    "fjd",
    "fkp",
    "gbp",
    "gel",
    "ggp",
    "ghs",
    "gip",
    "gmd",
    "gnf",
    "gtq",
    "gyd",
    "hkd",
    "hnl",
    "hrk",
    "htg",
    "huf",
    "idr",
    "ils",
    "imp",
    "inr",
    "iqd",
    "irr",
    "isk",
    "jep",
    "jmd",
    "jod",
    "jpy",
    "kes",
    "kgs",
    "khr",
    "kmf",
    "kpw",
    "krw",
    "kwd",
    "kyd",
    "kzt",
    "lak",
    "lbp",
    "lkr",
    "lrd",
    "lsl",
    "lyd",
    "mad",
    "mdl",
    "mga",
    "mkd",
    "mmk",
    "mnt",
    "mop",
    "mru",
    "mur",
    "mvr",
    "mwk",
    "mxn",
    "myr",
    "mzn",
    "nad",
    "ngn",
    "nio",
    "nok",
    "npr",
    "nzd",
    "omr",
    "pab",
    "pen",
    "pgk",
    "php",
    "pkr",
    "pln",
    "pyg",
    "qar",
    "ron",
    "rsd",
    "rub",
    "rwf",
    "sar",
    "sbd",
    "scr",
    "sdg",
    "sek",
    "sgd",
    "shp",
    "sll",
    "sos",
    "srd",
    "ssp",
    "std",
    "stn",
    "svc",
    "syp",
    "szl",
    "thb",
    "tjs",
    "tmt",
    "tnd",
    "top",
    "try",
    "ttd",
    "twd",
    "tzs",
    "uah",
    "ugx",
    "usd",
    "uyu",
    "uzs",
    "ves",
    "vnd",
    "vuv",
    "wst",
    "xaf",
    "xag",
    "xau",
    "xcd",
    "xdr",
    "xof",
    "xpd",
    "xpf",
    "xpt",
    "yer",
    "zar",
    "zmw",
    "zwl",
  ];

  @override
  void initState() {
    super.initState();
    _currency = settings.currency;
  }

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = context.watch<SettingsNotifier>();
    return ScaffoldPage(
      header: const PageHeader(title: Text('Currency')),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (final currency in _currencies)
                    ListTile.selectable(
                      title: Text(currency.toUpperCase()),
                      selected: _currency == currency,
                      onPressed: () => setState(() => _currency = currency),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Button(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Button(
                      onPressed: () {
                        settingsNotifier.currency = _currency;
                        settings.saveSettings();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
