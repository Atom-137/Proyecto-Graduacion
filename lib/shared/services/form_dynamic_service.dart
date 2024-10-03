import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';


class FormDynamicService {

  Widget obtenerFormulario( String tipo ){

    Map <String, dynamic>  formAux          = {};

    if( tipo == 'recuperarCodigo'){
      formAux = {
        "hash"        : 'formRecuperarCodigo',
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
              name         : "nombre",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el CUI',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "nombreAsociado",
              label        : "Nombre Asociado",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Nombre Asociado',
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
    else if ( tipo == 'registroAsociado'){

      formAux = {
        "hash"        : 'formRegistroAsociado',
        "tipo"        : "form",
        "formulario"  : "Form Registro de Asociado",
        "lstCampos"   : [
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "cui",
              label        : "CUI",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el CUI Registro asociado',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "nombre",
              label        : "Nombre",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el CUI 2334',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "nombreAsociado",
              label        : "Nombre Asociado",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el Nombre Asociado',
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
    else if ( tipo == 'formGeneral'){

      formAux = {
        "hash"        : 'formGeneral',
        "tipo"        : "form",
        "formulario"  : "Form Registro de Asociado",
        "lstCampos"   : [
          ElementformModel(
              tipoEleForm  : 'texto',
              name         : "cui",
              label        : "CUI",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese el CUI Registro asociado',
              keyboarType  : TextInputType.number,
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'dropdown',
              name         : "drpodown",
              label        : "Dropdown de prueba",
              validaciones : [],
              disabled     : false,
              hintText     : 'Prueba de dropdown',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'checkbox',
              name         : "checkbox",
              label        : "Prueba de checkbos en form dinamico service",
              validaciones : [],
              disabled     : false,
              hintText     : 'Seleccione',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'radioButton',
              name         : "radioButton",
              label        : "Radio Button",
              validaciones : [],
              disabled     : false,
              hintText     : 'Radio Button',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'slider',
              name         : "slider",
              label        : "Slider Prueba",
              validaciones : [],
              disabled     : false,
              hintText     : 'Valor de Slider',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'fecha',
              name         : "fecha",
              label        : "Fechas 123",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese la fecha',
              requerido    : true),
          ElementformModel(
              tipoEleForm  : 'hora',
              name         : "hora",
              label        : "Hora Seleccion",
              validaciones : [],
              disabled     : false,
              hintText     : 'Ingrese la Hora',
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