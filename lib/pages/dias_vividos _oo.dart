import 'package:app_aula_ofic/model/DiasVividos.dart';
import 'package:flutter/material.dart';

class DiasVividosOoPage extends StatefulWidget {
  const DiasVividosOoPage({super.key, required this.title});
  final String title;

  @override
  State<DiasVividosOoPage> createState() => _DiasVividosOoPage();
}

class _DiasVividosOoPage extends State<DiasVividosOoPage> {
  final _formKey = GlobalKey<FormState>();
  DiasVividos obj = DiasVividos();

  void _calcular() {
    setState(() {   
    });
    entries.add(obj);
  }

  final List<DiasVividos> entries = <DiasVividos>[];
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
                      border: OutlineInputBorder(), labelText: 'Idade'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a idade.';
                    }
                    obj.idade = int.tryParse(value)!;
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calcular();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Tudo certo!! ${obj.getResultado()}')),
                      );
                    }
                  },
                  child: const Text('Calcular'),
                ),
                Text(
                  '${obj.nome} você viveu +- ',
                ),
                Text(
                  '${obj.diasVividos2} dias',
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
                          child: Center(child: Text('Entry ${entries[index].getResultado()}')),
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
