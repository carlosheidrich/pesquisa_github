import 'package:flutter/material.dart';
import 'layouts/pages/lista.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesquisa do Github',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Lista(title: 'Pesquisa do Github'),
    );
  }
}
