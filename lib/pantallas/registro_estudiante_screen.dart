import 'package:app_notas_v2/providers/form_providers/form_estudiante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistroEstudianteScreen extends StatelessWidget {
  const RegistroEstudianteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: ( _ ) => FormEstudianteProvider(),
                                  child : _FormRegistroEstudiante());
  }
}


class _FormRegistroEstudiante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    final formProvider = Provider.of<FormEstudianteProvider>(context);

    return Scaffold(
      appBar: AppBar( title: const Text('Registro de Estudiante')),
      body  : Form(
          key: formProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child  : Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration( labelText: 'Primer Nombre'),
                  onChanged: ( valor ) => formProvider.primerNombre = valor,
                  validator: ( valor ) {
                    if (valor == null || valor.isEmpty){

                      return ' Ingrese el Primer Nombre ';
                    }
                    else{
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
      ),
    );

 }
}















