import 'dart:convert';

import 'package:app_notas_v2/models/models.dart';
import 'package:app_notas_v2/providers/providers.dart';
import 'package:app_notas_v2/shared/services/form_dynamic_service.dart';

import 'package:app_notas_v2/widgets/boton_guardar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/services/services.dart';
import '../widgets/widgets.dart';

class RegistroEstudianteScreen extends StatelessWidget {
  const RegistroEstudianteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  _FormRegistroEstudiante();
  }
}


class _FormRegistroEstudiante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    final FormdynamicProvider formDynamicProvider = Provider.of<FormdynamicProvider>(context);
    final FormDynamicService formDynamicServide   = FormDynamicService();
    final query = QueryService();

    return Scaffold(
      appBar: AppBar( title: const Text('Registro de Estudiante')),
      body  : SingleChildScrollView(
        child: Center(
          child: Column( children: [
            formDynamicServide.obtenerFormulario('registrarEstudiante')]),
        )
      ),
    );

 }
}















