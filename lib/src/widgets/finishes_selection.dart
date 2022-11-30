import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/models.dart';

class FinishesSelection extends StatefulWidget {
  const FinishesSelection({
    super.key,
    required this.card,
    required this.onChanged,
  });
  final MTGCard card;
  final Function(String?)? onChanged;

  @override
  State<FinishesSelection> createState() => _FinishesSelectionState();
}

class _FinishesSelectionState extends State<FinishesSelection> {
  String? _finish;

  @override
  void initState() {
    super.initState();
    if (widget.card.finishes.length == 1) {
      _finish = widget.card.finishes.first.display;
      widget.onChanged!(_finish);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.card.finishes.length == 1)
        ? ComboBox<String>(
            value: _finish,
            items: widget.card.finishes.map(
              (e) {
                return ComboBoxItem<String>(
                  value: e.display,
                  child: Text(e.display),
                );
              },
            ).toList(),
          )
        : ComboBox<String>(
            placeholder: const Text("Select a finish"),
            value: _finish,
            onChanged: (String? value) {
              setState(() {
                _finish = value;
              });
              widget.onChanged!(value);
            },
            items: widget.card.finishes.map(
              (e) {
                return ComboBoxItem<String>(
                  value: e.display,
                  child: Text(e.display),
                );
              },
            ).toList(),
          );
  }
}
