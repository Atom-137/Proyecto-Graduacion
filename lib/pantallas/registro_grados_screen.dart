import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../shared/services/services.dart';
import '../widgets/widgets.dart';

class RegistroGradosScreen extends StatelessWidget {
  const RegistroGradosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FormdynamicProvider formDynamicProvider = Provider.of<FormdynamicProvider>(context);
    final FormDynamicService formDynamicServide   = FormDynamicService();
    final query = QueryService();
    const form  = 'registroGrados';

    return Scaffold(
        appBar: AppBar( title: const Text('Registrar Grados')),
        body  : SingleChildScrollView(
          child: Center(
              child: Column( children: [
                  formDynamicServide.obtenerFormulario(form, () async {

                    final datos = formDynamicProvider.obtenerDatos( hashForm: form );

                    final datosbd = jsonDecode(datos)['campos'];

                    Map<String,dynamic> gradoNuevo = { 'grado'    : datosbd['nombreGrado'],
                                                       'seccion'  : datosbd['seccion']};


                    RespuestaApi rs = await query.ejecutarQuery('crearGrado', jsonEncode( gradoNuevo ));

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
