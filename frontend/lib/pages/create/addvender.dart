
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/createControllers.dart';

class AddVender extends StatefulWidget {

  @override
  _AddVenderState createState() => _AddVenderState();
}

class _AddVenderState extends State<AddVender> {
  String dropDownValue="One";
  final createControllers c = Get.put(createControllers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.listVeiculos();
  }
  var InputTextField = ["", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venda de Veiculos", style: TextStyle(color: Colors.black)),
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
                const Text("Venda de Veiculos", style: TextStyle(color: Colors.black, fontSize: 24)),
                const Divider(),
                const SizedBox(height: 32),

                TextField(
                  onChanged: (e) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Veiculo',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor de Venda',
                  ),
                ),
              DropdownButton<String>(
                isExpanded:true,
                value: "One",
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                // items: list.map((item){
                //   return DropdownMenuItem(
                //     child: Text(item.name),
                //     value: item.id,
                //   );
                // }).toList(),
                //
              ),
                const SizedBox(height: 32),
                Container(
                    width: double.infinity,
                    height: 50,

                    child: Obx(() =>
                        ElevatedButton(
                            onPressed: () async {
                              if(!InputTextField.contains("")) {
                                // await c.createVeiculos(widget.veiculo.toJson());
                                // const snackBar = SnackBar(
                                //   backgroundColor: Colors.green,
                                //   content: Text('Veiculo cadastrado com sucesso!'),
                                // );
                                //
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
