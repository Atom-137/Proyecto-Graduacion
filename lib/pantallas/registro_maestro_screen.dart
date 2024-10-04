import 'package:flutter/material.dart';

class RegistroEstudianteScreen extends StatelessWidget {
  const RegistroEstudianteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  _FormRegistroMaestro();
  }
}

class _FormRegistroMaestro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
           return Scaffold(
                appBar: AppBar( title: const Text('Registro de Maestros')),
                body  : const SingleChildScrollView(
                      child : Text("Form maestro")
                ),
          );
  }
}


