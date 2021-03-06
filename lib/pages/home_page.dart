import 'package:flutter/material.dart';
import 'package:gow_memory_game/constantes.dart';
import 'package:gow_memory_game/pages/nivel_page.dart';
import 'package:gow_memory_game/theme.dart';
import 'package:gow_memory_game/widgets/logo.dart';
import 'package:gow_memory_game/widgets/recordes.dart';
import 'package:gow_memory_game/widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Mortal',
              color: Colors.white,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NivelPage(modo: Modo.mortal),
                  ),
                );
              },
            ),
            StartButton(
              title: 'Modo God of War',
              color: GodOfWarTheme.color.shade900,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NivelPage(modo: Modo.godOfWar),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            const Recordes(),
          ],
        ),
      ),
    );
  }
}
