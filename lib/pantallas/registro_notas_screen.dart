import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../shared/services/services.dart';
import '../widgets/widgets.dart';

class RegistroNotasScreen extends StatefulWidget {
  const RegistroNotasScreen({super.key});

  @override
  State<RegistroNotasScreen> createState() => _RegistroNotasScreenState();
}

class _RegistroNotasScreenState extends State<RegistroNotasScreen> {
  @override
  Widget build(BuildContext context) {

    final FormdynamicProvider formDynamicProvider = Provider.of<FormdynamicProvider>(context);
    final FormDynamicService formDynamicServide   = FormDynamicService();
    final query                                   = QueryService();
    const form                                    = 'registroCalificacion';

    return Scaffold(
        appBar: AppBar( title: const Text('Registrar Calificaciones')),
        body  : SingleChildScrollView(
          child: Center(
              child: Column( children: [
                formDynamicServide.obtenerFormulario(form, () async {

                  final datos = formDynamicProvider.obtenerDatos( hashForm: form );

                  final datosbd = jsonDecode(datos)['campos'];

                  Calificacion calificacionNueva = Calificacion.fromJson( datosbd );

                  RespuestaApi rs = await query.ejecutarQuery('registroCalificacion', jsonEncode( calificacionNueva ));

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



