import 'package:flutter/material.dart';


class FormdynamicProvider with ChangeNotifier{

  List<Map<String, dynamic>>   _lstForms = [];
  List<Map< String, dynamic>> lstCampos  = [];


  List<Map<String, dynamic>> get lstForms => _lstForms;

  void crearForm( { required String hashForm }){

    Map<String, dynamic> nuevoFormulario = {
      "hashForm": hashForm,
      "lstCampos": []
    };

    if (!_lstForms.any((form) => form['hash'] == hashForm)) {
      _lstForms.add(nuevoFormulario);

  }

  Future<void> asignarControlador({ required String hashForm,
    required String campo,
    required dynamic valor}) async {

    //ENCONTRAR EL FORMULARIO AL QUE SE VA A INGRESAR LOS DATOS

    final formulario = lstForms.firstWhere(
          (form) => form["hashForm"] == hashForm,
      orElse: () =>  {"hashForm": hashForm, "lstCampos": []},
    );

    //ASIGNAR LOS DATOS
    bool campoExiste = false;

    for (var campoExistente in formulario["lstCampos"]) {
      if (campoExistente.containsKey(campo)) {
        campoExistente[campo] = valor;
        campoExiste = true;
        break;
      }
    }
    if (!campoExiste) {
      formulario["lstCampos"].add({campo: valor});
    }

    notifyListeners();
  }



  Map<String, dynamic> obtenerDatos ( {required String hashForm} ) {

    final formulario = lstForms.firstWhere(
          (form) => form["hashForm"] == hashForm,
      orElse: () =>  {"hashForm": hashForm, "lstCampos": []},
    );
    return formulario;
  }


}

