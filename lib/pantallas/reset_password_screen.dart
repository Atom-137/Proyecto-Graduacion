import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/models.dart';
import '../shared/services/services.dart';
import '../widgets/widgets.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String,String> datosLogin     = {};

    return Scaffold(
      appBar: AppBar( title: const Text('Cambio de Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              const Text('Ingrese su Usuario'),
              const SizedBox( height:  20,),
              TextFormField(onChanged: (value) => datosLogin['username'] = value ),
              const SizedBox( height:  20,),
              ElevatedButton(
                  onPressed: () async {
                      if( datosLogin['username'] == null || datosLogin['username']!.isEmpty ){
                          UltisWidget().mostrarMensaje(context, 'Ingrese su Usuario', Colors.orange);
                      }
                      AuthServices auth    = AuthServices();
                      RespuestaApi rs      = await auth.resetPass(datosLogin);
                      Color colorRespuesta = rs.respuesta == 'success' ? Colors.green : Colors.orange;

                      if( !context.mounted ) return;

                      UltisWidget().mostrarMensaje(context, rs.mensaje, colorRespuesta);

                      if( rs.respuesta == 'success'){
                        context.go('/login');
                      }
                },
                child: const Text('Restablecer Contraseña')
              )
            ],
        ),
      ),
    );
  }
}
