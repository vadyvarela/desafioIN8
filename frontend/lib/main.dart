import 'package:flutter/material.dart';
import 'package:frontend/models/interfaces/veiculo.dart';
import 'package:frontend/pages/create/create.dart';
import 'package:frontend/pages/welcome/welcome.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RentCar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeV(),
    );

  }
}
