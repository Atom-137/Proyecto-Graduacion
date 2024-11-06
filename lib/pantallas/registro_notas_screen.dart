import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final FormdynamicProvider formDynamicProvider =
        Provider.of<FormdynamicProvider>(context);
    final FormDynamicService formDynamicServide = FormDynamicService();
    final query = QueryService();
    const form = 'registroCalificacion';
    bool editar = GoRouterState.of(context).extra != null;
    Map<String, dynamic> dataEstudiante = {};

    if (!editar) {
      return Scaffold(
          appBar: AppBar(title: const Text('Registrar Calificaciones')),
          body: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                formDynamicServide.obtenerFormulario(form, () async {
                  final datos =
                      formDynamicProvider.obtenerDatos(hashForm: form);

                  final datosbd = jsonDecode(datos)['campos'];

                  Calificacion calificacionNueva =
                      Calificacion.fromJson(datosbd);

                  RespuestaApi rs = await query.ejecutarQuery(
                      'registroCalificacion', jsonEncode(calificacionNueva));

                  if (!context.mounted) return;

                  Color colorRespuesta =
                      rs.respuesta == 'success' ? Colors.green : Colors.orange;
                  UltisWidget()
                      .mostrarMensaje(context, rs.mensaje, colorRespuesta);
                })
              ],
            )),
          ));
    } else {


      final String extraString            = GoRouterState.of(context).extra! as String;
      Map<String, dynamic> dataEstudiante = jsonDecode(extraString);
      String notaActualizar               = '';
      Map<String,String> dataActualizar   = {};

      //TODO mejorar la visualizacion de los datos
      return Scaffold(
        appBar: AppBar(title: Text('Editar Calificacion')),
        body: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Editar Calificacion de "),
              Text(
                  dataEstudiante['nombreEstudiante'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text("Curso:"),
              Text(
                  dataEstudiante['curso'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text("Bimestre:"),
              Text(
                  dataEstudiante['bimestre'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
              ),
              TextFormField(
                onChanged: (value) => notaActualizar = value,
                maxLength: 3,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () async {

                    dataActualizar = {
                        'idCalificacion' : dataEstudiante['idCalificacion'].toString(),
                        'calificacion'   : notaActualizar
                      };

                      RespuestaApi rs = await query.ejecutarQuery('actualizarCalificacion', jsonEncode(dataActualizar));

                      if (!context.mounted) return;

                      Color colorRespuesta = rs.respuesta == 'success' ? Colors.green : Colors.orange;
                      UltisWidget().mostrarMensaje(context, rs.mensaje, colorRespuesta);

                      if( rs.respuesta == 'success'){
                        context.go('/verNotas');
                      }
                  },
                  child: Text("Guardar Edicion")
              )
            ],
          ),
        ),
      );
    }
  }
}
