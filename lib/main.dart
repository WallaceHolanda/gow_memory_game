import 'package:flutter/material.dart';
import 'package:gow_memory_game/pages/home_page.dart';
import 'package:gow_memory_game/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GodOfWarTheme.theme,
      home: HomePage(),
    );
  }
}
