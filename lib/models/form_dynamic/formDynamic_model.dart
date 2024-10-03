
import 'dart:convert';

import 'package:app_notas_v2/models/form_dynamic/ElementForm_model.dart';


class FormDynamic {
  String hash;
  String tipo;
  String formulario;
  List<ElementformModel> lstCampos;
  List? lstAcciones;
  Map<String,dynamic>? datosSincronizar;
  String version;

  List<dynamic> lstFormularios = [];

  FormDynamic({
    required this.hash,
    required this.tipo,
    required this.formulario,
    required this.lstCampos,
    this.lstAcciones,
    this.datosSincronizar,
    required this.version,
  });

  factory FormDynamic.fromRawJson(String str) => FormDynamic.fromJson(json.decode(str));

  factory FormDynamic.fromJson(Map<String, dynamic> json) {
    return FormDynamic(
        hash  : json['hash'],
        tipo  : json['tipo'],
        formulario: json['formulario'],
        lstCampos: json['lstCampos'],
        lstAcciones: json['lstAcciones'],
        version   : json['version']
    );
  }
  factory FormDynamic.fromJsonInterno(Map<String, dynamic> json) {
    return FormDynamic(
      hash  : json['hash'],
      tipo  : json['tipo'],
      formulario: json['formulario'],
      lstCampos: List<ElementformModel>.from(json['lstCampos']
          .map((campo) => campo)),
      datosSincronizar:json['datosSincronizar'],
      lstAcciones: json['lstAcciones'],
      version   : json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'tipo': tipo,
      'formulario': formulario,
      'lstCampos': jsonEncode(lstCampos),
      'lstAcciones': jsonEncode(lstAcciones),
      "datosSincronizar": jsonEncode(datosSincronizar),
      'version': version,
    };
  }

}