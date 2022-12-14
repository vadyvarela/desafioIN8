import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/interfaces/venda.dart';
import 'package:get/get.dart';
import 'controllers/createControllers.dart';

class AddVenda extends StatefulWidget {
  const AddVenda({Key? key, required this.venda}) : super(key: key);
  final Venda venda;
  @override
  _AddVendaState createState() => _AddVendaState();
}

class _AddVendaState extends State<AddVenda> {
  final createControllers c = Get.put(createControllers());
  String dropdownValue = '';
  var itemRequest = [];

  var InputTextField = [""];

  void initState() {
    // TODO: implement initState
    super.initState();
    c.listVeiculos();
    setState(() {
      itemRequest = c.veiculos.value;
      // valor id  itemRequest.id
      dropdownValue = itemRequest.first.id.toString();
      widget.venda.idVeiculos = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venda de Veiculos", style: TextStyle(color: Colors.white)),
      ),

      body: Center(
        child: Card(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(16),
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
                  onChanged: (e) {
                    widget.venda.valorVenda = e;
                    InputTextField[0] = e;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor de venda',
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  width: 520,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black.withAlpha(60),width: 2),
                  ),
                  child: itemRequest.length > 0 ? DropdownButton<String>(
                    value: dropdownValue,
                    alignment: Alignment.centerRight,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.venda.idVeiculos = newValue;
                        dropdownValue = newValue!;
                      });
                    },
                    items: itemRequest.map((e) => DropdownMenuItem<String>(
                      value: e.id.toString(),
                      child: Text(e.nome),
                    )
                    ).toList(),
                  ):null,
                ),
                const SizedBox(height: 16),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: Obx(() =>
                        ElevatedButton(
                            onPressed: () async {
                              if(!InputTextField.contains("")) {
                                await c.createVenda(widget.venda.toJson());
                                const snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Venda realizada com sucesso!'),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else {
                                const snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Todos os campos s??o obrigat??rios!'),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                            child:
                            !c.btnLoading.value ?
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
