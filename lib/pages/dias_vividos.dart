import 'package:flutter/material.dart';

class DiasVividosPage extends StatefulWidget {
  const DiasVividosPage({super.key, required this.title});
  final String title;

  @override
  State<DiasVividosPage> createState() => _DiasVividosPage();
}

class _DiasVividosPage extends State<DiasVividosPage> {
  final _formKey = GlobalKey<FormState>();
  int _idade = 0;
  String _nome = "";
  int _diasVividos = 0;

  void _calcular() {
    setState(() {
      _diasVividos = _idade * 365;
    });
    entries.add('$_nome viveu +- $_diasVividos');
  }

  final List<String> entries = <String>[];
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
                    _nome = value;
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
                    _idade = int.tryParse(value)!;
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
                                'Tudo certo!! Viveu +- $_diasVividos dias')),
                      );
                    }
                  },
                  child: const Text('Calcular'),
                ),
                Text(
                  '$_nome você viveu +- ',
                ),
                Text(
                  '$_diasVividos dias',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextFormField(
                  keyboardType: TextInputType.none,
                  initialValue: _diasVividos.toString(),
                  key: Key(_diasVividos.toString()),
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
                          child: Center(child: Text('Entry ${entries[index]}')),
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
