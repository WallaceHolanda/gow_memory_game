import 'package:flutter/material.dart';
import '../constantes.dart';

class RecordesPage extends StatefulWidget {
  final Modo modo;
  //final List<String> recs = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];

  const RecordesPage({Key? key, required this.modo}) : super(key: key);

  @override
  State<RecordesPage> createState() => _RecordesPageState();
}

class _RecordesPageState extends State<RecordesPage> {
  getModo() {
    return widget.modo == Modo.mortal ? 'Mortal' : 'God of War';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
    );
  }
}
