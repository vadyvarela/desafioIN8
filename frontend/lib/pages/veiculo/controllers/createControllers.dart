import 'package:frontend/models/interfaces/compra.dart';
import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/models/interfaces/venda.dart';
import 'package:frontend/services/api_service.dart';
import 'package:get/get.dart';

class createControllers extends GetxController{
  final loading = false.obs;
  final btnLoading = false.obs;
  final veiculos = <Veiculos>[].obs;
  final compra = <Compra>[].obs;
  final venda = <Venda>[].obs;
  
  Future createVeiculos(Map<String, dynamic> body) async {
    loading.value=true;
    btnLoading.value = true;
    var request = await ApiService.addVeiculos(body, "/veiculos");
    loading.value=false;
    btnLoading.value = false;

    return request;
  }
  Future listVeiculos() async {
    loading.value=true;
    var request = await ApiService.listVeiculos("/veiculos");
    loading.value=false;
    veiculos.value = List<Veiculos>.from(request.map((e) => Veiculos.fromJson(e)));

    print(request);
    return request;
  }


  Future createCompra(Map<String, dynamic> body) async {
    btnLoading.value = true;
    var request = await ApiService.addCompra(body, "/compra");
    btnLoading.value = false;

    return request;
  }
  Future listCompra() async {
    loading.value=true;
    var request = await ApiService.listCompra("/compra");
    loading.value=false;
    compra.value = List<Compra>.from(request.map((e) => Compra.fromJson(e)));

    print(request);
    return request;
  }

  Future createVenda(Map<String, dynamic> body) async {
    btnLoading.value = true;
    var request = await ApiService.addCompra(body, "/venda");
    btnLoading.value = false;

    return request;
  }
  Future listVenda() async {
    loading.value=true;
    var request = await ApiService.listVenda("/venda");
    loading.value=false;
    venda.value = List<Venda>.from(request.map((e) => Venda.fromJson(e)));

    print(request);
    return request;
  }


}