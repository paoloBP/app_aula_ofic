import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: const Center(
        child: Text('Sobre .'),
      ),
    );
  }
}
