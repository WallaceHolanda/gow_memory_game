import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gow_memory_game/game_settings.dart';
import 'package:gow_memory_game/models/game_play.dart';
import 'package:gow_memory_game/widgets/card_game.dart';
import 'package:gow_memory_game/widgets/game_score.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScore(modo: gamePlay.modo),
      ),
      //body: const FeedbackGame(resultado: Resultado.eliminado),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(24),
          children: List.generate(
            gamePlay.nivel,
            (index) => CardGame(
              modo: gamePlay.modo,
              opcao: Random().nextInt(14),
            ),
          ),
        ),
      ),
    );
  }
}
