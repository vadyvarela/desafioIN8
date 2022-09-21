import 'package:flutter/material.dart';
import 'package:frontend/models/interfaces/compra.dart';
import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/models/interfaces/venda.dart';
import 'package:frontend/pages/veiculo/addcomprar.dart';
import 'package:frontend/pages/veiculo/addvender.dart';
import 'package:frontend/pages/veiculo/controllers/createControllers.dart';
import 'package:frontend/pages/veiculo/create.dart';
import 'package:frontend/pages/veiculo/listcompra.dart';
import 'package:frontend/pages/veiculo/listvenda.dart';
import 'package:get/get.dart';

class WelcomeV extends StatefulWidget {
  const WelcomeV({Key? key}) : super(key: key);

  @override
  _WelcomeVState createState() => _WelcomeVState();
}

class _WelcomeVState extends State<WelcomeV> {
  final createControllers c = Get.put(createControllers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.listVeiculos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("Rent - Car", style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(AddCompra(compra: Compra()));
                  },
                  child: Row(
                    children: const [
                      Text("Compra de Veiculos", style: TextStyle(color: Colors.white)),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(const ListCompra());
                  },
                  child: Row(
                    children: const [
                      Text("Listar Compras", style: TextStyle(color: Colors.white)),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigoAccent),
                  ),
                  onPressed: () {
                    Get.to(AddVenda(venda: Venda()));
                  },
                  child: Row(
                    children: const [
                      Text("Venda de Veiculos", style: TextStyle(color: Colors.white)),
                    ],
                  )),

            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(const ListVenda());
                  },
                  child: Row(
                    children: const [
                      Text("Listar Vendas", style: TextStyle(color: Colors.white)),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Get.to(Create(veiculo: Veiculos()));
                  },
                  child: Row(
                    children: const [
                      Text("Adiciona Novo Veiculos", style: TextStyle(color: Colors.black)),
                      Icon(Icons.add,
                          size: 15, color: Colors.black)
                    ],
                  )),
            )
          ]),
      body: Obx(
          () =>  Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
                elevation: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(children: [
                    Container(
                      color: Colors.indigoAccent,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Nome", style: TextStyle(color: Colors.white)),
                          Text("Cor", style: TextStyle(color: Colors.white)),
                          Text("Marca", style: TextStyle(color: Colors.white)),
                          Text("Modelo", style: TextStyle(color: Colors.white)),
                          Text("Chassi", style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,),
                          Text("Adicionado Em", style: TextStyle(color: Colors.white)),

                        ],
                      ),
                    ),
                    Expanded(
                      child: !c.loading.value == false ?
                      const Text("Carregando os veiculos ...", style: TextStyle(color: Colors.black))
                      :
                      Container(
                        width: double.infinity,
                        child: ListView.builder(
                         // padding: EdgeInsets.zero,
                          itemCount: c.veiculos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.white,
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child:
                                    Text(c.veiculos.value[index].nome?? "",
                                        style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].cor?? "",
                                        style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].marca?? "",
                                        style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].modelo?? "",
                                      style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].chassi ?? "",
                                      style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),

                                  Expanded(
                                    child:
                                    Text(c.veiculos.value[index].anoFabricacao ?? "",
                                        style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      )

                    ),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
