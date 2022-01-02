import 'package:flutter/material.dart';
import 'package:gow_memory_game/theme.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'images/logo.png',
            width: 180,
            height: 140,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
                text: 'God of War ',
                style:
                    DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
                children: const [
                  TextSpan(
                    text: 'Memory',
                    style: TextStyle(color: GodOfWarTheme.color),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
