import 'package:flutter/material.dart';
import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/pages/create/addvender.dart';
import 'package:frontend/pages/create/controllers/createControllers.dart';
import 'package:frontend/pages/create/create.dart';
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
          title: const Text("RentCar", style: TextStyle(color: Colors.amber)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Get.to(AddVender());
                  },
                  child: Row(
                    children: const [
                      Text("AddVender", style: TextStyle(color: Colors.black)),
                      Icon(Icons.account_balance_rounded,
                          size: 15, color: Colors.black)
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
                      Text("Criar", style: TextStyle(color: Colors.black)),
                      Icon(Icons.account_balance_rounded,
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
                      color: Colors.grey,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Nome", style: TextStyle(color: Colors.red)),
                          Text("Chassi", style: TextStyle(color: Colors.amber)),
                          Text("Cor", style: TextStyle(color: Colors.amber)),
                          Text("Data", style: TextStyle(color: Colors.amber)),
                          Text("Preço", style: TextStyle(color: Colors.amber)),
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
                                        style: TextStyle(color: Colors.red), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].chassi?? "",
                                        style: TextStyle(color: Colors.amber), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].cor?? "",
                                        style: TextStyle(color: Colors.amber), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].anoFabricacao ?? "",
                                        style: TextStyle(color: Colors.amber), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.veiculos.value[index].marca ?? "",
                                        style: TextStyle(color: Colors.amber), textAlign: TextAlign.center,),
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
