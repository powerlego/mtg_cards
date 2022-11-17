import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/pages.dart';

/// A Fluent Design themed Settings page that allows the user to change the currency and the theme of the app as well as other settings in the future
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Settings'),
      ),
      content: ListView(
        children: [
          ListTile(
            title: const Text('Currency'),
            subtitle: const Text('Change the currency used for prices'),
            trailing: const Icon(FluentIcons.chevron_right),
            onPressed: () {
              Navigator.of(context).push(FluentPageRoute(
                builder: (context) => const CurrencyPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
