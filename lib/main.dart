import 'package:app_aula_ofic/pages/contador.dart';
import 'package:app_aula_ofic/pages/home.dart';
import 'package:app_aula_ofic/pages/informacoes.dart';
import 'package:app_aula_ofic/pages/sobre.dart';
import 'package:app_aula_ofic/pages/formulario.dart';
import 'package:app_aula_ofic/pages/dias.dart';
import 'package:app_aula_ofic/pages/imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/contador': (context) => const ContadorPage(title: "Contador"),
        '/sobre': (context) => SobrePage(),
        '/informacoes': (context) => InformacoesPage(),
        '/formulario': (context) => FormValidacaoPage(),
        '/dialogos': (context) => DiasVividosPage(),
        '/imc': (context) => IMCPage(),
      },
    );
  }
}
