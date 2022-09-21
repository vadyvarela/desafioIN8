import 'package:flutter/material.dart';
import 'package:frontend/pages/veiculo/controllers/createControllers.dart';
import 'package:frontend/pages/veiculo/create.dart';
import 'package:get/get.dart';

class ListVenda extends StatefulWidget {
  const ListVenda({Key? key}) : super(key: key);

  @override
  _ListVendaState createState() => _ListVendaState();
}
class _ListVendaState extends State<ListVenda> {
  final createControllers c = Get.put(createControllers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.listVenda();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Lista de vendas", style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() => Center(
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
                        Text("Valor de Venda", style: TextStyle(color: Colors.white)),
                        Text("Vendido Em", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: c.loading.value == true ?
                      const Text("Carregando os dados ...", style: TextStyle(color: Colors.black))
                          :
                      Container(
                        width: double.infinity,
                        child: ListView.builder(
                          // padding: EdgeInsets.zero,
                          itemCount: c.venda.length,
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
                                    Text(c.venda.value[index].valorVenda ?? "",
                                      style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                                  ),
                                  Expanded(
                                    child: Text(c.venda.value[index].dataVenda?? "",
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
