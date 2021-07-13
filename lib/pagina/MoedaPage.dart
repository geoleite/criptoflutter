import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:criptoflutter/modelo/wscliente/ClienteCripto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoedaPage extends StatefulWidget {
  MoedaPage({Key? key}) : super(key: key);

  @override
  _MoedaPage createState() => _MoedaPage();
}

class _MoedaPage extends State<MoedaPage> {
  List<Moeda> lista = [];

  @override
  void didUpdateWidget(covariant MoedaPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  void loadMoedas() async {
    List<Moeda> list = await ClienteCripto.getInstance().getMoedas();
    setState(() {
      lista = list;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Moedas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return templateRowListView(index);
                  },
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadMoedas,
        tooltip: 'Moedas',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget templateRowListView(int index) {
    Moeda moeda = lista[index];
    return Card(
        child: InkWell(
          onTap: () {
            print("Clicando em: ${moeda.nome}");
          },
          child: templateCellListView(moeda),
        ));
  }

  Widget templateCellListView(Moeda moeda) {
    return Row(
        children: [
          Expanded(
            child: Text(
                moeda.nome!,
                style: TextStyle(
                    //backgroundColor: backColor,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
            ),),
          Expanded(
            child: Text(moeda.paridade!,
                style: TextStyle(
                  //backgroundColor: backColor,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)
            ),),
          Expanded(
            child: Icon(Icons.close, color: Colors.red,),)
        ]);
  }
}
