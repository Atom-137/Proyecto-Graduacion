import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';


class FormDynamicService {

  Widget obtenerFormulario( String tipo, [Function? callback] ){

    Map <String, dynamic>  formAux = {};

    if( tipo == 'registrarEstudiante'){
      formAux = {
        "hash"        : tipo,
        "tipo"        : "form",
        "formulario"  : "Form Recuperar Codigo",
        "lstCampos"   : [
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "cui",
              label        : "CUI",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el CUI',
              keyboarType  : TextInputType.number,
              maxLength    : 13,
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "primerNombre",
              label        : "Primer Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Primer Nombre',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "segundoNombre",
              label        : "Segundo Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Segundo Nombre',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "primerApellido",
              label        : "Primer Apellido",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Primer Apellido',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "segundoApellido",
              label        : "Segundo Apellido",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Segundo Apellido',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "grado",
              label        : "Grado Estudiante",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Grado del Estudiante',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "seccion",
              label        : "Seccion Estudiante",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Grado del Estudiante',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "user",
              label        : "Usuario Estudiante",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Usuario del Estudiante',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'botonGuardar',
              name         : "botonGuardar",
              label        : "Guardar Estudiante",
              disabled     : false,
              hintText     : 'Guardar Estudiante',
              callback     : callback,
              requerido    : true,
              validaciones : [])
        ],
        "version"     : "1.0",
        "lstAcciones" : [{"accion": "insertar"}]
      };
    }


    return FormDynamicWidget( formAux );
  }
}