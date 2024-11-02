import 'package:flutter/material.dart';

class CicloEscolarScreen extends StatelessWidget {
  const CicloEscolarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Ciclo Escolar')),
      body: Center(
        child: Column(
          children: [
            Text('Inicio de Ciclo Escolar'),
            FloatingActionButton(
              onPressed: (){},
              child: Text('Inciar Ciclo Escolar'))

          ]
        ),
      ),
    );
  }
}
