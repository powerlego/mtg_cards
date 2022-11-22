import 'package:fluent_ui/fluent_ui.dart';
import 'package:mtg_cards/models.dart';

class FinishesSelection extends StatefulWidget {
  const FinishesSelection({
    super.key,
    required this.card,
    required this.onChanged,
  });
  final MTGCardOld card;
  final Function(String?)? onChanged;

  @override
  State<FinishesSelection> createState() => _FinishesSelectionState();
}

class _FinishesSelectionState extends State<FinishesSelection> {
  String? _finish;

  @override
  void initState() {
    super.initState();
    if (widget.card.formattedFinishes.keys.length == 1) {
      _finish = widget.card.formattedFinishes.keys.first;
      widget.onChanged!(_finish);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.card.formattedFinishes.keys.length == 1)
        ? ComboBox<String>(
            value: _finish,
            items: widget.card.formattedFinishes.keys.map(
              (e) {
                return ComboBoxItem<String>(
                  value: e,
                  child: Text(e),
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
            items: widget.card.formattedFinishes.keys.map(
              (e) {
                return ComboBoxItem<String>(
                  value: e,
                  child: Text(e),
                );
              },
            ).toList(),
          );
  }
}
