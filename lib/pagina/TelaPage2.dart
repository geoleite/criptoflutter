import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:flutter/material.dart';

class TelaPage2 extends StatefulWidget {
  TelaPage2({Key? key, this.lista}) : super(key: key);

  List<Moeda>? lista;
  @override
  _TelaPage2 createState() => _TelaPage2();
}

class _TelaPage2 extends State<TelaPage2> {

  //List<String> lista = ["A", "B", "C"];
  Moeda? valor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valor = widget.lista![0];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(direction: Axis.vertical,
        children: [
          DropdownButton<Moeda>(
              value: valor,
              onChanged: (value) {
                setState(() {
                  valor = value!;
                });
              },
              items: widget.lista!.map<DropdownMenuItem<Moeda>>((Moeda value) {
                return DropdownMenuItem<Moeda>(
                  value: value,
                  child: Text(value.nome!),
                );
              }).toList())
        ],
      ),
    );
  }
}