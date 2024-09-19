// To parse this JSON data, do
//
//     final respuestaApi = respuestaApiFromJson(jsonString);

import 'dart:convert';

RespuestaApi respuestaApiFromJson(String str) => RespuestaApi.fromJson(json.decode(str));

String respuestaApiToJson(RespuestaApi data) => json.encode(data.toJson());

class RespuestaApi {
  String respuesta;
  String mensaje;

  RespuestaApi({
    required this.respuesta,
    required this.mensaje,
  });

  factory RespuestaApi.fromJson(Map<String, dynamic> json) => RespuestaApi(
    respuesta: json["respuesta"],
    mensaje: json["mensaje"],
  );

  Map<String, dynamic> toJson() => {
    "respuesta": respuesta,
    "mensaje": mensaje,
  };
}
