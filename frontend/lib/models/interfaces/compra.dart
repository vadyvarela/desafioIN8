class Compra {
  String? dataCompra;
  String? valorCompra;
  String? idVeiculos;

  Compra({this.valorCompra, this.idVeiculos});

  Compra.fromJson(Map<String, dynamic> json) {
    valorCompra = json['valor_compra'];
    idVeiculos = json['id_veiculos'];
    dataCompra = json['data_compra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valor_compra'] = int.parse(this.valorCompra.toString());
    data['id_veiculos'] = this.idVeiculos.toString();
    data['data_compra'] = this.dataCompra.toString();
    return data;
  }
}