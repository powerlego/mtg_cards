import 'package:fluent_ui/fluent_ui.dart';

class StatusSnackbar extends StatelessWidget {
  final String message;
  final bool extended;
  const StatusSnackbar(
      {super.key, required this.message, this.extended = false});

  @override
  Widget build(BuildContext context) {
    return Snackbar(
      content: Text(
        message,
        style: FluentTheme.of(context)
            .typography
            .body!
            .copyWith(color: Colors.white),
      ),
      extended: extended,
    );
  }
}
