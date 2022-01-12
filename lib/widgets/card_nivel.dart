import 'package:flutter/material.dart';
import 'package:gow_memory_game/theme.dart';
import '../constantes.dart';

class CardNivel extends StatelessWidget {
  final Modo modo;
  final int nivel;

  const CardNivel({Key? key, required this.modo, required this.nivel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: modo == Modo.mortal ? Colors.white : GodOfWarTheme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: modo == Modo.mortal
              ? Colors.transparent
              : GodOfWarTheme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(
            nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
