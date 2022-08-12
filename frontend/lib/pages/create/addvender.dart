
import 'package:flutter/material.dart';

class AddVender extends StatefulWidget {


  @override
  _AddVenderState createState() => _AddVenderState();
}

class _AddVenderState extends State<AddVender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vender", style: TextStyle(color: Colors.black)),
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

                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (e) {

                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Chassi',
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
