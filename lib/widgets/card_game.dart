import 'package:flutter/material.dart';
import 'package:gow_memory_game/constantes.dart';
import 'package:gow_memory_game/theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int opcao;

  const CardGame({
    Key? key,
    required this.modo,
    required this.opcao,
  }) : super(key: key);

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:
              widget.modo == Modo.mortal ? Colors.white : GodOfWarTheme.color,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: widget.modo == Modo.mortal
              ? const AssetImage('images/cardMortal.png')
              : const AssetImage('images/cardGow.png'),
        ),
      ),
    );
  }
}
