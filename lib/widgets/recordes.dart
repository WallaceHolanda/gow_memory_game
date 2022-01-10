import 'package:flutter/material.dart';
import 'package:gow_memory_game/pages/recordes_page.dart';
import 'package:gow_memory_game/theme.dart';

import '../constantes.dart';

class Recordes extends StatefulWidget {
  const Recordes({Key? key}) : super(key: key);

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: GodOfWarTheme.color,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Mortal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showRecordes(Modo.mortal);
              },
            ),
            ListTile(
              title: const Text('Modo God of War'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showRecordes(Modo.godOfWar);
              }, //,
            ),
          ],
        ),
      ),
    );
  }
}
