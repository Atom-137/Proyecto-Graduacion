import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../shared/services/services.dart';
import '../widgets/widgets.dart';

class RegistroMateriasScreen extends StatelessWidget {
  const RegistroMateriasScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final FormdynamicProvider formDynamicProvider = Provider.of<FormdynamicProvider>(context);
    final FormDynamicService formDynamicServide   = FormDynamicService();
    final query                                   = QueryService();
    const form                                    = 'registroCurso';

    return Scaffold(
        appBar: AppBar( title: const Text('Registrar Cursos')),
        body  : SingleChildScrollView(
          child: Center(
              child: Column( children: [
                formDynamicServide.obtenerFormulario(form, () async {

                    final datos = formDynamicProvider.obtenerDatos( hashForm: form );

                    final datosbd = jsonDecode(datos)['campos'];

                    print(' datos bd');
                    print( datosbd.toString() );

                    Curso cursoNuevo = Curso.fromJson( datosbd );

                    RespuestaApi rs = await query.ejecutarQuery('registrarCurso', jsonEncode( cursoNuevo ));

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
