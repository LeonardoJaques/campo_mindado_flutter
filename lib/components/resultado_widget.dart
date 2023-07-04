import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final bool perdeu;
  final dynamic Function() onReiniciar;

  const ResultadoWidget(
      {Key? key,
      required this.venceu,
      required this.perdeu,
      required this.onReiniciar})
      : super(key: key);

  Color? _getCor() {
    if (venceu) {
      return Colors.green[300];
    } else if (perdeu) {
      return Colors.red[300];
    } else {
      return Colors.yellow[300];
    }
  }

  Icon _getIcon() {
    if (venceu) {
      return Icon(Icons.sentiment_very_satisfied);
    } else if (perdeu) {
      return Icon(Icons.sentiment_very_dissatisfied);
    } else {
      return Icon(Icons.sentiment_satisfied);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: _getIcon(),
              onPressed: onReiniciar as void Function()?,
            ),
          ),
        )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
