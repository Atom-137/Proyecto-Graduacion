import 'package:flutter/material.dart';

class BotonGuardarWidget extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final String tituloBoton;
  final VoidCallback? fnGuardar;

  const BotonGuardarWidget ({
    super.key,
    required this.formKey,
    required this.tituloBoton,
    required this.fnGuardar
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          formKey.currentState?.save();
          fnGuardar!();
        },
        child: Text( tituloBoton )
    );
  }
}
