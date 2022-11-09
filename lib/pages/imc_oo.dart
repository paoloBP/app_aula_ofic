import 'package:app_aula_ofic/model/Imc.dart';
import 'package:flutter/material.dart';

class ImcOoPage extends StatefulWidget {
  const ImcOoPage({super.key, required this.title});
  final String title;

  @override
  State<ImcOoPage> createState() => _ImcOoPage();
}

class _ImcOoPage extends State<ImcOoPage> {
  final _formKey = GlobalKey<FormState>();
  Imc obj = Imc();

  void _calcular() {
    setState(() {});
    entries.add(obj);
  }

  final List<Imc> entries = <Imc>[];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome.';
                    }
                    obj.nome = value;
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Peso'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o peso.';
                    }
                    obj.peso = double.tryParse(value)!;
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Altura'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a altura.';
                    }
                    obj.altura = double.tryParse(value)!;
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calcular();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Tudo certo!! ${obj.getResultado()}')),
                      );
                    }
                  },
                  child: const Text('calcular'),
                ),
                Text(
                  'Resultado: ${obj.getResultado()}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextFormField(
                  keyboardType: TextInputType.none,
                  initialValue: obj.getResultado(),
                  key: Key(obj.getResultado()),
                ),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color:
                              Colors.amber[colorCodes[index % 2 > 0 ? 0 : 1]],
                          child: Center(
                              child: Text(
                                  'Eu sou:  ${entries[index].getResultado()}')),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
