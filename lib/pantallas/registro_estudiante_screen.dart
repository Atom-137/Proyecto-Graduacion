import 'package:app_notas_v2/providers/form_providers/form_estudiante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

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
    // final TextEditingController primerNombre = TextEditingController();

    return Scaffold(
      appBar: AppBar( title: const Text('Registro de Estudiante')),
      body  : Form(
          key: formProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child  : Column(
              children: [
                // TextFormField(

                InputWidget(
                    labelText : "CUI",
                    hintText  : "Ingrese el CUI del Estudiante",
                    validacion: ( valor ) {
                      print( "valor validacion ");
                      print( valor );
                      return "PRUEBA ";
                    },
                    onChange: ( valor ) { formProvider.primerNombre = valor; },
                  ),
                SizedBox( height: 10),
                InputWidget(
                    labelText : "Primer Nombre",
                    hintText  : "Ingrese el Primer Nombre",
                    validacion: ( valor ) {

                      //TODO: relizar la validacion
                      print( "valor validacion ");
                      print( valor );
                      return "PRUEBA ";
                    },
                    onChange: ( valor ) { formProvider.primerNombre = valor; },
                  ),
                SizedBox( height: 10),
                InputWidget(
                     labelText : "Segundo Nombre",
                     hintText  : "Ingrese el Segundo Nombre",
                     validacion: ( valor ) {
                       print( "valor validacion ");
                       print( valor );
                       return "PRUEBA ";
                     },
                     onChange: ( valor ) { formProvider.segundoNombre = valor; },
                  ),
                SizedBox( height: 10),
                InputWidget(
                  labelText : "Primer Apellido",
                  hintText  : "Ingrese el Primer Apellido",
                  validacion: ( valor ) {
                    print( "valor validacion ");
                    print( valor );
                    return "PRUEBA ";
                  },
                  onChange: ( valor ) { formProvider.primerApellido = valor; },
                ),
                SizedBox( height: 10),
                InputWidget(
                  labelText : "Segundo Apellido",
                  hintText  :  "Ingrese el Segundo Apellido",
                  validacion: ( valor ) {
                    print( "valor validacion ");
                    print( valor );
                    return "PRUEBA ";
                  },
                  onChange: ( valor ) { formProvider.segundoApellido = valor; },
                ),
                SizedBox( height: 10),
                InputWidget(
                  labelText : "Grado",
                  hintText  : "Ingrese el Grado del estudiante",
                  validacion: ( valor ) {
                    print( "valor validacion ");
                    print( valor );
                    return "PRUEBA ";
                  },
                  onChange: ( valor ) { formProvider.grado = valor; },
                ),
                SizedBox( height: 10),
                InputWidget(
                  labelText : "Seccion",
                  hintText  : "Ingrese la seccion del Eestudiantew",
                  validacion: ( valor ) {
                    print( "valor validacion ");
                    print( valor );
                    return "PRUEBA ";
                  },
                  onChange: ( valor ) { formProvider.seccion = valor; },
                )
              ],
            ),
          ),
      ),
    );

 }
}















