import 'package:flutter/material.dart';
import 'package:statefulclickcounter/view/camara.dart';
import 'package:statefulclickcounter/widgets/navigation/bottom_navigation%20copy.dart'; // Asegúrate de que la ruta sea correcta

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Usamos HomeScreen como la pantalla inicial
    );
  }
}
