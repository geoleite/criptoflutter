import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:criptoflutter/modelo/Moeda.dart';
import 'package:http/http.dart';

class ClienteCripto {

  static ClienteCripto? _instance;

  ClienteCripto._internal() {}

  static ClienteCripto getInstance() {
    if (_instance == null) {
      _instance = ClienteCripto._internal();
    }
    return _instance!;
  }

  Future<List<Moeda>> getMoedas() async {

    String url =  "http://192.168.100.64:9090/vendas/cripto/getMoedas";
    Response response = await HttpUtils.getForFullResponse(url);
    if (response.statusCode != 200) {
      throw Exception("Erro: ${response.toString()}" );
    } else {
      //Resposta ok
        String resultado = response.body;
      var dataMap = jsonDecode(resultado);
      List<Moeda> lista =
      (dataMap as List).map((i) => Moeda.fromJson(i)).toList();
      return lista;
    }
  }
}