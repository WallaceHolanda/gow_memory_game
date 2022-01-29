import 'package:flutter/material.dart';
import 'package:gow_memory_game/constantes.dart';

class GameScore extends StatelessWidget {
  final Modo modo;
  const GameScore({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.godOfWar
                ? Icons.my_location
                : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            const Text('18', style: TextStyle(fontSize: 25)),
          ],
        ),
        Image.asset('images/logo.png', width: 60, height: 45),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Sair',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
