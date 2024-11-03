import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String userReset;

    return Scaffold(
      appBar: AppBar( title: const Text('Cambio de Contraseña')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            const Text('Ingrese su Usuario'),
            const SizedBox( height:  20,),
            TextFormField(onChanged: (value) => userReset = value ),
            const SizedBox( height:  20,),
            ElevatedButton(onPressed: () => {

            }, child: const Text('Restablecer Contraseña'))
          ],
      ),
    );
  }
}
