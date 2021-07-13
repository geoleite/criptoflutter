import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:criptoflutter/modelo/wscliente/ClienteCripto.dart';
import 'package:criptoflutter/pagina/MoedaPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoedaPage(),
    );
  }
}

