import 'package:criptoflutter/Template.dart';
import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:criptoflutter/modelo/wscliente/ClienteCripto.dart';
import 'package:criptoflutter/pagina/MoedaDetalhesPage.dart';
import 'package:criptoflutter/pagina/TelaPage2.dart';
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
        title: Text("Moedas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getTela(lista.length == 0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadMoedas,
        tooltip: 'Moedas',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> getTela(bool valor) {
    if (valor) {
      return [Text("Vazio")];
    } else {
      List<Widget> componentes = [];
      // if (lista.length > 0) {
      //   componentes.add(
      //     TelaPage2(lista: lista),
      //   );
      // }
      componentes.add(Expanded(
          child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return templateRowListView(index);
        },
      )));
      return componentes;
    }
  }

  Widget templateRowListView(int index) {
    Moeda moeda = lista[index];
    return Card(
        child: InkWell(
      onTap: () => abrirJanelaMoeda(moeda),
      child: templateCellListView(moeda),
    ));
  }

  Widget templateCellListView(Moeda moeda) {
    return Row(children: [
      Expanded(
        child: Template.textTitulo(texto: moeda.nome),
      ),
      Expanded(
        child: Template.textTituloSec(texto: moeda.paridade),
      ),
      Expanded(
        child: Icon(
          Icons.close,
          color: Colors.red,
        ),
      )
    ]);
  }

  void abrirJanelaMoeda(Moeda moeda) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => MoedaDetalhesPage(moeda: moeda),
    //     )).then((value) {
    //       if (value == true)
    //         loadMoedas();
    // });

    showModalBottomSheet(context: context,
        builder: (BuildContext bc) {
          return MoedaDetalhesPage(moeda: moeda);
        });
  }
}
