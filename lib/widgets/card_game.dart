import 'dart:async';
import 'dart:math';

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
    if (!animation.isAnimating) {
      animation.forward(); //Faz com que a carta 'vire'
      Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  // Caso a carta tenha atingido 90 graus, a imagem aparecerá
  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi || angulo == 0.2 * pi) {
      return const AssetImage(
          'images/atreus.png'); // Substituir por ${widget.opcao.toString()}
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
