import 'package:flutter/material.dart';
import 'package:gow_memory_game/game_settings.dart';
import 'package:gow_memory_game/models/game_play.dart';
import 'package:gow_memory_game/widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final GamePlay gamePlay;

  const NivelPage({Key? key, required this.gamePlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final niveis =
        GameSettings.niveis.map((n) => CardNivel(gamePlay: gamePlay)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nível do Jogo"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
