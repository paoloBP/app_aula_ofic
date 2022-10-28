import 'package:flutter/material.dart';

// Define a custom Form widget.
class FormValidacaoPage extends StatefulWidget {
  const FormValidacaoPage({super.key});
  @override
  _FormValidacaoPageState createState() {
    return _FormValidacaoPageState();
  }
}

class _FormValidacaoPageState extends State<FormValidacaoPage> {
  final _formKey = GlobalKey<FormState>();
  String _algo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Form com Validação"),
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
                    labelText: 'Digite algo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'É preciso digitar algo!';
                    }
                    _algo = value;
                    return null;
                  }),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _fazeralgo();
                  }
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _fazeralgo() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você digitou: $_algo'),
      ),
    );
  }
}
