import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/services/api_service.dart';
import 'package:get/get.dart';

class createControllers extends GetxController{
  final loading = false.obs;
  final veiculos = <Veiculos>[].obs;
  
  Future createVeiculos(Map<String, dynamic> body) async {
    print(body);
    loading.value=true;
    var request = await ApiService.addVeiculos(body, "/veiculos");
    loading.value=false;
    print(request);

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
}