import 'package:flutter/material.dart';

class UltisWidget{


  void mostrarMensaje( BuildContext context, String mensaje, Color color ){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content         : Text(mensaje),
        backgroundColor : color,
      ),
    );

  }

}