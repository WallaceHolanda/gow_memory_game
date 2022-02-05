import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gow_memory_game/constantes.dart';
import 'package:gow_memory_game/models/game_opcao.dart';
import 'package:gow_memory_game/theme.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final GameOpcao gameOpcao;

  const CardGame({
    Key? key,
    required this.modo,
    required this.gameOpcao,
  }) : super(key: key);

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    final game = context.read<GameController>();

    bool cartaSemMatch = !widget.gameOpcao.matched;
    bool cartaNaoSelecionada = !widget.gameOpcao.selected;
    bool jogadaIncompleta = !game.jogadaCompleta;

    if (!animation.isAnimating &&
        cartaSemMatch &&
        cartaNaoSelecionada &&
        jogadaIncompleta) {
      animation.forward(); //Faz com que a carta 'vire'
      game.escolher(widget.gameOpcao, resetCard);
    }
  }

  resetCard() {
    animation.reverse();
  }

  // Caso a carta tenha atingido 90 graus, a imagem aparecerá
  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi || angulo == 0.2 * pi) {
      return AssetImage(
          'images/${widget.gameOpcao.opcao.toString()}.png'); // Substituir por atreus.png
    } else {
      return widget.modo == Modo.mortal
          ? const AssetImage('images/cardMortal.png')
          : const AssetImage('images/cardGow.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angulo = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.modo == Modo.mortal
                      ? Colors.white
                      : GodOfWarTheme.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: getImage(angulo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
