import 'dart:convert';

import 'package:flutter/material.dart';


class FormdynamicProvider with ChangeNotifier {

  final List<Map<String, dynamic>> _lstForms  = [];
  Map<String, dynamic>              campos = {};


  List<Map<String, dynamic>> get lstForms => _lstForms;

  void crearForm({ required String hashForm }) {
    Map<String, dynamic> nuevoFormulario = {
      "hashForm": hashForm,
      "campos": {}
    };

    if (!_lstForms.any((form) => form['hash'] == hashForm)) {
      _lstForms.add(nuevoFormulario);
    }
  }
  Future<void> asignarControlador({ required String hashForm,
    required String campo,
    required dynamic valor}) async {

    final formulario = lstForms.firstWhere(
          (form) => form["hashForm"] == hashForm,
      orElse: () => {"hashForm": hashForm, "campos": {}},
    );

    //ASIGNAR LOS DATOS
    formulario['campos'][campo] = valor;

    notifyListeners();
  }


  String obtenerDatos({required String hashForm}) {
    final formulario = lstForms.firstWhere(
          (form) => form["hashForm"] == hashForm,
          orElse: () => {"hashForm": hashForm, "lstCampos": []},
    );
    return  jsonEncode(formulario);
  }
}

