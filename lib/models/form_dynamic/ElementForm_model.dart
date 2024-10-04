import 'dart:convert';

import 'package:flutter/material.dart';

class ElementformModel {
  String                  tipoEleForm;
  String                  name;
  List?                   catalogo;
  String?                 labelKey;
  String                  label;
  bool                    disabled;
  List                    validaciones;
  bool?                   requerido;
  int                     icon;
  String?                 hintText;
  bool?                   obscureText;
  String?                 idList;
  String?                 nomList;
  TextInputType?          keyboarType;
  Function?               callback;
  int?                    maxLength;

  ElementformModel({
    required this.name,
    required this.label,
    required this.validaciones,
    required this.tipoEleForm,
    this.catalogo,
    this.labelKey,
    this.disabled = false,
    this.requerido = false,
    this.icon = 0,
    this.hintText = "",
    this.obscureText,
    this.idList = "id",
    this.nomList = "nombres",
    this.keyboarType,
    this.callback,
    this.maxLength
  });

  factory ElementformModel.fromRawJson(String str) => ElementformModel.fromJson(json.decode(str));

  factory ElementformModel.fromJson(Map<String, dynamic> json) => ElementformModel(
      name           : json["name"],
      catalogo       : json['catalogo'] is List ? json['catalogo'] : null,
      labelKey       : json['labelKey'],
      label          : json["label"] ?? "",
      disabled       : json["disabled"] ?? false,
      validaciones   : json["validaciones"],
      requerido      : json["requerido"],
      icon           : json["icon"] ?? 0,
      hintText       : json["hintText"] ?? "",
      obscureText    : json["obscureText"] ?? false,
      idList         : json['idList'] ?? "",
      nomList        : json['nomList'] ?? "",
      tipoEleForm    : json['tipoEleForm'],
      keyboarType    : json["keyboarType"],
      callback       : json["callback"],
      maxLength      : json["maxLength"]
  );

  Map<String, dynamic> toJson() => {
    "name"            : name,
    "catalogo"        : catalogo,
    "labelKey"        : labelKey,
    "label"           : label,
    "disabled"        : disabled,
    "validaciones"    : validaciones,
    "requerido"       : requerido,
    "icon"            : icon,
    "hintText"        : hintText,
    "obscureText"     : obscureText,
    "keyboarType"     : keyboarType,
    "callback"        : callback,
    "maxLength"       : maxLength
   };

}
