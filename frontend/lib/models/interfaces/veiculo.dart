class Veiculos {
  String? id;
  String? anoFabricacao;
  String? chassi;
  String? cor;
  String? marca;
  String? modelo;
  String? nome;

  Veiculos(
      {this.id,
        this.anoFabricacao,
        this.chassi,
        this.cor,
        this.marca,
        this.modelo,
        this.nome});

  Veiculos.fromJson(Map<String, dynamic> json) {
    anoFabricacao = json['ano_fabricacao'].toString();
    chassi = json['chassi'].toString();
    cor = json['cor'].toString();
    marca = json['marca'].toString();
    modelo = json['modelo'].toString();
    nome = json['nome'].toString();
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ano_fabricacao'] = this.anoFabricacao;
    data['chassi'] = this.chassi;
    data['cor'] = this.cor;
    data['marca'] = this.marca;
    data['modelo'] = this.modelo;
    data['nome'] = this.nome;
    data['id'] = this.id;
    return data;
  }
}