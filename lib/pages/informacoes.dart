import 'package:flutter/material.dart';

class InformacoesPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: const Center(
        child: Text('Matrícula: 161692\n\n'
            'email: 161692@upf.br\n\n'
            'Nome: Paolo Bonez Piovezan\n\n'
            'Curso: Análise e Desenvolvimento de Sistemas\n\n'
            'Semestre: 6º\n\n'
            'Disciplina: Desenvolvimento  para Dispositivos Móveis\n\n'
            'Professor: Jaqson Dalbosco\n\n'
            'Universidade: UPF\n\n'),
      ),
    );
  }
}
