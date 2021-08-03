
import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:flutter/material.dart';

class MoedaDetalhesPage extends StatefulWidget {
  MoedaDetalhesPage({required this.moeda});

  Moeda moeda;

  @override
  _MoedaDetalhesPage createState() => _MoedaDetalhesPage();
}

class _MoedaDetalhesPage extends State<MoedaDetalhesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Detalhes: ${widget.moeda.nome}" ) ,),
      body: Flex(direction: Axis.vertical,
        children: [
          ElevatedButton(onPressed: fecharAction,
              child: Text("Fechar"))
      ],),
    );
  }

  void fecharAction() {
    Navigator.of(context).pop(true);
  }
}