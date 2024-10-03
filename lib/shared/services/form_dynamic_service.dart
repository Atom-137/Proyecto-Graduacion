import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';


class FormDynamicService {

  Widget obtenerFormulario( String tipo ){

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
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "primerNombre",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Primer Nombre',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "segundoNombre",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Segundo Nombre',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "primerApellido",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Primer Apellido',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "segundoApellido",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Segundo Apellido',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "grado",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Grado del Estudiante',
              requerido    : true),
           ElementformModel(
              tipoEleForm  : 'texto',
              name         : "user",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Usuario del Estudiante',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'botonGuardar',
              name         : "botonGuardar",
              label        : "Guardar",
              disabled     : false,
              hintText     : 'Guardar Formulario',
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