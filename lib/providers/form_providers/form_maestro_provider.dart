import 'package:app_notas_v2/models/maestro.dart';
import 'package:flutter/material.dart';



class FormMaestroProvider extends ChangeNotifier{

  final GlobalKey <FormState> formKeyMaestro = GlobalKey<FormState>();

  String _primerNombre       = '';
  String _segundoNombre      = '';
  String _primerApellido     = '';
  String _segundoApellido    = '';
  String _correoElectronico  = '';
  String _cui                = '';

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

  String get correoElectronico => _correoElectronico;

  set correoElectronico(String value) {
    _correoElectronico = value;
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


  Map <String,String> obtenerDatosMaestro(){
      return  { 'primerNombre'      : _primerNombre,
                'segundoNombre'     : _segundoNombre,
                'primerApellido'    : _primerApellido,
                'segundoApellido'   : _segundoApellido,
                'correoElectronico' : _correoElectronico,
                'cui'               : _cui
              };
  }

  Maestro crearMaestro(){

      return Maestro( primerNombre      : _primerNombre,
                      segundoNombre     : _segundoNombre,
                      primerApellido    : _primerApellido,
                      segundoApellido   : _segundoApellido,
                      correoElectronico : _correoElectronico,
                      cui               : _cui);


  }

}
