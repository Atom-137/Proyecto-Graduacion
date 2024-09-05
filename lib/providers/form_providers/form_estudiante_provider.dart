
import 'package:app_notas_v2/models/estudiante.dart';
import 'package:flutter/material.dart';

class FormEstudianteProvider with ChangeNotifier{

    final GlobalKey <FormState> formKey = GlobalKey<FormState>();

    String _primerNombre      = '';
    String _segundoNombre     = '';
    String _primerApellido    = '';
    String _segundoApellido   = '';
    String _cui               = '';

    String get primerNombre => _primerNombre;

    set primerNombre(String value) {
      _primerNombre = value;
      notifyListeners();
    }

    String get segundoNombre => _segundoNombre;

    set segundoNombre(String value) {
      _segundoNombre = value;
      notifyListeners();
    }

    String get cui => _cui;

    set cui(String value) {
      _cui = value;
      notifyListeners();
    }

    String get segundoApellido => _segundoApellido;

    set segundoApellido(String value) {
      _segundoApellido = value;
      notifyListeners();
    }

    String get primerApellido => _primerApellido;

    set primerApellido(String value) {
      _primerApellido = value;
      notifyListeners();
    }

    bool validarForm(){

       return formKey.currentState?.validate() ?? false;

    }


    Estudiante crearEstudainte(){
        return Estudiante(  primerNombre    : _primerNombre,
                            segundoNombre   : _segundoNombre,
                            primerApellido  : _primerApellido,
                            segundoApellido : _segundoApellido,
                            cui: cui
                        );
    }

}