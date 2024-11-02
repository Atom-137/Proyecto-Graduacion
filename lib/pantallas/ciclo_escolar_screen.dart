import 'package:flutter/material.dart';

class CicloEscolarScreen extends StatelessWidget {
  const CicloEscolarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Ciclo Escolar')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Inicio de Ciclo Escolar, Darle tab al boton Iniciar Ciclo Escolar'
                  'para iniciar el ciclo '),
              ElevatedButton(
                onPressed: (){},
                child: const Text('Inciar Ciclo Escolar'))

            ]
          ),
        ),
      ),
    );
  }
}
