import 'package:flutter/material.dart';

class DiasVividosPage extends StatefulWidget {
  const DiasVividosPage({super.key});
  @override
  _DiasVividosPageState createState() {
    return _DiasVividosPageState();
  }
}

class _DiasVividosPageState extends State<DiasVividosPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  int _idade = 0;
  int _diasVividos = 0;
  void _calcular() {
    setState(() {
      _diasVividos = _idade * 365;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dias Vividos"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Digite seu nome',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'É preciso digitar seu nome!';
                            }

                            _nome = value;

                            return null;
                          }),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Digite sua idade',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'É preciso digitar sua idade!';
                            }

                            _idade = int.parse(value);

                            return null;
                          }),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calcular();
                          }
                        },
                        child: Text('Calcular'),
                      ),
                      Text('$_nome, você já viveu $_diasVividos dias'),
                    ]))));
  }
}

// Path: lib\pages\formulario.dart

// Compare this snippet from lib\pages\formulario.dart:

// import 'package:flutter/material.dart';

// // Define a custom Form widget.



