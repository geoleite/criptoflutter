class Moeda {
  int? id;
  String? nome;
  String? paridade;

  Moeda({this.id, this.nome, this.paridade});

  Moeda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    paridade = json['paridade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
      data['paridade'] = this.paridade;
    return data;
  }
}