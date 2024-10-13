import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class FormDynamicService {

  FormDynamicWidget obtenerFormulario(String tipo, [Function? callback]) {

    Map<String, dynamic> formAux = {};

    if (tipo == 'registrarEstudiante') {
      formAux = {
        "hash": tipo,
        "tipo": "form",
        "formulario": "Registro de Estudiante",
        "lstCampos": [
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "cui",
              label           : "CUI",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el CUI',
              keyboarType     : TextInputType.number,
              maxLength       : 13,
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "primerNombre",
              label           : "Primer Nombre",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Primer Nombre',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "segundoNombre",
              label           : "Segundo Nombre",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Segundo Nombre',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "primerApellido",
              label           : "Primer Apellido",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Primer Apellido',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "segundoApellido",
              label           : "Segundo Apellido",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Segundo Apellido',
              requerido       : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "grado",
              label         : "Grado Estudiante",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Ingrese el Grado del Estudiante',
              requerido     : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "user",
              label           : "Usuario Estudiante",
              validaciones    : [],
              maxLength       : 10,
              disabled        : false,
              hintText        : 'Ingrese el Usuario del Estudiante',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'botonGuardar',
              name            : "botonGuardar",
              label           : "Guardar Estudiante",
              disabled        : false,
              hintText        : 'Guardar Estudiante',
              callback        : callback,
              requerido       : true,
              validaciones    : [])
        ],
        "version": "1.0",
        "lstAcciones": [
          {"accion": "insertar"}
        ]
      };
    }

    else if ( tipo == 'registroMaestro'){

      formAux = {
        "hash": tipo,
        "tipo": "form",
        "formulario": "Formulario Registro de Maestros",
        "lstCampos": [
                    ElementformModel(
              tipoEleForm     : 'texto',
              name            : "cui",
              label           : "CUI",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el CUI',
              keyboarType     : TextInputType.number,
              maxLength       : 13,
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "primerNombre",
              label           : "Primer Nombre",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Primer Nombre',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "segundoNombre",
              label           : "Segundo Nombre",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Segundo Nombre',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "primerApellido",
              label           : "Primer Apellido",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Primer Apellido',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "segundoApellido",
              label           : "Segundo Apellido",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Segundo Apellido',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "correoElectronico",
              label           : "Correo Electronico",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Correo Electronico',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "user",
              label           : "Usuario Maestro",
              maxLength       : 10,
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Usuario del Maestro',
              requerido       : true),
          ElementformModel(
              tipoEleForm     : 'botonGuardar',
              name            : "botonGuardar",
              label           : "Guardar Maestro",
              disabled        : false,
              hintText        : 'Guardar Maestro',
              callback        : callback,
              requerido       : true,
              validaciones    : [])
        ],
        "version": "1.0",
        "lstAcciones": [
          {"accion": "insertar"}
        ]
      };

    }

    else if( tipo == 'registroGrados'){
      formAux = {
        "hash": tipo,
        "tipo": "form",
        "formulario": "Registro de Grados",
        "lstCampos": [
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "nombreGrado",
              label           : "Nombre Grado",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el Grado',
              requerido       : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "seccion",
              label         : "Seccion Grado",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione la seccion',
              requerido     : true),
          ElementformModel(
              tipoEleForm     : 'botonGuardar',
              name            : "botonGuardar",
              label           : "Guardar Grado",
              disabled        : false,
              hintText        : 'Guardar Grado',
              callback        : callback,
              requerido       : true,
              validaciones    : [])
        ],
        "version": "1.0",
        "lstAcciones": [
          {"accion": "insertar"}
        ]
      };


    }

    else if( tipo == 'registroCurso'){

      formAux = {
        "hash": tipo,
        "tipo": "form",
        "formulario": "Registro de Cursos",
        "lstCampos": [
          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "curso",
              label           : "Nombre Curso",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el nombre del curso',
              requerido       : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "maestro",
              label         : "Maestro Encargado",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione Maestro Encargado',
              requerido     : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "grado",
              label         : "Grado del Curso",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione Grado',
              requerido     : true),
          ElementformModel(
              tipoEleForm     : 'botonGuardar',
              name            : "botonGuardar",
              label           : "Guardar ",
              disabled        : false,
              hintText        : 'Guardar Grado',
              callback        : callback,
              requerido       : true,
              validaciones    : [])
        ],
        "version": "1.0",
        "lstAcciones": [
          {"accion": "insertar"}
        ]
      };
    }

    else if( tipo == 'registroCalificacion'){

      formAux = {
        "hash": tipo,
        "tipo": "form",
        "formulario": "Registro de Calificaciones",
        "lstCampos": [
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "estudiante",
              label         : "Seleccione al Estudiante",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione al Estudiante',
              requerido     : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "curso",
              label         : "Curso",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione el Curso',
              requerido     : true),
          ElementformModel(
              tipoEleForm   : 'dropdown',
              name          : "bimestre",
              label         : "Bimestre",
              validaciones  : [],
              disabled      : false,
              hintText      : 'Seleccione el Bimestre',
              requerido     : true),

          ElementformModel(
              tipoEleForm     : 'texto',
              name            : "calificacion",
              label           : "Ingrese la Nota del Bimestre",
              validaciones    : [],
              disabled        : false,
              hintText        : 'Ingrese el nombre del curso',
              requerido       : true),


          ElementformModel(
              tipoEleForm     : 'botonGuardar',
              name            : "botonGuardar",
              label           : "Guardar ",
              disabled        : false,
              hintText        : 'Guardar Grado',
              callback        : callback,
              requerido       : true,
              validaciones    : [])
        ],
        "version": "1.0",
        "lstAcciones": [
          {"accion": "insertar"}
        ]
      };
    }
    return FormDynamicWidget(formAux);
  }
}
