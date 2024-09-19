import 'package:app_notas_v2/providers/form_providers/form_maestro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';


class RegistroEstudianteScreen extends StatelessWidget {
  const RegistroEstudianteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: ( _ ) => FormMaestroProvider(),
        child : _FormRegistroMaestro());
  }
}

class _FormRegistroMaestro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final formProviderMaestro = Provider.of<FormMaestroProvider>(context);
          return Scaffold(
                appBar: AppBar( title: const Text('Registro de Maestros')),
                body  : SingleChildScrollView(
                      child : Form(
                      key   : formProviderMaestro.formKeyMaestro,
                      child : Column(
                          children: [
                            InputWidget(
                              labelText : "CUI",
                              hintText  : "Ingrese el CUI del Maestro",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.cui = valor; },
                            ),
                            InputWidget(
                              labelText : "Primer Nombre",
                              hintText  : "Ingrese el Primer Nombre del Maestro",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.primerNombre = valor; },
                            ),
                             InputWidget(
                              labelText : "Segundo Nombre",
                              hintText  : "Ingrese el Segundo Nombre del Maestro",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.segundoNombre = valor; },
                            ),
                             InputWidget(
                              labelText : "Primer Apellido",
                              hintText  : "Ingrese el Primer Apellido",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.primerApellido = valor; },
                            ),
                             InputWidget(
                              labelText : "Segundo Apellido",
                              hintText  : "Ingrese el Segundo Apellido",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.segundoApellido = valor; },
                            ),
                             InputWidget(
                              labelText : "Correo Electronico",
                              hintText  : "Ingrese el Correo Electronico del Maestro",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.correoElectronico = valor; },
                            ),
                             InputWidget(
                              labelText : "CUI",
                              hintText  : "Ingrese el CUI del Maestro",
                              validacion: ( valor ) {
                                print( "valor validacion ");
                                print( valor );
                                return "PRUEBA ";
                              },
                              onChange: ( valor ) { formProviderMaestro.primerNombre = valor; },
                            ),

                          ],
                      ),
                  ),
                ),
          );
  }
}


