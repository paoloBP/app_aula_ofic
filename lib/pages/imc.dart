import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({super.key});
  @override
  _IMCPageState createState() {
    return _IMCPageState();
  }
}

class _IMCPageState extends State<IMCPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  void _calcular() {
    setState(() {
      _imc = _peso / (_altura * _altura);

      if (_imc < 18.5) {
        _nome = '$_nome' ' - ' 'Abaixo do peso';
      } else if (_imc >= 18.5 && _imc < 25) {
        _nome = '$_nome' ' - ' 'Peso normal';
      } else if (_imc >= 25 && _imc < 30) {
        _nome = '$_nome' ' - ' 'Sobrepeso';
      } else if (_imc >= 30 && _imc < 35) {
        _nome = '$_nome' ' - ' 'Obesidade grau 1';
      } else if (_imc >= 35 && _imc < 40) {
        _nome = '$_nome' ' - ' 'Obesidade grau 2';
      } else if (_imc >= 40) {
        _nome = '$_nome' ' - ' 'Obesidade grau 3';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC"),
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
                            labelText: 'Digite seu peso',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'É preciso digitar seu peso!';
                            }

                            _peso = double.parse(value);

                            return null;
                          }),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Digite sua altura',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'É preciso digitar sua altura!';
                            }

                            _altura = double.parse(value);

                            return null;
                          }),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _calcular();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('$_nome seu IMC é: $_imc')));

                              _formKey.currentState!.reset();
                            }
                          },
                          child: Text("Calcular")),
                      Text("$_nome, seu IMC é: $_imc")
                    ]))));
  }
}
