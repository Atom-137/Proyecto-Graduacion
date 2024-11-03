import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String userReset;

    return Scaffold(
      appBar: AppBar( title: Text('Cambio de Contraseña')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text('Ingrese su Usuario'),
            SizedBox( height:  20,),
            TextFormField(onChanged: (value) => userReset = value ),
            SizedBox( height:  20,),
            ElevatedButton(onPressed: () => {

            }, child: Text('Restablecer Contraseña'))
          ],
      ),
    );
  }
}
