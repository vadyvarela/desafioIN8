import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/pages/veiculo/controllers/createControllers.dart';
import 'package:frontend/pages/welcome/welcome.dart';
import 'package:get/get.dart';

class Create extends StatefulWidget {
  const Create({Key? key, required this.veiculo}) : super(key: key);
  final Veiculos veiculo;
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final createControllers c = Get.put(createControllers());
  var InputTextField = ["", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
          title: const Text("Registro de Veiculos", style: TextStyle(color: Colors.white)),
      ),

      body: Center(
        child: Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.all(16),
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Cadastrar Veiculos", style: TextStyle(color: Colors.black, fontSize: 24)),
                const Divider(),
                const SizedBox(height: 32),

                TextField(
                  onChanged: (e) {
                    widget.veiculo.nome = e;
                    InputTextField[0] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {
                    widget.veiculo.chassi = e;
                    InputTextField[1] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Chassi',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {
                    widget.veiculo.cor = e;
                    InputTextField[2] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cor',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {
                    widget.veiculo.marca = e;
                    InputTextField[3] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Marca',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {
                    widget.veiculo.modelo = e;
                    InputTextField[4] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Modelo',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {
                    widget.veiculo.anoFabricacao = e;
                    InputTextField[5] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ano de Fabricação',
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 50,

                  child: Obx(() =>
                      ElevatedButton(
                        onPressed: () async {
                          if(!InputTextField.contains("")) {
                            await c.createVeiculos(widget.veiculo.toJson());
                            const snackBar = SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Veiculo cadastrado com sucesso!'),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            const snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Todos os campos são obrigatórios!'),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child:
                          !c.loading.value ?
                          const Text("Criar", style: TextStyle(color: Colors.black))
                          :
                          const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,)
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
