class Venda {
  String? valorVenda;
  String? idVeiculos;
  String? dataVenda;

  Venda({this.valorVenda, this.idVeiculos});

  Venda.fromJson(Map<String, dynamic> json) {
    valorVenda = json['valor_venda'];
    idVeiculos = json['id_veiculos'];
    dataVenda = json['data_venda'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valor_venda'] = int.parse(this.valorVenda.toString());
    data['id_veiculos'] = this.idVeiculos.toString();
    data['data_venda'] = this.dataVenda.toString();

    return data;
  }
}