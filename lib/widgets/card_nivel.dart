import 'package:flutter/material.dart';
import 'package:gow_memory_game/controllers/game_controller.dart';
import 'package:gow_memory_game/models/game_play.dart';
import 'package:gow_memory_game/pages/game_page.dart';
import 'package:gow_memory_game/theme.dart';
import 'package:provider/src/provider.dart';
import '../constantes.dart';

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;

  const CardNivel({Key? key, required this.gamePlay}) : super(key: key);

  startGame(BuildContext context) {
    // Iniciando o jogo antes de ir para a tela
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.modo == Modo.mortal
                ? Colors.white
                : GodOfWarTheme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.mortal
              ? Colors.transparent
              : GodOfWarTheme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
