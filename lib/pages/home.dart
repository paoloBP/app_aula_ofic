import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App aula'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'App aula',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_alert_outlined),
              title: const Text('Contador'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/contador');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Dias Vividos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/diasVividos');
              },
            ),
             ListTile(
              leading: const Icon(Icons.info),
              title: const Text('diasvividos Oo'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/diasVividosOo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Informações'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/informacoes');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Formulario'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/formulario');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Dialogos'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/dialogos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('IMC'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.of(context).pushNamed('/imc');
              },
              
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const Text('Bem vindo'),
          ElevatedButton(
            child: const Text('Contador'),
            onPressed: () {
              Navigator.of(context).pushNamed('/contador');
            },
          ),
          ElevatedButton(
            child: const Text('Abrir Sobre'),
            onPressed: () {
              Navigator.of(context).pushNamed('/sobre');
            },
          ),
        ],
      )),
    );
  }
}
