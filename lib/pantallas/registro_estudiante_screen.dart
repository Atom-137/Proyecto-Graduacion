import 'dart:convert';

import 'package:app_notas_v2/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
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
    const form  = 'registrarEstudiante';

    CatalogosService catalogos = CatalogosService();
    catalogos.catalogoGrados();

    return Scaffold(
      appBar: AppBar( title: const Text('Registro de Estudiante')),
      body  : SingleChildScrollView(
        child: Center(
          child: Column( children: [
            formDynamicServide.obtenerFormulario(form, () async {

                      final datos = formDynamicProvider.obtenerDatos( hashForm: form );

                      final datosbd = jsonDecode(datos)['campos'];

                      Estudiante estudianteNuevo = Estudiante.fromJson( datosbd );

                      RespuestaApi rs = await query.ejecutarQuery('crearEstudiante', jsonEncode(estudianteNuevo));

                      if( !context.mounted ) return;

                      Color colorRespuesta = rs.respuesta == 'success' ? Colors.green : Colors.orange;
                      UltisWidget().mostrarMensaje(context, rs.mensaje, colorRespuesta);

                  }
              )
            ],
          )
        ),
      )
    );
 }
}















